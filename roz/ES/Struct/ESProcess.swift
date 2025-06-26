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
	var executable: ESFile
	/// The time the process was called
	var startTime: Date
	/// The TTY associated with the process sending the message
	var tty: ESFile?
	/// The parent process ID
	var parentPid: pid_t
	/// The original parent process ID
	var originalParentPid: pid_t
	
	init(_ process: es_process_t) {
		isESClient = process.is_es_client
		isPlatformBinary = process.is_platform_binary
		executable = ESFile(process.executable.pointee)
		startTime = Utility.dateFromTimeval(process.start_time)
		if let _tty = process.tty?.pointee {
			tty = ESFile(_tty)
		} else {
			tty = nil
		}
		parentPid = process.ppid
		originalParentPid = process.original_ppid
	}
}

