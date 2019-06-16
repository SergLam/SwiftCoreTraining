//
//  SocketCalls.swift
//  SwiftCoreTraining
//
//  Created by IdeaSoft on 4/22/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation
import SocketIO

enum SocketCalls: String, CaseIterable {
    
    case loginToSocket
    case logoutFromSocket
    case showFeedback
    case enterChat
    case exitChat
    case deleteChat
    case deleteQuestion
    case sendMessage
    case incomingMessage
    case getUserSuperLikesCount
    case typing
    case isTyping
    
    case cancelTyping
    case reportUser
    case blockUser
    case yourBlocked
    case yourUnBlocked
    case sendFeedback
    case isNotification
    case changeAnonname
    case changeLocation
    case changeBio
    case setProfileType
    case changeImage
    case changeAnonImage
    
}

struct SocketCallsJSONData {
    // https://socket.io/blog/socket-io-on-ios/
    static let loginToSocket: [String: Any] =
    ["callName": "loginToSocket",
    "user_id": "5825", // 582549398928559
    "app_version": "3.001",
    "access_token": "EAAXqsnpKyskBAEK8Svx2UOt5AfhobymK7gc5wTdnIllGS8FWGQBpzdZAnTzcVE8djL1weUvxXQiMirZCsCIqREmxTT5jrO7ykUNodhgmrNjMEEVoMuP2CpUYerRIm903ZCvJyZCPsoynBvobSrROV8ZAufwmrsvN3bNNL2r5jar3pQrjUo6iN5NS0z9YoX5FWHblDgETlrh6BZAVoqqltvA1nC4QRsDRBpId5ZCPkfhwQZDZD"]
    
    static let logoutFromSocket: [String: Any] = ["callName": "logoutFromSocket"]
    
    static let showFeedback: [String: Any] = [:]
    
    static let enterChat: [String: Any] = ["callName": "enterChat", "chat_id": "546426808"]
    
    static let exitChat: [String: Any] = ["callName": "exitChat"]
    
    static let deleteChat: [String: Any] = ["callName": "deleteChat", "chat_id": "546426808"]
    
    static let deleteQuestion: [String: Any] = ["callName": "deleteQuestion", "question_id": "546426808"]
    
    static let sendMessage: [String: Any] = ["text": "Ok", "callName": "sendMessage",
                                       "local_message_id": "-139", "chat_id": "46908"]
    
    static let incomingMessage: [String: Any] = ["callName": "IncomingMessage"]
    
    static let getUserSuperLikesCount: [String: Any] = ["callName": "getUserSuperLikesCount",
                                                 "user_id": "582549398928559"]
    
    static let typing: [String: Any] = ["callName": "typing"]
    
    static let isTyping: [String: Any] = ["callName": "isTyping"]
    
    static let cancelTyping: [String: Any] = ["callName": "cancelTyping"]
    
    
    static let reportUser: [String: Any] = ["callName": "reportUser", "type": 6, "user_id": "163",
                                     "text": "Testa", "is_block": false]
    
    static let blockUser: [String: Any] = ["callName": "blockUser", "block": 1, "user_id": "163"]
    
    static let yourBlocked: [String: Any] = ["callName": "yourBlocked"]
    
    static let yourUnBlocked: [String: Any] = ["callName": "yourUnBlocked"]
    
    static let sendFeedback: [String: Any] = ["callName": "sendFeedback", "feedback": "Test feedback"]
    
    static let isNotification: [String: Any] = ["notification": true, "callName": "isNotification"]
    
    static let changeAnonname: [String: Any] = ["callName": "changeAnonname", "name": "All Seeing Eyes"]
    
    static let changeLocation: [String: Any] = ["callName": "changeLocation", "name": "Ukraine, Kharkiv"]
    
    static let changeBio: [String: Any] = ["callName": "changeBio", "bio": "Test bio"]
    
    static let setProfileType: [String: Any] = ["anon": 1, "callName": "setProfileType"]
    
    static let changeImage: [String: Any] = [ "callName": "changeImage",
    "image": "iVBORw0KGgoAAAANSUhEUgAAAZAAAAGQCAYAAACAvzbMAAAAAXNSR0IArs4c6QAAABxpRE9UAAAAAgAAAAAAAADIAAAAKAAAAMgAAADIAAKb32fwHCcAAEAASURBVHgB7L1nbJ5pet9rx4hP9oPtFATIlyRGDBhI4A/+ECA5cQIkcRLkS2znxLu2z+7O1pktszs7s9N3mmZG09Rm1HtvFCVRpChSlEiKYhV777333kmV+/x+9zs65wRZJHa8fV8BD16KfMvzPuR7/e9/ua77V34l+S95BX4Br0AIv/KrZam7PjOcd/rvjZae/8djRSf+WV/B0X/ZmXPgP3TfOvAnQ6WnvzBadvYbExXn3xovv3B8suriraWG9LqR0vP9jTcOzNdn7FurSz/woDXn1IPO/Atr3XcvzY9W3ehf6SiuW+squrXWWXh8pS3/rfn6m9+Yrr/5hbnGW3+y3FnwHxZac//lUlfRP5urzf/Hi215fy8MlX0mhPCrv4CXOPmWklcgeQWSV+Dn7wqEsOVv1J3c8rdLT73+O0Wn3viDivNbP9uQsft7/XdPbhu4e+L0QMGJnIG7xysnys93zVRfGhsrO7PYV3Bkc6DweBguORnGy8+G2drUsNaWGTY6b4bVtqwwXXslTNdcDcNlF0Nv4Vnq/qUwU58V5pvywmJbfgA0wlpnSdjsLeMoDfd7S0IYKucoCw8HikMYKQ8PBkrCSuedsNpVuLnceXdxvadkbL23rGtz4F7lxkB5zsPhqtP3B8q3rfeVfW9joOKz90eq/iBMVP9OGCj+O4DM3/j5+00kzzh5BZJXIHkFfkavwLktn//N01ue/N1z7z71n1K3ffdb1z95btfN/S+k3z3+ek3xqTdHSs68tVJ8+s3QcG1HGCo8GWarUsNk+YUwVnYujJScDRMVKWGk9FwYKDoZRu+dCzOCBMdM3bUwVZsWpridbcwM8y03"
    ]
    
    static let changeAnonImage: [String: Any] = ["callName": "changeAnonImage",
    "image": "iVBORw0KGgoAAAANSUhEUgAAAZAAAAGQCAYAAACAvzbMAAAAAXNSR0IArs4c6QAAABxpRE9UAAAAAgAAAAAAAADIAAAAKAAAAMgAAADIAAKb32fwHCcAAEAASURBVHgB7L1nbJ5pet9rx4hP9oPtFATIlyRGDBhI4A/+ECA5cQIkcRLkS2znxLu2z+7O1pktszs7s9N3mmZG09Rm1HtvFCVRpChSlEiKYhV777333kmV+/x+9zs65wRZJHa8fV8BD16KfMvzPuR7/e9/ua77V34l+S95BX4Br0AIv/KrZam7PjOcd/rvjZae/8djRSf+WV/B0X/ZmXPgP3TfOvAnQ6WnvzBadvYbExXn3xovv3B8suriraWG9LqR0vP9jTcOzNdn7FurSz/woDXn1IPO/Atr3XcvzY9W3ehf6SiuW+squrXWWXh8pS3/rfn6m9+Yrr/5hbnGW3+y3FnwHxZac//lUlfRP5urzf/Hi215fy8MlX0mhPCrv4CXOPmWklcgeQWSV+Dn7wqEsOVv1J3c8rdLT73+O0Wn3viDivNbP9uQsft7/XdPbhu4e+L0QMGJnIG7xysnys93zVRfGhsrO7PYV3Bkc6DweBguORnGy8+G2drUsNaWGTY6b4bVtqwwXXslTNdcDcNlF0Nv4Vnq/qUwU58V5pvywmJbfgA0wlpnSdjsLeMoDfd7S0IYKucoCw8HikMYKQ8PBkrCSuedsNpVuLnceXdxvadkbL23rGtz4F7lxkB5zsPhqtP3B8q3rfeVfW9joOKz90eq/iBMVP9OGCj+O4DM3/j5+00kzzh5BZJXIHkFfkavwLktn//N01ue/N1z7z71n1K3ffdb1z95btfN/S+k3z3+ek3xqTdHSs68tVJ8+s3QcG1HGCo8GWarUsNk+YUwVnYujJScDRMVKWGk9FwYKDoZRu+dCzOCBMdM3bUwVZsWpridbcwM8y03"
    ]
    
    static let allData: [[String: Any]] = [loginToSocket, logoutFromSocket, showFeedback, enterChat, exitChat,
                                           deleteChat, deleteQuestion, sendMessage, incomingMessage,
                                           getUserSuperLikesCount, typing, isTyping, cancelTyping, reportUser,
                                           blockUser, yourBlocked, yourUnBlocked, sendFeedback, isNotification,
                                           changeAnonname, changeLocation, changeBio, setProfileType,
                                           changeImage, changeAnonImage]
    
    
}
