//
//  SubscribeError.swift
//  roz
//
//  Created by Broman on 6/24/25.
//

import Foundation

/// Thrown when subscribing to an event fails via ``ESClient/subscribe()``
enum SubscribeError: Error, LocalizedError {
	/// The ``ESEventType`` passed is already registered.
	case alreadyRegistered
	
	var errorDescription: String? {
		switch self {
		case .alreadyRegistered:
			return "The event type passed is already reigstered."
		}
	}
}
