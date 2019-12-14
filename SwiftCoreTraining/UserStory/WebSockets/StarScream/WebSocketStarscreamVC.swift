//
//  WebSocketStarscreamVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/18/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import Starscream

final class WebSocketStarscreamVC: UIViewController {
    // ws://superfy.cc:2000 - outdated server, from old app
    // https://devchat.sprfy.com - use this endpoint
    let socket = WebSocket(url: URL(string: "ws://superfy.cc:2000")!)
    
    let contentView = WebSocketStarscreamView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonsActions()
        socket.advancedDelegate = self
        socket.connect()
    }
    
    deinit {
        socket.disconnect(forceTimeout: 0)
        socket.delegate = nil
    }
    
    private func setupButtonsActions() {
        for (index, button) in contentView.buttons.enumerated() {
            button.tag = index
            button.addTarget(self, action: #selector(sendDataToSocket), for: .touchUpInside)
        }
    }
    
    @objc func sendDataToSocket(_ button: UIButton) {
        let index = button.tag
        let data = SocketTargetData.allCases[index]
        let callType = SocketTarget.allCases[index]
        if socket.isConnected {
            socket.write(string: data.rawValue) {
                debugPrint("\(callType.rawValue) on  write")
            }
        } else {
            AlertPresenter.showError(at: self, error: "Socket not connected")
        }
    }
    
}

extension WebSocketStarscreamVC: WebSocketAdvancedDelegate {
    func websocketDidConnect(socket: WebSocket) {
        debugPrint("Connected")        
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: Error?) {
        debugPrint("Disconnected")
        if let error = error {
            AlertPresenter.showError(at: self, error: error.localizedDescription)
        } else {
            socket.connect()
        }
    }
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String, response: WebSocket.WSResponse) {
        debugPrint(text)
        debugPrint(response.code)
        AlertPresenter.showSuccessMessage(at: self, message: "Received message:" + text)
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
