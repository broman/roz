//
//  ESNotifyEventType.swift
//  roz
//
//  Half of es_event_type_t for notify events
//  Created by Broman on 6/10/25.
//

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
