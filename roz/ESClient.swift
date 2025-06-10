//
//  ESClient.swift
//  roz
//
//  Created by Broman on 6/9/25.
//

import Foundation
import EndpointSecurity

final class ESClient {
    private var client: OpaquePointer?

    init?() {
        let result = es_new_client(&client) { _, message in
            guard message.pointee.event_type == ES_EVENT_TYPE_NOTIFY_EXEC else { return }

            var execEvent = message.pointee.event.exec
            let pid = pid_t(message.pointee.process.pointee.audit_token.val.5)
            let path = String(decoding: UnsafeRawBufferPointer(
                start: execEvent.target.pointee.executable.pointee.path.data,
                count: Int(execEvent.target.pointee.executable.pointee.path.length)
            ), as: UTF8.self)

            var args: [String] = []
            let count = es_exec_arg_count(&execEvent)
            for i in 0..<count {
                let token = es_exec_arg(&execEvent, i)
                args.append(String(decoding: UnsafeRawBufferPointer(
                    start: token.data,
                    count: Int(token.length)
                ), as: UTF8.self))
            }

            let fullCommand = ([path] + args.dropFirst()).joined(separator: " ")
            print("[\(pid)] \(fullCommand)")
        }

        guard result == ES_NEW_CLIENT_RESULT_SUCCESS, client != nil else {
            return nil
        }
    }

    func subscribeExec() -> Bool {
        guard let client else { return false }
        return es_subscribe(client, [ES_EVENT_TYPE_NOTIFY_EXEC], 1) == ES_RETURN_SUCCESS
    }

    func run() {
        RunLoop.current.run()
    }

    deinit {
        if let client {
            es_delete_client(client)
        }
    }
}
