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
	var target: ESProcess
	
	init?(eventType: es_event_type_t, event: es_events_t) throws {
		let type = ESEventType.from(eventType)
		guard case .notify(.exec) = type else { throw MessageError.typeMismatch }
		
		let event: es_event_exec_t = event.exec
		target = ESProcess(event.target.pointee)
	}
}
