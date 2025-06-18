//
//  Error.swift
//  ESKit
//
//  Created by Broman on 6/14/25.
//

import Foundation

/// Thrown when creating a new EndpointSecurity client failed.
enum NewClientError: Error, LocalizedError {
	/// Communicating with the ES subsystem failed.
    case internalError
	/// The attempt to create a new client contained one or more invalid arguments.
    case invalidArgument
	/// The caller isn't properly entitled to connect to Endpoint Security.
    case notEntitled
	/// The caller isn’t permitted to connect to Endpoint Security. This can also be thrown if the caller is not root.
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
			return "The caller isn’t permitted to connect to Endpoint Security (are you root?)."
		case .notRoot:
			return "The caller isn’t running as root."
		case .tooManyClients:
			return "The caller has reached the maximum allowed number of simultaneously connected clients."
		}
	}
}
