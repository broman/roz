//
//  Stat.swift
//  roz
//
//  Created by Broman on 6/17/25.
//

import Foundation

/// Represents a `stat(2)` file statistics struct from C
struct Stat {
	/// Device ID of the device containing the file
	let deviceID: UInt32
	/// Inode number
	let inode: UInt64
	/// File mode (permissions and file type)
	let mode: UInt16
	/// Number of hard links to the file
	let numLinks: UInt16
	/// User ID of the file’s owner
	let userID: UInt32
	/// Group ID of the file’s group
	let groupID: UInt32
	/// Device type (if this is a special file)
	let deviceType: UInt32
	/// Time of last access
	let accessTime: Date
	/// Time of last data modification
	let modificationTime: Date
	/// Time of last status change (metadata or permissions)
	let statusChangeTime: Date
	/// Time of file creation (birth time)
	let birthTime: Date
	/// Total size, in bytes
	let size: Int64
	/// Number of blocks allocated
	let blocks: Int64
	/// Optimal block size for I/O
	let blockSize: Int32
	/// User-defined flags for the file
	let flags: UInt32
	/// File generation number
	let gen: UInt32

	init(_ stat: stat) {
		self.deviceID = UInt32(stat.st_dev)
		self.inode = stat.st_ino
		self.mode = stat.st_mode
		self.numLinks = stat.st_nlink
		self.userID = stat.st_uid
		self.groupID = stat.st_gid
		self.deviceType = UInt32(stat.st_rdev)
		self.accessTime = Utility.dateFromTimeval(timeval(tv_sec: stat.st_atimespec.tv_sec, tv_usec: __darwin_suseconds_t(stat.st_atimespec.tv_nsec / 1000)))
		self.modificationTime = Utility.dateFromTimeval(timeval(tv_sec: stat.st_mtimespec.tv_sec, tv_usec: __darwin_suseconds_t(stat.st_mtimespec.tv_nsec / 1000)))
		self.statusChangeTime = Utility.dateFromTimeval(timeval(tv_sec: stat.st_ctimespec.tv_sec, tv_usec: __darwin_suseconds_t(stat.st_ctimespec.tv_nsec / 1000)))
		self.birthTime = Utility.dateFromTimeval(timeval(tv_sec: stat.st_birthtimespec.tv_sec, tv_usec: __darwin_suseconds_t(stat.st_birthtimespec.tv_nsec / 1000)))
		self.size = stat.st_size
		self.blocks = stat.st_blocks
		self.blockSize = stat.st_blksize
		self.flags = stat.st_flags
		self.gen = stat.st_gen
	}
}
