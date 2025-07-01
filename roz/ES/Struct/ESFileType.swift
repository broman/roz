//
//  ESFileType.swift
//  roz
//
//  Created by Broman on 6/26/25.
//

import Foundation

public enum ESFileType: String {
    case regular
    case directory
    case symlink
    case characterDevice
    case blockDevice
    case fifo
    case socket
    case unknown

    public init(mode: mode_t) {
        switch mode & S_IFMT {
        case S_IFREG:  self = .regular
        case S_IFDIR:  self = .directory
        case S_IFLNK:  self = .symlink
        case S_IFCHR:  self = .characterDevice
        case S_IFBLK:  self = .blockDevice
        case S_IFIFO:  self = .fifo
        case S_IFSOCK: self = .socket
        default:       self = .unknown
        }
    }
}
