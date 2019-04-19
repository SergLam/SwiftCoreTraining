//
//  WebSocketStarscreamVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/18/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import Starscream

class WebSocketStarscreamVC: UIViewController {
    
    let socket = WebSocket(url: URL(string: "ws://superfy.cc:2000")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        socket.advancedDelegate = self
        socket.connect()
    }
    
    deinit {
        socket.disconnect(forceTimeout: 0)
        socket.delegate = nil
    }
    
    func changeImage() {
        let requestString = """
            {
            "callName": "changeImage",
            "image": "iVBORw0KGgoAAAANSUhEUgAAAZAAAAGQCAYAAACAvzbMAAAAAXNSR0IArs4c6QAAABxpRE9UAAAAAgAAAAAAAADIAAAAKAAAAMgAAADIAAKb32fwHCcAAEAASURBVHgB7L1nbJ5pet9rx4hP9oPtFATIlyRGDBhI4A/+ECA5cQIkcRLkS2znxLu2z+7O1pktszs7s9N3mmZG09Rm1HtvFCVRpChSlEiKYhV777333kmV+/x+9zs65wRZJHa8fV8BD16KfMvzPuR7/e9/ua77V34l+S95BX4Br0AIv/KrZam7PjOcd/rvjZae/8djRSf+WV/B0X/ZmXPgP3TfOvAnQ6WnvzBadvYbExXn3xovv3B8suriraWG9LqR0vP9jTcOzNdn7FurSz/woDXn1IPO/Atr3XcvzY9W3ehf6SiuW+squrXWWXh8pS3/rfn6m9+Yrr/5hbnGW3+y3FnwHxZac//lUlfRP5urzf/Hi215fy8MlX0mhPCrv4CXOPmWklcgeQWSV+Dn7wqEsOVv1J3c8rdLT73+O0Wn3viDivNbP9uQsft7/XdPbhu4e+L0QMGJnIG7xysnys93zVRfGhsrO7PYV3Bkc6DweBguORnGy8+G2drUsNaWGTY6b4bVtqwwXXslTNdcDcNlF0Nv4Vnq/qUwU58V5pvywmJbfgA0wlpnSdjsLeMoDfd7S0IYKucoCw8HikMYKQ8PBkrCSuedsNpVuLnceXdxvadkbL23rGtz4F7lxkB5zsPhqtP3B8q3rfeVfW9joOKz90eq/iBMVP9OGCj+O4DM3/j5+00kzzh5BZJXIHkFfkavwLktn//N01ue/N1z7z71n1K3ffdb1z95btfN/S+k3z3+ek3xqTdHSs68tVJ8+s3QcG1HGCo8GWarUsNk+YUwVnYujJScDRMVKWGk9FwYKDoZRu+dCzOCBMdM3bUwVZsWpridbcwM8y03"
        }
        """
        if socket.isConnected {
            socket.write(string: requestString) {
                debugPrint("changeImage on  write")
            }
        } else {
            AlertPresenter.showError(at: self, error: "Socket not connected")
        }
    }
    
    func changeAnonImage() {
        let requestString = """
            {
            "callName": "changeAnonImage",
            "image": "iVBORw0KGgoAAAANSUhEUgAAAZAAAAGQCAYAAACAvzbMAAAAAXNSR0IArs4c6QAAABxpRE9UAAAAAgAAAAAAAADIAAAAKAAAAMgAAADIAAKb32fwHCcAAEAASURBVHgB7L1nbJ5pet9rx4hP9oPtFATIlyRGDBhI4A/+ECA5cQIkcRLkS2znxLu2z+7O1pktszs7s9N3mmZG09Rm1HtvFCVRpChSlEiKYhV777333kmV+/x+9zs65wRZJHa8fV8BD16KfMvzPuR7/e9/ua77V34l+S95BX4Br0AIv/KrZam7PjOcd/rvjZae/8djRSf+WV/B0X/ZmXPgP3TfOvAnQ6WnvzBadvYbExXn3xovv3B8suriraWG9LqR0vP9jTcOzNdn7FurSz/woDXn1IPO/Atr3XcvzY9W3ehf6SiuW+squrXWWXh8pS3/rfn6m9+Yrr/5hbnGW3+y3FnwHxZac//lUlfRP5urzf/Hi215fy8MlX0mhPCrv4CXOPmWklcgeQWSV+Dn7wqEsOVv1J3c8rdLT73+O0Wn3viDivNbP9uQsft7/XdPbhu4e+L0QMGJnIG7xysnys93zVRfGhsrO7PYV3Bkc6DweBguORnGy8+G2drUsNaWGTY6b4bVtqwwXXslTNdcDcNlF0Nv4Vnq/qUwU58V5pvywmJbfgA0wlpnSdjsLeMoDfd7S0IYKucoCw8HikMYKQ8PBkrCSuedsNpVuLnceXdxvadkbL23rGtz4F7lxkB5zsPhqtP3B8q3rfeVfW9joOKz90eq/iBMVP9OGCj+O4DM3/j5+00kzzh5BZJXIHkFfkavwLktn//N01ue/N1z7z71n1K3ffdb1z95btfN/S+k3z3+ek3xqTdHSs68tVJ8+s3QcG1HGCo8GWarUsNk+YUwVnYujJScDRMVKWGk9FwYKDoZRu+dCzOCBMdM3bUwVZsWpridbcwM8y03"
        }
        """
        if socket.isConnected {
            socket.write(string: requestString) {
                debugPrint("changeAnonImage on  write")
            }
        } else {
            AlertPresenter.showError(at: self, error: "Socket not connected")
        }
    }
    
    func sendMessage() {
        let requestString = """
            {"text": "Test send message","callName":"sendMessage","local_message_id":"-139","chat_id":"3226297"}
        """
        if socket.isConnected {
            socket.write(string: requestString) {
                debugPrint("sendMessage on  write")
            }
        } else {
            AlertPresenter.showError(at: self, error: "Socket not connected")
        }
    }
    
    func loginToSocket() {
        let requestString = """
{
    "callName": "loginToSocket",
    "user_id": "582549398928559",
    "app_version": "3.001",
    "access_token": "EAAXqsnpKyskBAEK8Svx2UOt5AfhobymK7gc5wTdnIllGS8FWGQBpzdZAnTzcVE8djL1weUvxXQiMirZCsCIqREmxTT5jrO7ykUNodhgmrNjMEEVoMuP2CpUYerRIm903ZCvJyZCPsoynBvobSrROV8ZAufwmrsvN3bNNL2r5jar3pQrjUo6iN5NS0z9YoX5FWHblDgETlrh6BZAVoqqltvA1nC4QRsDRBpId5ZCPkfhwQZDZD"
}
"""
        if socket.isConnected {
            socket.write(string: requestString) {
                debugPrint("loginToSocket on  write")
            }
        } else {
            AlertPresenter.showError(at: self, error: "Socket not connected")
        }
    }
    
    func enterChat() {
        let requestString = """
{
    "callName": "enterChat",
    "chat_id": "546426808",
}
"""
        if socket.isConnected {
            socket.write(string: requestString) {
                debugPrint("enter chat on  write")
            }
        } else {
            AlertPresenter.showError(at: self, error: "Socket not connected")
        }
        
    }
    
    func setProfileType() {
        let requestString = """
{
    "anon": 1,
    "callName": "setProfileType"
}
"""
        if socket.isConnected {
            socket.write(string: requestString) {
                debugPrint("setProfileType on  write")
            }
        } else {
            AlertPresenter.showError(at: self, error: "Socket not connected")
        }
    }
    
    func changeBio() {
        let requestString = """
{
    "bio": "Test bio",
    "callName": "changeBio"
}
"""
        if socket.isConnected {
            socket.write(string: requestString) {
                debugPrint("changeBio on  write")
            }
        } else {
            AlertPresenter.showError(at: self, error: "Socket not connected")
        }
    }
}





extension WebSocketStarscreamVC: WebSocketAdvancedDelegate {
    func websocketDidConnect(socket: WebSocket) {
        debugPrint("Connected")
        //        changeImage() // works
        //        sendMessage()
        loginToSocket() // works
//        changeAnonImage() // works
//        setProfileType()
//        changeBio() // works
        
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: Error?) {
        debugPrint("Disconnected")
        if let error = error {
            AlertPresenter.showError(at: self, error: error.localizedDescription)
        }
    }
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String, response: WebSocket.WSResponse) {
        debugPrint(text)
        debugPrint(response.code)
        //         AlertPresenter.showSuccessMessage(at: self, message: "Received message:" + text)
    }
    
    func websocketDidReceiveData(socket: WebSocket, data: Data, response: WebSocket.WSResponse) {
        debugPrint(response.code)
        AlertPresenter.showSuccessMessage(at: self, message: "Received data:" + String(describing: data))
    }
    
    func websocketHttpUpgrade(socket: WebSocket, request: String) {
        debugPrint("Request upgrade")
        debugPrint(request)
    }
    
    func websocketHttpUpgrade(socket: WebSocket, response: String) {
        debugPrint("Response upgrade")
        debugPrint(response)
    }
    
}
