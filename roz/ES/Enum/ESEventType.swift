//
//  ESEventType.swift
//  roz
//
//  Created by Broman on 6/16/25.
//

import Foundation
import EndpointSecurity

/// Represents an event sent from the Endpoint Security subsystem.
///
/// Endpoint Security sends two types of actions:
/// - Authentication events are requests to perform an action.
///   Subscribing functions must return `Bool` to indicate whether the action is authorized.
/// - Notify events are informational events that indicate an action occurred.
public enum ESEventType {
	@_documentation(visibility: private)
	case auth(Auth)
	@_documentation(visibility: private)
	case notify(Notify)

	// MARK: - Authorization
	/// A request to perform an action.
	public enum Auth: CaseIterable {
		case chdir, chroot, clone, copyfile, create, deleteextattr
		case exchangedata, exec, fcntl, fileProviderMaterialize
		case fileProviderUpdate, fsgetpath, getattrlist, getextattr
		case getTask, getTaskRead, iokitOpen, kextload, link, listextattr
		case mmap, mount, mprotect, open, procCheck, procSuspendResume
		case readlink, readdir, remount, rename, searchfs, setattrlist
		case setacl, setextattr, setflags, setmode, setowner, settime
		case signal, truncate, uipcBind, uipcConnect, unlink, utimes

		public var esEventType: es_event_type_t {
			switch self {
			case .chdir: return ES_EVENT_TYPE_AUTH_CHDIR
			case .chroot: return ES_EVENT_TYPE_AUTH_CHROOT
			case .clone: return ES_EVENT_TYPE_AUTH_CLONE
			case .copyfile: return ES_EVENT_TYPE_AUTH_COPYFILE
			case .create: return ES_EVENT_TYPE_AUTH_CREATE
			case .deleteextattr: return ES_EVENT_TYPE_AUTH_DELETEEXTATTR
			case .exchangedata: return ES_EVENT_TYPE_AUTH_EXCHANGEDATA
			case .exec: return ES_EVENT_TYPE_AUTH_EXEC
			case .fcntl: return ES_EVENT_TYPE_AUTH_FCNTL
			case .fileProviderMaterialize: return ES_EVENT_TYPE_AUTH_FILE_PROVIDER_MATERIALIZE
			case .fileProviderUpdate: return ES_EVENT_TYPE_AUTH_FILE_PROVIDER_UPDATE
			case .fsgetpath: return ES_EVENT_TYPE_AUTH_FSGETPATH
			case .getattrlist: return ES_EVENT_TYPE_AUTH_GETATTRLIST
			case .getextattr: return ES_EVENT_TYPE_AUTH_GETEXTATTR
			case .getTask: return ES_EVENT_TYPE_AUTH_GET_TASK
			case .getTaskRead: return ES_EVENT_TYPE_AUTH_GET_TASK_READ
			case .iokitOpen: return ES_EVENT_TYPE_AUTH_IOKIT_OPEN
			case .kextload: return ES_EVENT_TYPE_AUTH_KEXTLOAD
			case .link: return ES_EVENT_TYPE_AUTH_LINK
			case .listextattr: return ES_EVENT_TYPE_AUTH_LISTEXTATTR
			case .mmap: return ES_EVENT_TYPE_AUTH_MMAP
			case .mount: return ES_EVENT_TYPE_AUTH_MOUNT
			case .mprotect: return ES_EVENT_TYPE_AUTH_MPROTECT
			case .open: return ES_EVENT_TYPE_AUTH_OPEN
			case .procCheck: return ES_EVENT_TYPE_AUTH_PROC_CHECK
			case .procSuspendResume: return ES_EVENT_TYPE_AUTH_PROC_SUSPEND_RESUME
			case .readlink: return ES_EVENT_TYPE_AUTH_READLINK
			case .readdir: return ES_EVENT_TYPE_AUTH_READDIR
			case .remount: return ES_EVENT_TYPE_AUTH_REMOUNT
			case .rename: return ES_EVENT_TYPE_AUTH_RENAME
			case .searchfs: return ES_EVENT_TYPE_AUTH_SEARCHFS
			case .setattrlist: return ES_EVENT_TYPE_AUTH_SETATTRLIST
			case .setacl: return ES_EVENT_TYPE_AUTH_SETACL
			case .setextattr: return ES_EVENT_TYPE_AUTH_SETEXTATTR
			case .setflags: return ES_EVENT_TYPE_AUTH_SETFLAGS
			case .setmode: return ES_EVENT_TYPE_AUTH_SETMODE
			case .setowner: return ES_EVENT_TYPE_AUTH_SETOWNER
			case .settime: return ES_EVENT_TYPE_AUTH_SETTIME
			case .signal: return ES_EVENT_TYPE_AUTH_SIGNAL
			case .truncate: return ES_EVENT_TYPE_AUTH_TRUNCATE
			case .uipcBind: return ES_EVENT_TYPE_AUTH_UIPC_BIND
			case .uipcConnect: return ES_EVENT_TYPE_AUTH_UIPC_CONNECT
			case .unlink: return ES_EVENT_TYPE_AUTH_UNLINK
			case .utimes: return ES_EVENT_TYPE_AUTH_UTIMES
			}
		}
	}

	// MARK: - Notifications
	/// A notification that an action occured.
	public enum Notify: CaseIterable {
		case access, authentication, btmLaunchItemAdd, btmLaunchItemRemove
		case chdir, chroot, clone, close, copyfile, create
		case csInvalidated, deleteextattr, dup, exec, exchangedata
		case exit, fcntl, fileProviderMaterialize, fileProviderUpdate
		case fork, fsgetpath, getattrlist, getextattr, getTask
		case getTaskInspect, getTaskName, gatekeeperUserOverride
		case iokitOpen, kextload, kextunload, link, listextattr
		case loginLogin, loginLogout, lookup, lwSessionLogin
		case lwSessionLogout, lwSessionLock, lwSessionUnlock
		case odAttributeSet, odAttributeValueAdd, odAttributeValueRemove
		case odCreateGroup, odCreateUser, odDeleteGroup, odDeleteUser
		case odDisableUser, odEnableUser, odGroupAdd, odGroupRemove
		case odGroupSet, odModifyPassword, open, opensshLogin
		case opensshLogout, procCheck, procSuspendResume, profileAdd
		case profileRemove, ptyClose, ptyGrant, readlink, readdir
		case remount, rename, remoteThreadCreate, screensharingAttach
		case screensharingDetach, searchfs, setattrlist, setacl
		case setextattr, setflags, setgid, setmode, setowner
		case setregid, setreuid, setegid, seteuid, settime
		case setuid, signal, stat, sudo, su, tccModify
		case trace, truncate, uipcBind, uipcConnect, unlink
		case write, xpcConnect, xpMalwareDetected, xpMalwareRemediated

		public var esEventType: es_event_type_t {
			switch self {
			case .access: return ES_EVENT_TYPE_NOTIFY_ACCESS
			case .authentication: return ES_EVENT_TYPE_NOTIFY_AUTHENTICATION
			case .btmLaunchItemAdd: return ES_EVENT_TYPE_NOTIFY_BTM_LAUNCH_ITEM_ADD
			case .btmLaunchItemRemove: return ES_EVENT_TYPE_NOTIFY_BTM_LAUNCH_ITEM_REMOVE
			case .chdir: return ES_EVENT_TYPE_NOTIFY_CHDIR
			case .chroot: return ES_EVENT_TYPE_NOTIFY_CHROOT
			case .clone: return ES_EVENT_TYPE_NOTIFY_CLONE
			case .close: return ES_EVENT_TYPE_NOTIFY_CLOSE
			case .copyfile: return ES_EVENT_TYPE_NOTIFY_COPYFILE
			case .create: return ES_EVENT_TYPE_NOTIFY_CREATE
			case .csInvalidated: return ES_EVENT_TYPE_NOTIFY_CS_INVALIDATED
			case .deleteextattr: return ES_EVENT_TYPE_NOTIFY_DELETEEXTATTR
			case .dup: return ES_EVENT_TYPE_NOTIFY_DUP
			case .exec: return ES_EVENT_TYPE_NOTIFY_EXEC
			case .exchangedata: return ES_EVENT_TYPE_NOTIFY_EXCHANGEDATA
			case .exit: return ES_EVENT_TYPE_NOTIFY_EXIT
			case .fcntl: return ES_EVENT_TYPE_NOTIFY_FCNTL
			case .fileProviderMaterialize: return ES_EVENT_TYPE_NOTIFY_FILE_PROVIDER_MATERIALIZE
			case .fileProviderUpdate: return ES_EVENT_TYPE_NOTIFY_FILE_PROVIDER_UPDATE
			case .fork: return ES_EVENT_TYPE_NOTIFY_FORK
			case .fsgetpath: return ES_EVENT_TYPE_NOTIFY_FSGETPATH
			case .getTask: return ES_EVENT_TYPE_NOTIFY_GET_TASK
			case .getTaskInspect: return ES_EVENT_TYPE_NOTIFY_GET_TASK_INSPECT
			case .getTaskName: return ES_EVENT_TYPE_NOTIFY_GET_TASK_NAME
			case .gatekeeperUserOverride: return ES_EVENT_TYPE_NOTIFY_GATEKEEPER_USER_OVERRIDE
			case .getattrlist: return ES_EVENT_TYPE_NOTIFY_GETATTRLIST
			case .getextattr: return ES_EVENT_TYPE_NOTIFY_GETEXTATTR
			case .iokitOpen: return ES_EVENT_TYPE_NOTIFY_IOKIT_OPEN
			case .kextload: return ES_EVENT_TYPE_NOTIFY_KEXTLOAD
			case .kextunload: return ES_EVENT_TYPE_NOTIFY_KEXTUNLOAD
			case .link: return ES_EVENT_TYPE_NOTIFY_LINK
			case .listextattr: return ES_EVENT_TYPE_NOTIFY_LISTEXTATTR
			case .loginLogin: return ES_EVENT_TYPE_NOTIFY_LOGIN_LOGIN
			case .loginLogout: return ES_EVENT_TYPE_NOTIFY_LOGIN_LOGOUT
			case .lookup: return ES_EVENT_TYPE_NOTIFY_LOOKUP
			case .lwSessionLogin: return ES_EVENT_TYPE_NOTIFY_LW_SESSION_LOGIN
			case .lwSessionLogout: return ES_EVENT_TYPE_NOTIFY_LW_SESSION_LOGOUT
			case .lwSessionLock: return ES_EVENT_TYPE_NOTIFY_LW_SESSION_LOCK
			case .lwSessionUnlock: return ES_EVENT_TYPE_NOTIFY_LW_SESSION_UNLOCK
			case .odAttributeSet: return ES_EVENT_TYPE_NOTIFY_OD_ATTRIBUTE_SET
			case .odAttributeValueAdd: return ES_EVENT_TYPE_NOTIFY_OD_ATTRIBUTE_VALUE_ADD
			case .odAttributeValueRemove: return ES_EVENT_TYPE_NOTIFY_OD_ATTRIBUTE_VALUE_REMOVE
			case .odCreateGroup: return ES_EVENT_TYPE_NOTIFY_OD_CREATE_GROUP
			case .odCreateUser: return ES_EVENT_TYPE_NOTIFY_OD_CREATE_USER
			case .odDeleteGroup: return ES_EVENT_TYPE_NOTIFY_OD_DELETE_GROUP
			case .odDeleteUser: return ES_EVENT_TYPE_NOTIFY_OD_DELETE_USER
			case .odDisableUser: return ES_EVENT_TYPE_NOTIFY_OD_DISABLE_USER
			case .odEnableUser: return ES_EVENT_TYPE_NOTIFY_OD_ENABLE_USER
			case .odGroupAdd: return ES_EVENT_TYPE_NOTIFY_OD_GROUP_ADD
			case .odGroupRemove: return ES_EVENT_TYPE_NOTIFY_OD_GROUP_REMOVE
			case .odGroupSet: return ES_EVENT_TYPE_NOTIFY_OD_GROUP_SET
			case .odModifyPassword: return ES_EVENT_TYPE_NOTIFY_OD_MODIFY_PASSWORD
			case .open: return ES_EVENT_TYPE_NOTIFY_OPEN
			case .opensshLogin: return ES_EVENT_TYPE_NOTIFY_OPENSSH_LOGIN
			case .opensshLogout: return ES_EVENT_TYPE_NOTIFY_OPENSSH_LOGOUT
			case .procCheck: return ES_EVENT_TYPE_NOTIFY_PROC_CHECK
			case .procSuspendResume: return ES_EVENT_TYPE_NOTIFY_PROC_SUSPEND_RESUME
			case .profileAdd: return ES_EVENT_TYPE_NOTIFY_PROFILE_ADD
			case .profileRemove: return ES_EVENT_TYPE_NOTIFY_PROFILE_REMOVE
			case .ptyClose: return ES_EVENT_TYPE_NOTIFY_PTY_CLOSE
			case .ptyGrant: return ES_EVENT_TYPE_NOTIFY_PTY_GRANT
			case .readlink: return ES_EVENT_TYPE_NOTIFY_READLINK
			case .readdir: return ES_EVENT_TYPE_NOTIFY_READDIR
			case .remount: return ES_EVENT_TYPE_NOTIFY_REMOUNT
			case .rename: return ES_EVENT_TYPE_NOTIFY_RENAME
			case .remoteThreadCreate: return ES_EVENT_TYPE_NOTIFY_REMOTE_THREAD_CREATE
			case .screensharingAttach: return ES_EVENT_TYPE_NOTIFY_SCREENSHARING_ATTACH
			case .screensharingDetach: return ES_EVENT_TYPE_NOTIFY_SCREENSHARING_DETACH
			case .searchfs: return ES_EVENT_TYPE_NOTIFY_SEARCHFS
			case .setattrlist: return ES_EVENT_TYPE_NOTIFY_SETATTRLIST
			case .setacl: return ES_EVENT_TYPE_NOTIFY_SETACL
			case .setextattr: return ES_EVENT_TYPE_NOTIFY_SETEXTATTR
			case .setflags: return ES_EVENT_TYPE_NOTIFY_SETFLAGS
			case .setgid: return ES_EVENT_TYPE_NOTIFY_SETGID
			case .setmode: return ES_EVENT_TYPE_NOTIFY_SETMODE
			case .setowner: return ES_EVENT_TYPE_NOTIFY_SETOWNER
			case .setregid: return ES_EVENT_TYPE_NOTIFY_SETREGID
			case .setreuid: return ES_EVENT_TYPE_NOTIFY_SETREUID
			case .setegid: return ES_EVENT_TYPE_NOTIFY_SETEGID
			case .seteuid: return ES_EVENT_TYPE_NOTIFY_SETEUID
			case .settime: return ES_EVENT_TYPE_NOTIFY_SETTIME
			case .setuid: return ES_EVENT_TYPE_NOTIFY_SETUID
			case .signal: return ES_EVENT_TYPE_NOTIFY_SIGNAL
			case .stat: return ES_EVENT_TYPE_NOTIFY_STAT
			case .sudo: return ES_EVENT_TYPE_NOTIFY_SUDO
			case .su: return ES_EVENT_TYPE_NOTIFY_SU
			case .tccModify: return ES_EVENT_TYPE_NOTIFY_TCC_MODIFY
			case .trace: return ES_EVENT_TYPE_NOTIFY_TRACE
			case .truncate: return ES_EVENT_TYPE_NOTIFY_TRUNCATE
			case .uipcBind: return ES_EVENT_TYPE_NOTIFY_UIPC_BIND
			case .uipcConnect: return ES_EVENT_TYPE_NOTIFY_UIPC_CONNECT
			case .unlink: return ES_EVENT_TYPE_NOTIFY_UNLINK
			case .write: return ES_EVENT_TYPE_NOTIFY_WRITE
			case .xpcConnect: return ES_EVENT_TYPE_NOTIFY_XPC_CONNECT
			case .xpMalwareDetected: return ES_EVENT_TYPE_NOTIFY_XP_MALWARE_DETECTED
			case .xpMalwareRemediated: return ES_EVENT_TYPE_NOTIFY_XP_MALWARE_REMEDIATED
			}
		}
	}

	/// Returns ``ESEventType`` from the C API's `es_event_type_t`.
	public static func from(_ type: es_event_type_t) -> ESEventType? {
		if let auth = Auth.allCases.first(where: { $0.esEventType == type }) {
			return .auth(auth)
		}
		if let notify = Notify.allCases.first(where: { $0.esEventType == type }) {
			return .notify(notify)
		}
		return nil
	}

	/// Returns the C API representation of the event.
	public var asRaw: es_event_type_t {
		switch self {
		case .auth(let a): return a.esEventType
		case .notify(let n): return n.esEventType
		}
	}
}
