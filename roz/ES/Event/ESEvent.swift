//
//  ESEvent.swift
//  roz
//
//  Created by Broman on 6/17/25.
//

import Foundation
import EndpointSecurity

protocol ESEvent {
	init?(eventType: es_event_type_t, event: es_events_t) throws
}
