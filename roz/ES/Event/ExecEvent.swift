//
//  ExecEvent.swift
//  roz
//
//  Created by Broman on 6/17/25.
//

import Foundation
import EndpointSecurity

/// Represents a call to `execve()`.
struct ExecEvent: ESEvent {
	/// The event type
	private(set) var type: ESEventType
	/// A file representing the CWD
	private(set) var cwd: ESFile
	/// The target process being executed
	private(set) var target: ESProcess
	/// The arguments passed to the associated process
	private(set) var args: [String]
	
	init?(eventType: es_event_type_t, event: es_events_t) throws {
		type = ESEventType.from(eventType)!
		guard case .notify(.exec) = type else { throw MessageError.typeMismatch }
		
		let event: es_event_exec_t = event.exec
		target = ESProcess(event.target.pointee)
		
		args = []
		var _event = event
		for arg in 0..<es_exec_arg_count(&_event) {
			args.append(Utility.extractCString(from: es_exec_arg(&_event, arg)))
		}
		cwd = ESFile(event.cwd.pointee)
		print(args)
	}
}
