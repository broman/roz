//
//  main.swift
//  roz
//
//  Created by Broman on 6/5/25.
//

import Foundation
import ArgumentParser

struct Roz: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "A tool to monitor and inspect execve calls.",
        subcommands: [Start.self, Restart.self, Status.self],
        defaultSubcommand: Start.self
    )

    struct Start: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Start monitoring execve calls")

        func run() throws {
            guard let client = ESClient() else {
                print("Failed to create ES client")
                return
            }

            guard client.subscribeExec() else {
                print("Failed to subscribe to exec events")
                return
            }

            print("Monitoring exec calls...")
            client.run()
        }
    }

    struct Restart: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Restart the roz process")

        func run() throws {
            print("NYI")
        }
    }

    struct Status: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Roz status info")

        func run() throws {
            print("Status goes here")
        }
    }
}

Roz.main()
