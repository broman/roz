//
//  AccessEvent.swift
//  roz
//
//  Created by Broman on 6/26/25.
//

import Foundation
import EndpointSecurity

/// Represents an accessed file.
struct AccessEvent: ESEvent {
    /// The type of file accessed.
	private(set) var fileType: ESFileType
    /// The file's permissions.
	private(set) var filePermissions: ESFilePermissions
    /// The file.
	private(set) var file: ESFile
	
	init?(event: es_events_t) throws {
        let event: es_event_access_t = event.access
		fileType = ESFileType(mode: UInt16(event.mode))
		filePermissions = ESFilePermissions(rawValue: UInt16(event.mode))
		file = ESFile(event.target.pointee)
	}
}
