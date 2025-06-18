//
//  ESFile.swift
//  roz
//
//  Created by Broman on 6/17/25.
//

import Foundation
import EndpointSecurity

/// Represents a file.
struct File {
	var path: String
	var truncated: Bool
	var stat: Stat
	
	init(_ file: es_file_t) {
		path = Utility.extractCString(from: file.path)
		truncated = file.path_truncated
		stat = Stat(file.stat)
	}
}
