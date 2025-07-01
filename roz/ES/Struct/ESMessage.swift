//
//  ESMessage.swift
//  ESKit
//
//  Created by Broman on 6/14/25.
//

import Foundation
import EndpointSecurity

/// Represents a message from Endpoint Security.
/// 
/// Messages can either be Auth events or Notify events.
/// Clients that subscribe to Auth events must return `Bool` by their
/// handling functions to indicate whether the action is authorized to proceed.
/// Handling functions must return `Bool` before the time indicated by ``deadline``
/// or the client process may be terminated. Additionally, clients that frequently
/// miss deadlines may be prevented by the Endpoint Security Subsystem
/// from being created, indicated by ``NewClientError/notPermitted`` being thrown.
///
/// Notify events are triggered after the action has occured.
/// https://developer.apple.com/documentation/endpointsecurity/es_message_t
struct ESMessage {
	/// The ESEvent that triggered the message
	private(set) var event: any ESEvent
	/// For Auth events, the deadline by which subscribing functions must return `Bool`
	private(set) var deadline: Date
	/// The process that triggered the message
	private(set) var process: ESProcess
	/// The time the event occured
	private(set) var time: Date
	
	private init(_ msg: es_message_t) throws {
		do {
			deadline = Utility.dateFromMachAbsoluteTime(msg.deadline)
			process = ESProcess(msg.process.pointee)
			time = Utility.dateFromTimespec(msg.time)
			event = try ESMessage.getEvent(msg.event_type, msg.event)!
		}
	}
	
	static func getEvent(_ eventType: es_event_type_t, _ event: es_events_t) throws -> (any ESEvent)? {
		let type = ESEventType.from(eventType)
		do {
			switch(type) {
			case .notify(.exec): return try ExecEvent(event: event)!
			default: return nil
			}
		}
	}
	
	/// Creates ``ESMessage`` from `es_message_t`
	static func from(_ msg: es_message_t) throws -> ESMessage {
		do {
			return try ESMessage(msg)
		}
	}
}

/*
 
 public struct es_message_t {
	 public struct __Unnamed_union_action {
		 public init(auth: es_event_id_t)
		 public init(notify: es_result_t)
		 public init()
		 public var auth: es_event_id_t
		 public var notify: es_result_t
	 }
	 public var version: UInt32
	 public var time: timespec
	 public var mach_time: UInt64
	 public var deadline: UInt64
	 public var process: UnsafeMutablePointer<es_process_t>
	 public var seq_num: UInt64
	 public var action_type: es_action_type_t
	 public var action: es_message_t.__Unnamed_union_action
	 public var event_type: es_event_type_t
	 public var event: es_events_t
	 public var thread: UnsafeMutablePointer<es_thread_t>?
	 public var global_seq_num: UInt64
 }
 */
