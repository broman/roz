//
//  ChangeDirEvent.swift
//  roz
//
//  Created by Broman on 3/28/26.
//

import Foundation
import EndpointSecurity

/// An event that indicates a change to a process's working directory.
struct ChangeDirEvent: ESEvent {
    /// The new current working directory.
    private(set) var target: ESFile
    init?(event: es_events_t) throws {
        let event: es_event_chdir_t = event.chdir
        self.target = ESFile(event.target.pointee)
    }
}
