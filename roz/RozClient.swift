//
//  ESClient.swift
//  roz
//
//  Created by Broman on 6/9/25.
//

import Foundation
import EndpointSecurity
import Darwin

final class RozClient {
    private var client: OpaquePointer?

    init?() {
        let result = es_new_client(&client) { _, message in
            guard message.pointee.event_type == ES_EVENT_TYPE_NOTIFY_EXEC else { return }

            var execEvent = message.pointee.event.exec

            let process = message.pointee.process.pointee
            let ppid = process.ppid

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

            let parentPath = RozClient.getExecPath(pid: ppid) ?? "unknown (pipe?)"
            
            if RozClient.isShell(shellPath: parentPath) {
                let fullCommand = ([path] + args.dropFirst()).joined(separator: " ")
                print("[\(parentPath)] \(fullCommand)")
            }
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

    private static func getExecPath(pid: pid_t) -> String? {
        let bufferSize = Int(MAXPATHLEN)
        var pathBuffer = [CChar](repeating: 0, count: bufferSize)
        let result = proc_pidpath(pid, &pathBuffer, UInt32(bufferSize))
        if result > 0 {
            return String(cString: pathBuffer)
        } else {
            return nil
        }
    }
    
    private static func isShell(shellPath: String) -> Bool {
        let shells: Set<String> = [
            "/bin/bash",
            "/bin/zsh",
            "/bin/sh",
            "/usr/local/bin/fish",
            "/opt/homebrew/bin/fish",
            "/usr/local/bin/bash",
            "/usr/local/bin/zsh",
            "/usr/bin/login"
        ]
        return shells.contains(shellPath)
    }

}

