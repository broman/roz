//
//  Utility.swift
//  roz
//
//  Created by Broman on 6/10/25.
//

import Foundation
import EndpointSecurity

final class Utility {
    static func extractCString(from token: es_string_token_t) -> String {
        String(decoding: UnsafeRawBufferPointer(start: token.data, count: Int(token.length)), as: UTF8.self)
    }

    static func convertToPid(_ token: audit_token_t) -> pid_t {
        pid_t(token.val.5)
    }
}
