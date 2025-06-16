//
//  Error.swift
//  ESKit
//
//  Created by Broman on 6/14/25.
//

enum NewClientError: Error {
    // Communicating with the Endpoint Security subsystem failed.
    case internalError
    // The attempt to create a new client contained one or more invalid arguments.
    case invalidArgument
    // The caller isn’t properly entitled to connect to Endpoint Security.
    case notEntitled
    // The caller isn’t permitted to connect to Endpoint Security.
    case notPermitted
    // The caller isn’t running as root.
    case notRoot
    // The caller has reached the maximum allowed number of simultaneously connected clients.
    case tooManyClients
}
