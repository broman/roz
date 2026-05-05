//
//  Utility.swift
//  roz
//
//  Created by Broman on 6/10/25.
//

import Foundation
import EndpointSecurity

final class Utility {
    /// Converts from internal ES string token to Swift string representation
    static func extractCString(from token: es_string_token_t) -> String {
        String(decoding: UnsafeRawBufferPointer(start: token.data, count: Int(token.length)), as: UTF8.self)
    }

    static func convertToPid(_ token: audit_token_t) -> pid_t {
        pid_t(token.val.5)
    }
	
	static func dateFromTimeval(_ cTimeval: timeval) -> Date {
		let seconds = TimeInterval(cTimeval.tv_sec)
		let microseconds = TimeInterval(cTimeval.tv_usec) / 1_000_000
		return Date(timeIntervalSince1970: seconds + microseconds)
	}
	
	static func dateFromTimespec(_ ts: timespec) -> Date {
		let seconds = TimeInterval(ts.tv_sec)
		let nanoseconds = TimeInterval(ts.tv_nsec) / 1_000_000_000
		return Date(timeIntervalSince1970: seconds + nanoseconds)
	}
	
	static func dateFromMachAbsoluteTime(_ machTime: UInt64) -> Date {
		var timebaseInfo = mach_timebase_info_data_t()
		mach_timebase_info(&timebaseInfo)
		let ns = machTime * UInt64(timebaseInfo.numer) / UInt64(timebaseInfo.denom)
		let s = TimeInterval(ns) / 1_000_000_000
		let bootTime = Date() - ProcessInfo.processInfo.systemUptime
		return bootTime + s
	}
}
