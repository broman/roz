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
		subcommands: [Start.self, Restart.self, Status.self, Test.self],
        defaultSubcommand: Start.self
    )

    struct Start: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Start monitoring execve calls")

        func run() throws {
            guard let client = RozClient() else {
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
	
	struct Test: ParsableCommand {
		static var configuration = CommandConfiguration(abstract: "Test")

		func run() throws {
			var client: ESClient?
			do {
				client = try ESClient()
			} catch let e as NewClientError {
				print("Could not create client: \(e.localizedDescription)")
			}
			print(client!.getClient()!)
			print("Client created")
		}
	}
}

Roz.main()
