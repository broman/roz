//
//  ESClient.swift
//  ESKit
//
//  Created by Broman on 6/14/25.
//

import Foundation
import EndpointSecurity

/// Represents an Endpoint Security client.
class ESClient {
    private var client: OpaquePointer?
	private var authHandlers: [ESEventType.Auth : (ESMessage) -> Bool] = [:]
	private var notifyHandlers: [ESEventType.Notify : (ESMessage) -> Void] = [:]
    
	/// Try to create a new Endpoint Security client.
	/// - Throws: ``NewClientError`` if creating the client fails.
    init() throws {
        try createClient()
		subscribe()
		run()
    }

	func createClient() throws -> Void {
		let result: es_new_client_result_t = es_new_client(&client) {_, message in
			let _res = self.handleEvent(message: message)
            if(!_res!) {
                print("handleevent error?")
            }
		}
		
		if(result != ES_NEW_CLIENT_RESULT_SUCCESS) {
			throw NewClientError(from: result)!
		}
	}
    
    func handleEvent(message: UnsafePointer<es_message_t>) -> Bool? {
		let eventType = ESEventType.from(message.pointee.event_type)!
		var msg: ESMessage
		do {
			msg = try ESMessage.from(message.pointee)
			print(msg.deadline.ISO8601Format())
		} catch let e as MessageError {
			print(e)
			return nil
		} catch let e {
			print(e.localizedDescription)
			return nil
		}
		switch(eventType) {
		case .notify(let type):
			if let hnd = notifyHandlers[type] {
				hnd(msg)
			}
			break
		case .auth(let type):
			if let hnd = authHandlers[type] {
				return hnd(msg)
			}
			break
		}
		return nil
    }
	
	func subscribe() -> Void {
		guard let client = client else { return }
		es_subscribe(client, [ES_EVENT_TYPE_NOTIFY_EXEC], 1)
	}
	
	func subscribe(eventType: ESEventType.Auth, handler: @escaping (ESMessage) -> Bool) throws -> Void {
		if authHandlers.keys.contains(eventType) {
			throw SubscribeError.alreadyRegistered
		}
		authHandlers[eventType] = handler
		guard let client = client else { return }
		es_subscribe(client, [eventType.cEnum], 1)
		
	}
	
	func subscribe(eventType: ESEventType.Notify, handler: @escaping (ESMessage) -> Void) throws -> Void {
		if notifyHandlers.keys.contains(eventType) {
			throw SubscribeError.alreadyRegistered
		}
		notifyHandlers[eventType] = handler
	}
	
	func getClient() -> OpaquePointer? {
		return client
	}
	
	func run() {
		RunLoop.current.run()
	}
}
