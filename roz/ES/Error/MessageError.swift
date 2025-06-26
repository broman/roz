//
//  MessageError.swift
//  roz
//
//  Created by Broman on 6/20/25.
//

import Foundation

/// Thrown when creating a new ``ESMessage`` fails.
enum MessageError: Error, LocalizedError {
	/// The event type and event do not match.
	case typeMismatch
	
	var errorDescription: String? {
		switch self {
		case .typeMismatch:
			return "The event type and event do not match."
		}
	}
}
