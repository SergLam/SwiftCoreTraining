//
//  SocketManager.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/18/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation
import Starscream

enum SocketTarget: String {
    
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
