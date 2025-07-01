//
//  AccessEvent.swift
//  roz
//
//  Created by Broman on 6/26/25.
//

import Foundation
import EndpointSecurity

struct AccessEvent: ESEvent {
	private(set) var fileType: ESFileType
	private(set) var filePermissions: ESFilePermissions
	private(set) var file: ESFile
	
	init?(event: es_events_t) throws {
		fileType = ESFileType(mode: UInt16(event.access.mode))
		filePermissions = ESFilePermissions(rawValue: UInt16(event.access.mode))
		file = ESFile(event.access.target.pointee)
	}
}
