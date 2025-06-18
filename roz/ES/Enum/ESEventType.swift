//
//  ESEventType.swift
//  roz
//
//  Created by Broman on 6/16/25.
//

import Foundation
import EndpointSecurity

public enum ESEventType: CaseIterable {
	case authExec
	case authOpen
	case authKextload
	case authMmap
	case authMprotect
	case authMount
	case authRename
	case authSignal
	case authUnlink
	case notifyExec
	case notifyOpen
	case notifyFork
	case notifyClose
	case notifyCreate
	case notifyExchangedata
	case notifyExit
	case notifyGetTask
	case notifyKextload
	case notifyKextunload
	case notifyLink
	case notifyMmap
	case notifyMprotect
	case notifyMount
	case notifyUnmount
	case notifyIokitOpen
	case notifyRename
	case notifySetattrlist
	case notifySetextattr
	case notifySetflags
	case notifySetmode
	case notifySetowner
	case notifySignal
	case notifyUnlink
	case notifyWrite
	case authFileProviderMaterialize
	case notifyFileProviderMaterialize
	case authFileProviderUpdate
	case notifyFileProviderUpdate
	case authReadlink
	case notifyReadlink
	case authTruncate
	case notifyTruncate
	case authLink
	case notifyLookup
	case authCreate
	case authSetattrlist
	case authSetextattr
	case authSetflags
	case authSetmode
	case authSetowner
	case authChdir
	case notifyChdir
	case authGetattrlist
	case notifyGetattrlist
	case notifyStat
	case notifyAccess
	case authChroot
	case notifyChroot
	case authUtimes
	case notifyUtimes
	case authClone
	case notifyClone
	case notifyFcntl
	case authGetextattr
	case notifyGetextattr
	case authListextattr
	case notifyListextattr
	case authReaddir
	case notifyReaddir
	case authDeleteextattr
	case notifyDeleteextattr
	case authFsgetpath
	case notifyFsgetpath
	case notifyDup
	case authSettime
	case notifySettime
	case notifyUipcBind
	case authUipcBind
	case notifyUipcConnect
	case authUipcConnect
	case authExchangedata
	case authSetacl
	case notifySetacl
	case notifyPtyGrant
	case notifyPtyClose
	case authProcCheck
	case notifyProcCheck
	case authGetTask
	case authSearchfs
	case notifySearchfs
	case authFcntl
	case authIokitOpen
	case authProcSuspendResume
	case notifyProcSuspendResume
	case notifyCsInvalidated
	case notifyGetTaskName
	case notifyTrace
	case notifyRemoteThreadCreate
	case authRemount
	case notifyRemount
	case authGetTaskRead
	case notifyGetTaskRead
	case notifyGetTaskInspect
	case notifySetuid
	case notifySetgid
	case notifySeteuid
	case notifySetegid
	case notifySetreuid
	case notifySetregid
	case authCopyfile
	case notifyCopyfile
	case notifyAuthentication
	case notifyXpMalwareDetected
	case notifyXpMalwareRemediated
	case notifyLwSessionLogin
	case notifyLwSessionLogout
	case notifyLwSessionLock
	case notifyLwSessionUnlock
	case notifyScreensharingAttach
	case notifyScreensharingDetach
	case notifyOpensshLogin
	case notifyOpensshLogout
	case notifyLoginLogin
	case notifyLoginLogout
	case notifyBtmLaunchItemAdd
	case notifyBtmLaunchItemRemove
	case notifyProfileAdd
	case notifyProfileRemove
	case notifySu
	case notifyAuthorizationPetition
	case notifyAuthorizationJudgement
	case notifySudo
	case notifyOdGroupAdd
	case notifyOdGroupRemove
	case notifyOdGroupSet
	case notifyOdModifyPassword
	case notifyOdDisableUser
	case notifyOdEnableUser
	case notifyOdAttributeValueAdd
	case notifyOdAttributeValueRemove
	case notifyOdAttributeSet
	case notifyOdCreateUser
	case notifyOdCreateGroup
	case notifyOdDeleteUser
	case notifyOdDeleteGroup
	case notifyXpcConnect
	case notifyGatekeeperUserOverride
	case notifyTccModify

	public var esEventType: es_event_type_t {
		switch self {
		case .authExec: return ES_EVENT_TYPE_AUTH_EXEC
		case .authOpen: return ES_EVENT_TYPE_AUTH_OPEN
		case .authKextload: return ES_EVENT_TYPE_AUTH_KEXTLOAD
		case .authMmap: return ES_EVENT_TYPE_AUTH_MMAP
		case .authMprotect: return ES_EVENT_TYPE_AUTH_MPROTECT
		case .authMount: return ES_EVENT_TYPE_AUTH_MOUNT
		case .authRename: return ES_EVENT_TYPE_AUTH_RENAME
		case .authSignal: return ES_EVENT_TYPE_AUTH_SIGNAL
		case .authUnlink: return ES_EVENT_TYPE_AUTH_UNLINK
		case .notifyExec: return ES_EVENT_TYPE_NOTIFY_EXEC
		case .notifyOpen: return ES_EVENT_TYPE_NOTIFY_OPEN
		case .notifyFork: return ES_EVENT_TYPE_NOTIFY_FORK
		case .notifyClose: return ES_EVENT_TYPE_NOTIFY_CLOSE
		case .notifyCreate: return ES_EVENT_TYPE_NOTIFY_CREATE
		case .notifyExchangedata: return ES_EVENT_TYPE_NOTIFY_EXCHANGEDATA
		case .notifyExit: return ES_EVENT_TYPE_NOTIFY_EXIT
		case .notifyGetTask: return ES_EVENT_TYPE_NOTIFY_GET_TASK
		case .notifyKextload: return ES_EVENT_TYPE_NOTIFY_KEXTLOAD
		case .notifyKextunload: return ES_EVENT_TYPE_NOTIFY_KEXTUNLOAD
		case .notifyLink: return ES_EVENT_TYPE_NOTIFY_LINK
		case .notifyMmap: return ES_EVENT_TYPE_NOTIFY_MMAP
		case .notifyMprotect: return ES_EVENT_TYPE_NOTIFY_MPROTECT
		case .notifyMount: return ES_EVENT_TYPE_NOTIFY_MOUNT
		case .notifyUnmount: return ES_EVENT_TYPE_NOTIFY_UNMOUNT
		case .notifyIokitOpen: return ES_EVENT_TYPE_NOTIFY_IOKIT_OPEN
		case .notifyRename: return ES_EVENT_TYPE_NOTIFY_RENAME
		case .notifySetattrlist: return ES_EVENT_TYPE_NOTIFY_SETATTRLIST
		case .notifySetextattr: return ES_EVENT_TYPE_NOTIFY_SETEXTATTR
		case .notifySetflags: return ES_EVENT_TYPE_NOTIFY_SETFLAGS
		case .notifySetmode: return ES_EVENT_TYPE_NOTIFY_SETMODE
		case .notifySetowner: return ES_EVENT_TYPE_NOTIFY_SETOWNER
		case .notifySignal: return ES_EVENT_TYPE_NOTIFY_SIGNAL
		case .notifyUnlink: return ES_EVENT_TYPE_NOTIFY_UNLINK
		case .notifyWrite: return ES_EVENT_TYPE_NOTIFY_WRITE
		case .authFileProviderMaterialize: return ES_EVENT_TYPE_AUTH_FILE_PROVIDER_MATERIALIZE
		case .notifyFileProviderMaterialize: return ES_EVENT_TYPE_NOTIFY_FILE_PROVIDER_MATERIALIZE
		case .authFileProviderUpdate: return ES_EVENT_TYPE_AUTH_FILE_PROVIDER_UPDATE
		case .notifyFileProviderUpdate: return ES_EVENT_TYPE_NOTIFY_FILE_PROVIDER_UPDATE
		case .authReadlink: return ES_EVENT_TYPE_AUTH_READLINK
		case .notifyReadlink: return ES_EVENT_TYPE_NOTIFY_READLINK
		case .authTruncate: return ES_EVENT_TYPE_AUTH_TRUNCATE
		case .notifyTruncate: return ES_EVENT_TYPE_NOTIFY_TRUNCATE
		case .authLink: return ES_EVENT_TYPE_AUTH_LINK
		case .notifyLookup: return ES_EVENT_TYPE_NOTIFY_LOOKUP
		case .authCreate: return ES_EVENT_TYPE_AUTH_CREATE
		case .authSetattrlist: return ES_EVENT_TYPE_AUTH_SETATTRLIST
		case .authSetextattr: return ES_EVENT_TYPE_AUTH_SETEXTATTR
		case .authSetflags: return ES_EVENT_TYPE_AUTH_SETFLAGS
		case .authSetmode: return ES_EVENT_TYPE_AUTH_SETMODE
		case .authSetowner: return ES_EVENT_TYPE_AUTH_SETOWNER
		case .authChdir: return ES_EVENT_TYPE_AUTH_CHDIR
		case .notifyChdir: return ES_EVENT_TYPE_NOTIFY_CHDIR
		case .authGetattrlist: return ES_EVENT_TYPE_AUTH_GETATTRLIST
		case .notifyGetattrlist: return ES_EVENT_TYPE_NOTIFY_GETATTRLIST
		case .notifyStat: return ES_EVENT_TYPE_NOTIFY_STAT
		case .notifyAccess: return ES_EVENT_TYPE_NOTIFY_ACCESS
		case .authChroot: return ES_EVENT_TYPE_AUTH_CHROOT
		case .notifyChroot: return ES_EVENT_TYPE_NOTIFY_CHROOT
		case .authUtimes: return ES_EVENT_TYPE_AUTH_UTIMES
		case .notifyUtimes: return ES_EVENT_TYPE_NOTIFY_UTIMES
		case .authClone: return ES_EVENT_TYPE_AUTH_CLONE
		case .notifyClone: return ES_EVENT_TYPE_NOTIFY_CLONE
		case .notifyFcntl: return ES_EVENT_TYPE_NOTIFY_FCNTL
		case .authGetextattr: return ES_EVENT_TYPE_AUTH_GETEXTATTR
		case .notifyGetextattr: return ES_EVENT_TYPE_NOTIFY_GETEXTATTR
		case .authListextattr: return ES_EVENT_TYPE_AUTH_LISTEXTATTR
		case .notifyListextattr: return ES_EVENT_TYPE_NOTIFY_LISTEXTATTR
		case .authReaddir: return ES_EVENT_TYPE_AUTH_READDIR
		case .notifyReaddir: return ES_EVENT_TYPE_NOTIFY_READDIR
		case .authDeleteextattr: return ES_EVENT_TYPE_AUTH_DELETEEXTATTR
		case .notifyDeleteextattr: return ES_EVENT_TYPE_NOTIFY_DELETEEXTATTR
		case .authFsgetpath: return ES_EVENT_TYPE_AUTH_FSGETPATH
		case .notifyFsgetpath: return ES_EVENT_TYPE_NOTIFY_FSGETPATH
		case .notifyDup: return ES_EVENT_TYPE_NOTIFY_DUP
		case .authSettime: return ES_EVENT_TYPE_AUTH_SETTIME
		case .notifySettime: return ES_EVENT_TYPE_NOTIFY_SETTIME
		case .notifyUipcBind: return ES_EVENT_TYPE_NOTIFY_UIPC_BIND
		case .authUipcBind: return ES_EVENT_TYPE_AUTH_UIPC_BIND
		case .notifyUipcConnect: return ES_EVENT_TYPE_NOTIFY_UIPC_CONNECT
		case .authUipcConnect: return ES_EVENT_TYPE_AUTH_UIPC_CONNECT
		case .authExchangedata: return ES_EVENT_TYPE_AUTH_EXCHANGEDATA
		case .authSetacl: return ES_EVENT_TYPE_AUTH_SETACL
		case .notifySetacl: return ES_EVENT_TYPE_NOTIFY_SETACL
		case .notifyPtyGrant: return ES_EVENT_TYPE_NOTIFY_PTY_GRANT
		case .notifyPtyClose: return ES_EVENT_TYPE_NOTIFY_PTY_CLOSE
		case .authProcCheck: return ES_EVENT_TYPE_AUTH_PROC_CHECK
		case .notifyProcCheck: return ES_EVENT_TYPE_NOTIFY_PROC_CHECK
		case .authGetTask: return ES_EVENT_TYPE_AUTH_GET_TASK
		case .authSearchfs: return ES_EVENT_TYPE_AUTH_SEARCHFS
		case .notifySearchfs: return ES_EVENT_TYPE_NOTIFY_SEARCHFS
		case .authFcntl: return ES_EVENT_TYPE_AUTH_FCNTL
		case .authIokitOpen: return ES_EVENT_TYPE_AUTH_IOKIT_OPEN
		case .authProcSuspendResume: return ES_EVENT_TYPE_AUTH_PROC_SUSPEND_RESUME
		case .notifyProcSuspendResume: return ES_EVENT_TYPE_NOTIFY_PROC_SUSPEND_RESUME
		case .notifyCsInvalidated: return ES_EVENT_TYPE_NOTIFY_CS_INVALIDATED
		case .notifyGetTaskName: return ES_EVENT_TYPE_NOTIFY_GET_TASK_NAME
		case .notifyTrace: return ES_EVENT_TYPE_NOTIFY_TRACE
		case .notifyRemoteThreadCreate: return ES_EVENT_TYPE_NOTIFY_REMOTE_THREAD_CREATE
		case .authRemount: return ES_EVENT_TYPE_AUTH_REMOUNT
		case .notifyRemount: return ES_EVENT_TYPE_NOTIFY_REMOUNT
		case .authGetTaskRead: return ES_EVENT_TYPE_AUTH_GET_TASK_READ
		case .notifyGetTaskRead: return ES_EVENT_TYPE_NOTIFY_GET_TASK_READ
		case .notifyGetTaskInspect: return ES_EVENT_TYPE_NOTIFY_GET_TASK_INSPECT
		case .notifySetuid: return ES_EVENT_TYPE_NOTIFY_SETUID
		case .notifySetgid: return ES_EVENT_TYPE_NOTIFY_SETGID
		case .notifySeteuid: return ES_EVENT_TYPE_NOTIFY_SETEUID
		case .notifySetegid: return ES_EVENT_TYPE_NOTIFY_SETEGID
		case .notifySetreuid: return ES_EVENT_TYPE_NOTIFY_SETREUID
		case .notifySetregid: return ES_EVENT_TYPE_NOTIFY_SETREGID
		case .authCopyfile: return ES_EVENT_TYPE_AUTH_COPYFILE
		case .notifyCopyfile: return ES_EVENT_TYPE_NOTIFY_COPYFILE
		case .notifyAuthentication: return ES_EVENT_TYPE_NOTIFY_AUTHENTICATION
		case .notifyXpMalwareDetected: return ES_EVENT_TYPE_NOTIFY_XP_MALWARE_DETECTED
		case .notifyXpMalwareRemediated: return ES_EVENT_TYPE_NOTIFY_XP_MALWARE_REMEDIATED
		case .notifyLwSessionLogin: return ES_EVENT_TYPE_NOTIFY_LW_SESSION_LOGIN
		case .notifyLwSessionLogout: return ES_EVENT_TYPE_NOTIFY_LW_SESSION_LOGOUT
		case .notifyLwSessionLock: return ES_EVENT_TYPE_NOTIFY_LW_SESSION_LOCK
		case .notifyLwSessionUnlock: return ES_EVENT_TYPE_NOTIFY_LW_SESSION_UNLOCK
		case .notifyScreensharingAttach: return ES_EVENT_TYPE_NOTIFY_SCREENSHARING_ATTACH
		case .notifyScreensharingDetach: return ES_EVENT_TYPE_NOTIFY_SCREENSHARING_DETACH
		case .notifyOpensshLogin: return ES_EVENT_TYPE_NOTIFY_OPENSSH_LOGIN
		case .notifyOpensshLogout: return ES_EVENT_TYPE_NOTIFY_OPENSSH_LOGOUT
		case .notifyLoginLogin: return ES_EVENT_TYPE_NOTIFY_LOGIN_LOGIN
		case .notifyLoginLogout: return ES_EVENT_TYPE_NOTIFY_LOGIN_LOGOUT
		case .notifyBtmLaunchItemAdd: return ES_EVENT_TYPE_NOTIFY_BTM_LAUNCH_ITEM_ADD
		case .notifyBtmLaunchItemRemove: return ES_EVENT_TYPE_NOTIFY_BTM_LAUNCH_ITEM_REMOVE
		case .notifyProfileAdd: return ES_EVENT_TYPE_NOTIFY_PROFILE_ADD
		case .notifyProfileRemove: return ES_EVENT_TYPE_NOTIFY_PROFILE_REMOVE
		case .notifySu: return ES_EVENT_TYPE_NOTIFY_SU
		case .notifyAuthorizationPetition: return ES_EVENT_TYPE_NOTIFY_AUTHORIZATION_PETITION
		case .notifyAuthorizationJudgement: return ES_EVENT_TYPE_NOTIFY_AUTHORIZATION_JUDGEMENT
		case .notifySudo: return ES_EVENT_TYPE_NOTIFY_SUDO
		case .notifyOdGroupAdd: return ES_EVENT_TYPE_NOTIFY_OD_GROUP_ADD
		case .notifyOdGroupRemove: return ES_EVENT_TYPE_NOTIFY_OD_GROUP_REMOVE
		case .notifyOdGroupSet: return ES_EVENT_TYPE_NOTIFY_OD_GROUP_SET
		case .notifyOdModifyPassword: return ES_EVENT_TYPE_NOTIFY_OD_MODIFY_PASSWORD
		case .notifyOdDisableUser: return ES_EVENT_TYPE_NOTIFY_OD_DISABLE_USER
		case .notifyOdEnableUser: return ES_EVENT_TYPE_NOTIFY_OD_ENABLE_USER
		case .notifyOdAttributeValueAdd: return ES_EVENT_TYPE_NOTIFY_OD_ATTRIBUTE_VALUE_ADD
		case .notifyOdAttributeValueRemove: return ES_EVENT_TYPE_NOTIFY_OD_ATTRIBUTE_VALUE_REMOVE
		case .notifyOdAttributeSet: return ES_EVENT_TYPE_NOTIFY_OD_ATTRIBUTE_SET
		case .notifyOdCreateUser: return ES_EVENT_TYPE_NOTIFY_OD_CREATE_USER
		case .notifyOdCreateGroup: return ES_EVENT_TYPE_NOTIFY_OD_CREATE_GROUP
		case .notifyOdDeleteUser: return ES_EVENT_TYPE_NOTIFY_OD_DELETE_USER
		case .notifyOdDeleteGroup: return ES_EVENT_TYPE_NOTIFY_OD_DELETE_GROUP
		case .notifyXpcConnect: return ES_EVENT_TYPE_NOTIFY_XPC_CONNECT
		case .notifyGatekeeperUserOverride: return ES_EVENT_TYPE_NOTIFY_GATEKEEPER_USER_OVERRIDE
		case .notifyTccModify: return ES_EVENT_TYPE_NOTIFY_TCC_MODIFY
		}
	}
	public static func from(_ esType: es_event_type_t) -> ESEventType? {
		switch esType {
		case ES_EVENT_TYPE_AUTH_EXEC: return .authExec
		case ES_EVENT_TYPE_AUTH_OPEN: return .authOpen
		case ES_EVENT_TYPE_AUTH_KEXTLOAD: return .authKextload
		case ES_EVENT_TYPE_AUTH_MMAP: return .authMmap
		case ES_EVENT_TYPE_AUTH_MPROTECT: return .authMprotect
		case ES_EVENT_TYPE_AUTH_MOUNT: return .authMount
		case ES_EVENT_TYPE_AUTH_RENAME: return .authRename
		case ES_EVENT_TYPE_AUTH_SIGNAL: return .authSignal
		case ES_EVENT_TYPE_AUTH_UNLINK: return .authUnlink
		case ES_EVENT_TYPE_NOTIFY_EXEC: return .notifyExec
		case ES_EVENT_TYPE_NOTIFY_OPEN: return .notifyOpen
		case ES_EVENT_TYPE_NOTIFY_FORK: return .notifyFork
		case ES_EVENT_TYPE_NOTIFY_CLOSE: return .notifyClose
		case ES_EVENT_TYPE_NOTIFY_CREATE: return .notifyCreate
		case ES_EVENT_TYPE_NOTIFY_EXCHANGEDATA: return .notifyExchangedata
		case ES_EVENT_TYPE_NOTIFY_EXIT: return .notifyExit
		case ES_EVENT_TYPE_NOTIFY_GET_TASK: return .notifyGetTask
		case ES_EVENT_TYPE_NOTIFY_KEXTLOAD: return .notifyKextload
		case ES_EVENT_TYPE_NOTIFY_KEXTUNLOAD: return .notifyKextunload
		case ES_EVENT_TYPE_NOTIFY_LINK: return .notifyLink
		case ES_EVENT_TYPE_NOTIFY_MMAP: return .notifyMmap
		case ES_EVENT_TYPE_NOTIFY_MPROTECT: return .notifyMprotect
		case ES_EVENT_TYPE_NOTIFY_MOUNT: return .notifyMount
		case ES_EVENT_TYPE_NOTIFY_UNMOUNT: return .notifyUnmount
		case ES_EVENT_TYPE_NOTIFY_IOKIT_OPEN: return .notifyIokitOpen
		case ES_EVENT_TYPE_NOTIFY_RENAME: return .notifyRename
		case ES_EVENT_TYPE_NOTIFY_SETATTRLIST: return .notifySetattrlist
		case ES_EVENT_TYPE_NOTIFY_SETEXTATTR: return .notifySetextattr
		case ES_EVENT_TYPE_NOTIFY_SETFLAGS: return .notifySetflags
		case ES_EVENT_TYPE_NOTIFY_SETMODE: return .notifySetmode
		case ES_EVENT_TYPE_NOTIFY_SETOWNER: return .notifySetowner
		case ES_EVENT_TYPE_NOTIFY_SIGNAL: return .notifySignal
		case ES_EVENT_TYPE_NOTIFY_UNLINK: return .notifyUnlink
		case ES_EVENT_TYPE_NOTIFY_WRITE: return .notifyWrite
		case ES_EVENT_TYPE_AUTH_FILE_PROVIDER_MATERIALIZE: return .authFileProviderMaterialize
		case ES_EVENT_TYPE_NOTIFY_FILE_PROVIDER_MATERIALIZE: return .notifyFileProviderMaterialize
		case ES_EVENT_TYPE_AUTH_FILE_PROVIDER_UPDATE: return .authFileProviderUpdate
		case ES_EVENT_TYPE_NOTIFY_FILE_PROVIDER_UPDATE: return .notifyFileProviderUpdate
		case ES_EVENT_TYPE_AUTH_READLINK: return .authReadlink
		case ES_EVENT_TYPE_NOTIFY_READLINK: return .notifyReadlink
		case ES_EVENT_TYPE_AUTH_TRUNCATE: return .authTruncate
		case ES_EVENT_TYPE_NOTIFY_TRUNCATE: return .notifyTruncate
		case ES_EVENT_TYPE_AUTH_LINK: return .authLink
		case ES_EVENT_TYPE_NOTIFY_LOOKUP: return .notifyLookup
		case ES_EVENT_TYPE_AUTH_CREATE: return .authCreate
		case ES_EVENT_TYPE_AUTH_SETATTRLIST: return .authSetattrlist
		case ES_EVENT_TYPE_AUTH_SETEXTATTR: return .authSetextattr
		case ES_EVENT_TYPE_AUTH_SETFLAGS: return .authSetflags
		case ES_EVENT_TYPE_AUTH_SETMODE: return .authSetmode
		case ES_EVENT_TYPE_AUTH_SETOWNER: return .authSetowner
		case ES_EVENT_TYPE_AUTH_CHDIR: return .authChdir
		case ES_EVENT_TYPE_NOTIFY_CHDIR: return .notifyChdir
		case ES_EVENT_TYPE_AUTH_GETATTRLIST: return .authGetattrlist
		case ES_EVENT_TYPE_NOTIFY_GETATTRLIST: return .notifyGetattrlist
		case ES_EVENT_TYPE_NOTIFY_STAT: return .notifyStat
		case ES_EVENT_TYPE_NOTIFY_ACCESS: return .notifyAccess
		case ES_EVENT_TYPE_AUTH_CHROOT: return .authChroot
		case ES_EVENT_TYPE_NOTIFY_CHROOT: return .notifyChroot
		case ES_EVENT_TYPE_AUTH_UTIMES: return .authUtimes
		case ES_EVENT_TYPE_NOTIFY_UTIMES: return .notifyUtimes
		case ES_EVENT_TYPE_AUTH_CLONE: return .authClone
		case ES_EVENT_TYPE_NOTIFY_CLONE: return .notifyClone
		case ES_EVENT_TYPE_NOTIFY_FCNTL: return .notifyFcntl
		case ES_EVENT_TYPE_AUTH_GETEXTATTR: return .authGetextattr
		case ES_EVENT_TYPE_NOTIFY_GETEXTATTR: return .notifyGetextattr
		case ES_EVENT_TYPE_AUTH_LISTEXTATTR: return .authListextattr
		case ES_EVENT_TYPE_NOTIFY_LISTEXTATTR: return .notifyListextattr
		case ES_EVENT_TYPE_AUTH_READDIR: return .authReaddir
		case ES_EVENT_TYPE_NOTIFY_READDIR: return .notifyReaddir
		case ES_EVENT_TYPE_AUTH_DELETEEXTATTR: return .authDeleteextattr
		case ES_EVENT_TYPE_NOTIFY_DELETEEXTATTR: return .notifyDeleteextattr
		case ES_EVENT_TYPE_AUTH_FSGETPATH: return .authFsgetpath
		case ES_EVENT_TYPE_NOTIFY_FSGETPATH: return .notifyFsgetpath
		case ES_EVENT_TYPE_NOTIFY_DUP: return .notifyDup
		case ES_EVENT_TYPE_AUTH_SETTIME: return .authSettime
		case ES_EVENT_TYPE_NOTIFY_SETTIME: return .notifySettime
		case ES_EVENT_TYPE_NOTIFY_UIPC_BIND: return .notifyUipcBind
		case ES_EVENT_TYPE_AUTH_UIPC_BIND: return .authUipcBind
		case ES_EVENT_TYPE_NOTIFY_UIPC_CONNECT: return .notifyUipcConnect
		case ES_EVENT_TYPE_AUTH_UIPC_CONNECT: return .authUipcConnect
		case ES_EVENT_TYPE_AUTH_EXCHANGEDATA: return .authExchangedata
		case ES_EVENT_TYPE_AUTH_SETACL: return .authSetacl
		case ES_EVENT_TYPE_NOTIFY_SETACL: return .notifySetacl
		case ES_EVENT_TYPE_NOTIFY_PTY_GRANT: return .notifyPtyGrant
		case ES_EVENT_TYPE_NOTIFY_PTY_CLOSE: return .notifyPtyClose
		case ES_EVENT_TYPE_AUTH_PROC_CHECK: return .authProcCheck
		case ES_EVENT_TYPE_NOTIFY_PROC_CHECK: return .notifyProcCheck
		case ES_EVENT_TYPE_AUTH_GET_TASK: return .authGetTask
		case ES_EVENT_TYPE_AUTH_SEARCHFS: return .authSearchfs
		case ES_EVENT_TYPE_NOTIFY_SEARCHFS: return .notifySearchfs
		case ES_EVENT_TYPE_AUTH_FCNTL: return .authFcntl
		case ES_EVENT_TYPE_AUTH_IOKIT_OPEN: return .authIokitOpen
		case ES_EVENT_TYPE_AUTH_PROC_SUSPEND_RESUME: return .authProcSuspendResume
		case ES_EVENT_TYPE_NOTIFY_PROC_SUSPEND_RESUME: return .notifyProcSuspendResume
		case ES_EVENT_TYPE_NOTIFY_CS_INVALIDATED: return .notifyCsInvalidated
		case ES_EVENT_TYPE_NOTIFY_GET_TASK_NAME: return .notifyGetTaskName
		case ES_EVENT_TYPE_NOTIFY_TRACE: return .notifyTrace
		case ES_EVENT_TYPE_NOTIFY_REMOTE_THREAD_CREATE: return .notifyRemoteThreadCreate
		case ES_EVENT_TYPE_AUTH_REMOUNT: return .authRemount
		case ES_EVENT_TYPE_NOTIFY_REMOUNT: return .notifyRemount
		case ES_EVENT_TYPE_AUTH_GET_TASK_READ: return .authGetTaskRead
		case ES_EVENT_TYPE_NOTIFY_GET_TASK_READ: return .notifyGetTaskRead
		case ES_EVENT_TYPE_NOTIFY_GET_TASK_INSPECT: return .notifyGetTaskInspect
		case ES_EVENT_TYPE_NOTIFY_SETUID: return .notifySetuid
		case ES_EVENT_TYPE_NOTIFY_SETGID: return .notifySetgid
		case ES_EVENT_TYPE_NOTIFY_SETEUID: return .notifySeteuid
		case ES_EVENT_TYPE_NOTIFY_SETEGID: return .notifySetegid
		case ES_EVENT_TYPE_NOTIFY_SETREUID: return .notifySetreuid
		case ES_EVENT_TYPE_NOTIFY_SETREGID: return .notifySetregid
		case ES_EVENT_TYPE_AUTH_COPYFILE: return .authCopyfile
		case ES_EVENT_TYPE_NOTIFY_COPYFILE: return .notifyCopyfile
		case ES_EVENT_TYPE_NOTIFY_AUTHENTICATION: return .notifyAuthentication
		case ES_EVENT_TYPE_NOTIFY_XP_MALWARE_DETECTED: return .notifyXpMalwareDetected
		case ES_EVENT_TYPE_NOTIFY_XP_MALWARE_REMEDIATED: return .notifyXpMalwareRemediated
		case ES_EVENT_TYPE_NOTIFY_LW_SESSION_LOGIN: return .notifyLwSessionLogin
		case ES_EVENT_TYPE_NOTIFY_LW_SESSION_LOGOUT: return .notifyLwSessionLogout
		case ES_EVENT_TYPE_NOTIFY_LW_SESSION_LOCK: return .notifyLwSessionLock
		case ES_EVENT_TYPE_NOTIFY_LW_SESSION_UNLOCK: return .notifyLwSessionUnlock
		case ES_EVENT_TYPE_NOTIFY_SCREENSHARING_ATTACH: return .notifyScreensharingAttach
		case ES_EVENT_TYPE_NOTIFY_SCREENSHARING_DETACH: return .notifyScreensharingDetach
		case ES_EVENT_TYPE_NOTIFY_OPENSSH_LOGIN: return .notifyOpensshLogin
		case ES_EVENT_TYPE_NOTIFY_OPENSSH_LOGOUT: return .notifyOpensshLogout
		case ES_EVENT_TYPE_NOTIFY_LOGIN_LOGIN: return .notifyLoginLogin
		case ES_EVENT_TYPE_NOTIFY_LOGIN_LOGOUT: return .notifyLoginLogout
		case ES_EVENT_TYPE_NOTIFY_BTM_LAUNCH_ITEM_ADD: return .notifyBtmLaunchItemAdd
		case ES_EVENT_TYPE_NOTIFY_BTM_LAUNCH_ITEM_REMOVE: return .notifyBtmLaunchItemRemove
		case ES_EVENT_TYPE_NOTIFY_PROFILE_ADD: return .notifyProfileAdd
		case ES_EVENT_TYPE_NOTIFY_PROFILE_REMOVE: return .notifyProfileRemove
		case ES_EVENT_TYPE_NOTIFY_SU: return .notifySu
		case ES_EVENT_TYPE_NOTIFY_AUTHORIZATION_PETITION: return .notifyAuthorizationPetition
		case ES_EVENT_TYPE_NOTIFY_AUTHORIZATION_JUDGEMENT: return .notifyAuthorizationJudgement
		case ES_EVENT_TYPE_NOTIFY_SUDO: return .notifySudo
		case ES_EVENT_TYPE_NOTIFY_OD_GROUP_ADD: return .notifyOdGroupAdd
		case ES_EVENT_TYPE_NOTIFY_OD_GROUP_REMOVE: return .notifyOdGroupRemove
		case ES_EVENT_TYPE_NOTIFY_OD_GROUP_SET: return .notifyOdGroupSet
		case ES_EVENT_TYPE_NOTIFY_OD_MODIFY_PASSWORD: return .notifyOdModifyPassword
		case ES_EVENT_TYPE_NOTIFY_OD_DISABLE_USER: return .notifyOdDisableUser
		case ES_EVENT_TYPE_NOTIFY_OD_ENABLE_USER: return .notifyOdEnableUser
		case ES_EVENT_TYPE_NOTIFY_OD_ATTRIBUTE_VALUE_ADD: return .notifyOdAttributeValueAdd
		case ES_EVENT_TYPE_NOTIFY_OD_ATTRIBUTE_VALUE_REMOVE: return .notifyOdAttributeValueRemove
		case ES_EVENT_TYPE_NOTIFY_OD_ATTRIBUTE_SET: return .notifyOdAttributeSet
		case ES_EVENT_TYPE_NOTIFY_OD_CREATE_USER: return .notifyOdCreateUser
		case ES_EVENT_TYPE_NOTIFY_OD_CREATE_GROUP: return .notifyOdCreateGroup
		case ES_EVENT_TYPE_NOTIFY_OD_DELETE_USER: return .notifyOdDeleteUser
		case ES_EVENT_TYPE_NOTIFY_OD_DELETE_GROUP: return .notifyOdDeleteGroup
		case ES_EVENT_TYPE_NOTIFY_XPC_CONNECT: return .notifyXpcConnect
		case ES_EVENT_TYPE_NOTIFY_GATEKEEPER_USER_OVERRIDE: return .notifyGatekeeperUserOverride
		case ES_EVENT_TYPE_NOTIFY_TCC_MODIFY: return .notifyTccModify
		default: return nil
		}
	}
}



