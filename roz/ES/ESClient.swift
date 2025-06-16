//
//  ESClient.swift
//  ESKit
//
//  Created by Broman on 6/14/25.
//

import Foundation
import EndpointSecurity

/**
    Represents an EndpointSecurity client.
 */
class ESClient {
    private var client: OpaquePointer?
    private var handlers: [(OpaquePointer, UnsafePointer<es_message_t>) -> Int]
    
    init(handlers: [(OpaquePointer, UnsafePointer<es_message_t>) -> Int]) throws {
        self.handlers = handlers
        try createClient(handlers: handlers)
    }

    func createClient(handlers: [(OpaquePointer, UnsafePointer<es_message_t>) -> Int]) throws -> Void {
        let result: es_new_client_result_t = es_new_client(&client) {_, message in
            self.handleEvent(message: message)
        }
        
        if(result != ES_NEW_CLIENT_RESULT_SUCCESS) {
            switch(result) {
            case ES_NEW_CLIENT_RESULT_ERR_INTERNAL:
                throw NewClientError.internalError
            case ES_NEW_CLIENT_RESULT_ERR_NOT_ENTITLED:
                throw NewClientError.notEntitled
            case ES_NEW_CLIENT_RESULT_ERR_NOT_PERMITTED:
                throw NewClientError.notPermitted
            case ES_NEW_CLIENT_RESULT_ERR_NOT_PRIVILEGED:
                throw NewClientError.notPermitted
            case ES_NEW_CLIENT_RESULT_ERR_INVALID_ARGUMENT:
                throw NewClientError.invalidArgument
            case ES_NEW_CLIENT_RESULT_ERR_TOO_MANY_CLIENTS:
                throw NewClientError.tooManyClients
            default: break;
            }
		}
    }
    
    func handleEvent(message: UnsafePointer<es_message_t>) {
        
    }
}

/**
 
 client = es_new_client(<#T##client: UnsafeMutablePointer<OpaquePointer?>##UnsafeMutablePointer<OpaquePointer?>#>, { <#OpaquePointer#>, <#UnsafePointer<es_message_t>#> in
     <#code#>
 })
 */
