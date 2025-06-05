//
//  main.swift
//  roz
//
//  Created by Broman on 6/5/25.
//

import Foundation
import EndpointSecurity
import ArgumentParser

// MARK: - ArgumentParser setup

struct Roz: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "A tool to monitor and inspect execve calls.",
        subcommands: [Start.self, Status.self],
        defaultSubcommand: Start.self
    )

    struct Start: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Start monitoring execve calls")

        func run() throws {
            monitor()
        }
    }

    struct Status: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Roz status info")

        func run() throws {
            status()
        }
    }
}

// MARK: - program logic

func monitor() {
    var client: OpaquePointer?
    let result = es_new_client(&client) { _, message in
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

func status() {
    print("Status: (placeholder) monitoring status not yet implemented.")
}

func extractCString(from token: es_string_token_t) -> String {
    String(decoding: UnsafeRawBufferPointer(start: token.data, count: Int(token.length)), as: UTF8.self)
}

func audit_token_to_pid(_ token: audit_token_t) -> pid_t {
    pid_t(token.val.5)
}

func handleExecveEvent(message: UnsafePointer<es_message_t>) {
    guard message.pointee.event_type == ES_EVENT_TYPE_NOTIFY_EXEC else { return }

    var execEvent = message.pointee.event.exec
    let pid = audit_token_to_pid(message.pointee.process.pointee.audit_token)
    let executablePath = extractCString(from: execEvent.target.pointee.executable.pointee.path)

    var args: [String] = []
    let argCount = es_exec_arg_count(&execEvent)
    for i in 0..<argCount {
        let token = es_exec_arg(&execEvent, i)
        args.append(extractCString(from: token))
    }

    let fullCommand = ([executablePath] + args.dropFirst()).joined(separator: " ")
    print("[\(pid)] \(fullCommand)")
}

// MARK: - entry point

Roz.main()

