//
//  Process.swift
//  roz
//
//  Created by Broman on 6/17/25.
//

import Foundation
import EndpointSecurity

/// Represents a macOS process.
struct ESProcess {
	/// Whether the process is an Endpoint Security client
	var isESClient: Bool?
	/// Whether the process is a platform binary
	var isPlatformBinary: Bool?
	/// File information for the called process
	var executable: File
	/// The time the process was called
	var startTime: Date
	
	init(process: es_process_t) {
		isESClient = process.is_es_client
		isPlatformBinary = process.is_platform_binary
		executable = File(process.executable.pointee)
		startTime = Utility.dateFromTimeval(process.start_time)
	}
}

