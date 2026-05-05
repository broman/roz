//
//  NewClientError.swift
//  roz
//
//  Created by Broman on 6/14/25.
//

import Foundation
import EndpointSecurity

/// Thrown when creating a new EndpointSecurity client failed.
enum NewClientError: Error, LocalizedError {
	init?(from result: es_new_client_result_t) {
		switch result {
		case ES_NEW_CLIENT_RESULT_ERR_INTERNAL:
			self = .internalError
		case ES_NEW_CLIENT_RESULT_ERR_NOT_ENTITLED:
			self = .notEntitled
		case ES_NEW_CLIENT_RESULT_ERR_NOT_PERMITTED:
			self = .notPermitted
		case ES_NEW_CLIENT_RESULT_ERR_NOT_PRIVILEGED:
			self = .notRoot
		case ES_NEW_CLIENT_RESULT_ERR_INVALID_ARGUMENT:
			self = .invalidArgument
		case ES_NEW_CLIENT_RESULT_ERR_TOO_MANY_CLIENTS:
			self = .tooManyClients
		default: return nil
		}
	}

	/// Communicating with the ES subsystem failed.
    case internalError
	/// The attempt to create a new client contained one or more invalid arguments.
    case invalidArgument
	/// The caller isn't properly entitled to connect to Endpoint Security.
    case notEntitled
	/// The caller isn’t permitted to connect to Endpoint Security. This may occur when
	/// the client repeatedly misses deadlines for Auth events.
    case notPermitted
	/// The caller isn’t running as root.
    case notRoot
	/// The caller has reached the maximum allowed number of simultaneously connected clients.
    case tooManyClients
	
	var errorDescription: String? {
		switch self {
		case .internalError:
			return "Communicating with the Endpoint Security subsystem failed."
		case .invalidArgument:
			return "The attempt to create a new client contained one or more invalid arguments."
		case .notEntitled:
			return "The caller isn’t properly entitled to connect to Endpoint Security."
		case .notPermitted:
			return "The caller isn’t permitted to connect to Endpoint Security."
		case .notRoot:
			return "The caller isn’t running as root."
		case .tooManyClients:
			return "The caller has reached the maximum allowed number of simultaneously connected clients."
		}
	}
}
