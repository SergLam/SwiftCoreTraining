//
//  SocketManager.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/18/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation
import Starscream

enum SocketTarget: String, CaseIterable {
    
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

enum SocketTargetData: String, CaseIterable {
    
    case loginToSocket = """
    {
    "callName": "loginToSocket",
    "user_id": "582549398928559",
    "app_version": "3.001",
    "access_token": "EAAXqsnpKyskBAEK8Svx2UOt5AfhobymK7gc5wTdnIllGS8FWGQBpzdZAnTzcVE8djL1weUvxXQiMirZCsCIqREmxTT5jrO7ykUNodhgmrNjMEEVoMuP2CpUYerRIm903ZCvJyZCPsoynBvobSrROV8ZAufwmrsvN3bNNL2r5jar3pQrjUo6iN5NS0z9YoX5FWHblDgETlrh6BZAVoqqltvA1nC4QRsDRBpId5ZCPkfhwQZDZD"
    }
    """
    case logoutFromSocket = """
    {
    "callName": "logoutFromSocket"
    }
    """
    case showFeedback
    case enterChat = """
    {
    "callName": "enterChat",
    "chat_id": "546426808",
    }
    """
    case exitChat = """
    {
    "callName": "exitChat"
    }
    """
    case deleteChat = """
    {
    "callName": "deleteChat",
    "chat_id": "546426808"
    }
    """
    case deleteQuestion = """
    {
    "callName": "deleteQuestion",
    "question_id": "546426808"
    }
    """
    case sendMessage = """
    {
    "text": "Ok",
    "callName": "sendMessage",
    "local_message_id": "-139",
    "chat_id": "46908"
    }
    """
    case incomingMessage = """
    {
    "callName": "IncomingMessage"
    }
    """
    case getUserSuperLikesCount = """
    {
    "callName": "getUserSuperLikesCount",
    "user_id": "582549398928559"
    }
    """
    case typing = """
    {
    "callName": "typing"
    }
    """
    case isTyping = """
    {
    "callName": "isTyping",
    }
    """
    case cancelTyping = """
    {
    "callName": "cancelTyping"
    }
    """
    case reportUser = """
    {
    "type": 6,
    "user_id": "163",
    "callName": "reportUser",
    "text": "Testa",
    "is_block": false
    }
    """
    case blockUser = """
    {
    "block": 1,
    "user_id": "163",
    "callName": "blockUser"
    }
    """
    case yourBlocked = """
    {
    "callName": "yourBlocked"
    }
    """
    case yourUnBlocked = """
    {
    "callName": "yourUnBlocked"
    }
    """
    case sendFeedback = """
    {
    "callName": "sendFeedback",
    "feedback": "Test feedback"
    }
    """
    case isNotification = """
    {
    "notification": true,
    "callName": "isNotification"
    }
    """
    case changeAnonname = """
    {
    "callName": "changeAnonname",
    "name": "All Seeing Eyes"
    }
    """
    case changeLocation = """
    {
    "callName": "changeLocation",
    "name": "Ukraine, Kharkiv"
    }
    """
    case changeBio = """
    {
    "callName": "changeBio",
    "bio": "Test bio"
    }
    """
    case setProfileType = """
    {
    "anon": 1,
    "callName": "setProfileType"
    }
    """
    case changeImage = """
    {
    "callName": "changeImage",
    "image": "iVBORw0KGgoAAAANSUhEUgAAAZAAAAGQCAYAAACAvzbMAAAAAXNSR0IArs4c6QAAABxpRE9UAAAAAgAAAAAAAADIAAAAKAAAAMgAAADIAAKb32fwHCcAAEAASURBVHgB7L1nbJ5pet9rx4hP9oPtFATIlyRGDBhI4A/+ECA5cQIkcRLkS2znxLu2z+7O1pktszs7s9N3mmZG09Rm1HtvFCVRpChSlEiKYhV777333kmV+/x+9zs65wRZJHa8fV8BD16KfMvzPuR7/e9/ua77V34l+S95BX4Br0AIv/KrZam7PjOcd/rvjZae/8djRSf+WV/B0X/ZmXPgP3TfOvAnQ6WnvzBadvYbExXn3xovv3B8suriraWG9LqR0vP9jTcOzNdn7FurSz/woDXn1IPO/Atr3XcvzY9W3ehf6SiuW+squrXWWXh8pS3/rfn6m9+Yrr/5hbnGW3+y3FnwHxZac//lUlfRP5urzf/Hi215fy8MlX0mhPCrv4CXOPmWklcgeQWSV+Dn7wqEsOVv1J3c8rdLT73+O0Wn3viDivNbP9uQsft7/XdPbhu4e+L0QMGJnIG7xysnys93zVRfGhsrO7PYV3Bkc6DweBguORnGy8+G2drUsNaWGTY6b4bVtqwwXXslTNdcDcNlF0Nv4Vnq/qUwU58V5pvywmJbfgA0wlpnSdjsLeMoDfd7S0IYKucoCw8HikMYKQ8PBkrCSuedsNpVuLnceXdxvadkbL23rGtz4F7lxkB5zsPhqtP3B8q3rfeVfW9joOKz90eq/iBMVP9OGCj+O4DM3/j5+00kzzh5BZJXIHkFfkavwLktn//N01ue/N1z7z71n1K3ffdb1z95btfN/S+k3z3+ek3xqTdHSs68tVJ8+s3QcG1HGCo8GWarUsNk+YUwVnYujJScDRMVKWGk9FwYKDoZRu+dCzOCBMdM3bUwVZsWpridbcwM8y03"
    }
    """
    case changeAnonImage = """
    {
    "callName": "changeAnonImage",
    "image": "iVBORw0KGgoAAAANSUhEUgAAAZAAAAGQCAYAAACAvzbMAAAAAXNSR0IArs4c6QAAABxpRE9UAAAAAgAAAAAAAADIAAAAKAAAAMgAAADIAAKb32fwHCcAAEAASURBVHgB7L1nbJ5pet9rx4hP9oPtFATIlyRGDBhI4A/+ECA5cQIkcRLkS2znxLu2z+7O1pktszs7s9N3mmZG09Rm1HtvFCVRpChSlEiKYhV777333kmV+/x+9zs65wRZJHa8fV8BD16KfMvzPuR7/e9/ua77V34l+S95BX4Br0AIv/KrZam7PjOcd/rvjZae/8djRSf+WV/B0X/ZmXPgP3TfOvAnQ6WnvzBadvYbExXn3xovv3B8suriraWG9LqR0vP9jTcOzNdn7FurSz/woDXn1IPO/Atr3XcvzY9W3ehf6SiuW+squrXWWXh8pS3/rfn6m9+Yrr/5hbnGW3+y3FnwHxZac//lUlfRP5urzf/Hi215fy8MlX0mhPCrv4CXOPmWklcgeQWSV+Dn7wqEsOVv1J3c8rdLT73+O0Wn3viDivNbP9uQsft7/XdPbhu4e+L0QMGJnIG7xysnys93zVRfGhsrO7PYV3Bkc6DweBguORnGy8+G2drUsNaWGTY6b4bVtqwwXXslTNdcDcNlF0Nv4Vnq/qUwU58V5pvywmJbfgA0wlpnSdjsLeMoDfd7S0IYKucoCw8HikMYKQ8PBkrCSuedsNpVuLnceXdxvadkbL23rGtz4F7lxkB5zsPhqtP3B8q3rfeVfW9joOKz90eq/iBMVP9OGCj+O4DM3/j5+00kzzh5BZJXIHkFfkavwLktn//N01ue/N1z7z71n1K3ffdb1z95btfN/S+k3z3+ek3xqTdHSs68tVJ8+s3QcG1HGCo8GWarUsNk+YUwVnYujJScDRMVKWGk9FwYKDoZRu+dCzOCBMdM3bUwVZsWpridbcwM8y03"
    }
    """
    
}
