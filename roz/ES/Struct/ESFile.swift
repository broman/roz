//
//  ESFile.swift
//  roz
//
//  Created by Broman on 6/17/25.
//

import Foundation
import EndpointSecurity

/// Represents a file.
struct ESFile {
	private(set) var path: String
	private(set) var truncated: Bool
	private(set) var stat: ESStat
	
	init(_ file: es_file_t) {
		path = Utility.extractCString(from: file.path)
		truncated = file.path_truncated
		stat = ESStat(file.stat)
	}
}
