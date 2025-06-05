//
//  main.swift
//  roz
//
//  Created by Broman on 6/5/25.
//

import Foundation
import EndpointSecurity

func extractCString(from token: es_string_token_t) -> String {
    return String(decoding: UnsafeRawBufferPointer(start: token.data, count: Int(token.length)), as: UTF8.self)
}

func audit_token_to_pid(_ token: audit_token_t) -> pid_t {
    // Linker doesn't like Darwin.Mach, reimplementing in Swift here
    return pid_t(token.val.5)
}

func handleExecveEvent(message: UnsafePointer<es_message_t>) {
    // Capture the ES_EVENT_TYPE_NOTIFY_EXEC event only
    guard message.pointee.event_type == ES_EVENT_TYPE_NOTIFY_EXEC else { return }
    var execEvent = message.pointee.event.exec
    let pid = audit_token_to_pid(message.pointee.process.pointee.audit_token)
    let executablePath = extractCString(from: execEvent.target.pointee.executable.pointee.path)
    let argCount = es_exec_arg_count(&execEvent)
    var args: [String] = []

    for i in 0..<argCount {
        // Collect the arguments from argv
        let token = es_exec_arg(&execEvent, i)
        args.append(extractCString(from: token))
    }

    let fullCommand = ([executablePath] + args.dropFirst()).joined(separator: " ")
    print("[\(pid)] execve: \(fullCommand)")
}

func main() {
    print("here")
    let args = CommandLine.arguments
    
    switch args[1] {
    case "status": print("status")
                   print(args)
    default: break
    }
}

func monitor() {
    var client: OpaquePointer?
    let result = es_new_client(&client) { client, message in
        handleExecveEvent(message: message)
    }

    guard result == ES_NEW_CLIENT_RESULT_SUCCESS, let client = client else {
        print("Failed to create ES client")
        return
    }

    let events: [es_event_type_t] = [ES_EVENT_TYPE_NOTIFY_EXEC]
    guard es_subscribe(client, events, UInt32(events.count)) == ES_RETURN_SUCCESS else {
        print("Failed to subscribe to exec events")
        es_delete_client(client)
        return
    }

    print("Monitoring execve with arguments...")
    RunLoop.current.run()
}

main()

