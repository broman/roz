//
//  ESEventType.swift
//  roz
//  Half of es_event_type_t for auth events
//
//  Created by Broman on 6/10/25.
//
import EndpointSecurity

public enum ESAuthEventType: UInt32, CaseIterable {
    case exec                    = 1
    case open                    = 2
    case fork                    = 3
    case vnodeCreate             = 4
    case vnodeDelete             = 5
    case vnodeWrite              = 6
    case vnodeReadlink           = 7
    case vnodeExecute            = 8
    case vnodeRename             = 9
    case vnodeLink               = 10
    case fileProviderMaterialize = 11
    case fileProviderUpdate      = 12
    case lookup                  = 13
    case mount                   = 14
    case rename                  = 15
    case signal                  = 16
    case unlink                  = 17
    case setattr                 = 18
    case clone                   = 19
    case execMemProtection       = 20
}
