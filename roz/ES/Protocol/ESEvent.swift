//
//  ESEvent.swift
//  roz
//
//  Created by Broman on 6/17/25.
//

import Foundation
import EndpointSecurity

protocol ESEvent {
	init?(event: es_events_t) throws
}
