//
//  ESEventType.swift
//  roz
//
//  Created by Broman on 6/10/25.
//

import EndpointSecurity

public enum ESEventType: Equatable {
    case auth(ESAuthEventType)
    case notify(ESNotifyEventType)

    public var rawValue: UInt32 {
        switch self {
        case .auth(let event):   return event.rawValue
        case .notify(let event): return event.rawValue
        }
    }

    public init?(rawValue: UInt32) {
        if let auth = ESAuthEventType(rawValue: rawValue) {
            self = .auth(auth)
        } else if let notify = ESNotifyEventType(rawValue: rawValue) {
            self = .notify(notify)
        } else {
            return nil
        }
    }
}

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

public enum ESNotifyEventType: UInt32, CaseIterable {
    case exec                    = 0x00010001
    case fork                    = 0x00010002
    case open                    = 0x00010003
    case create                  = 0x00010004
    case exit                    = 0x00010005
    case unlink                  = 0x00010006
    case rename                  = 0x00010007
    case signal                  = 0x00010008
    case setattr                 = 0x00010009
    case vnodeCreate             = 0x0001000A
    case vnodeDelete             = 0x0001000B
    case vnodeWrite              = 0x0001000C
    case vnodeReadlink           = 0x0001000D
    case vnodeExecute            = 0x0001000E
    case fileProviderMaterialize = 0x0001000F
    case fileProviderUpdate      = 0x00010010
    case mount                   = 0x00010011
    case access                  = 0x00010012
    case lookup                  = 0x00010013
    case xattr                   = 0x00010014
    case clone                   = 0x00010015
    case execMemProtection       = 0x00010016
    case trace                   = 0x00010017
    case remoteThreadCreate      = 0x00010018
}
