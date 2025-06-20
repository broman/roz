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
    
	/// Try to create a new Endpoint Security client.
	/// - Throws: ``NewClientError`` if creating the client fails.
    init() throws {
        try createClient()
		subscribe()
		run()
    }

	func createClient() throws -> Void {
		let result: es_new_client_result_t = es_new_client(&client) {_, message in
			self.handleEvent(message: message)
		}
		
		if(result != ES_NEW_CLIENT_RESULT_SUCCESS) {
			throw NewClientError(from: result)!
		}
	}
    
    func handleEvent(message: UnsafePointer<es_message_t>) -> Void {
		let eventType = ESEventType.from(message.pointee.event_type)!
		var msg: ESMessage
		do {
			msg = try ESMessage.from(message.pointee)
			print(msg.deadline.ISO8601Format())
		} catch let e as MessageError {

		} catch {
			
		}
		switch(eventType) {
		case .notify(.exec): print("Exec event!!");
		default: break;
		}
    }
	
	func subscribe() -> Void {
		guard let client = client else { return }
		es_subscribe(client, [ES_EVENT_TYPE_NOTIFY_EXEC], 1)
	}
	
	func getClient() -> OpaquePointer? {
		return client
	}
	
	func run() {
		RunLoop.current.run()
	}
}
