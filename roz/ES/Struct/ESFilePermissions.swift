//
//  ESFilePermissions.swift
//  roz
//
//  Created by Broman on 6/26/25.
//

import Foundation

public struct ESFilePermissions: OptionSet {
    public let rawValue: mode_t

    public init(rawValue: mode_t) {
        self.rawValue = rawValue
    }

    public static let ownerRead    = ESFilePermissions(rawValue: S_IRUSR)
    public static let ownerWrite   = ESFilePermissions(rawValue: S_IWUSR)
    public static let ownerExecute = ESFilePermissions(rawValue: S_IXUSR)

    public static let groupRead    = ESFilePermissions(rawValue: S_IRGRP)
    public static let groupWrite   = ESFilePermissions(rawValue: S_IWGRP)
    public static let groupExecute = ESFilePermissions(rawValue: S_IXGRP)

    public static let otherRead    = ESFilePermissions(rawValue: S_IROTH)
    public static let otherWrite   = ESFilePermissions(rawValue: S_IWOTH)
    public static let otherExecute = ESFilePermissions(rawValue: S_IXOTH)
}
