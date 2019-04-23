//
//  WebSocketSocketIOVC.swift
//  SwiftCoreTraining
//
//  Created by IdeaSoft on 4/22/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import SocketIO

class WebSocketSocketIOVC: UIViewController {
    // ws://superfy.cc:2000 - outdated server, from old app
    // https://devchat.sprfy.com - use this endpoint
    static let manager = SocketManager(socketURL: URL(string: "https://devchat.sprfy.com")!,
                                       config: [.log(true), .compress, .reconnects(true),
                                                .reconnectWait(3), .reconnectWaitMax(5),
                                                .reconnectAttempts(-1)])
    let socket: SocketIOClient = manager.defaultSocket
    
    let contentView = WebSocketSocketIOView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonsActions()
        
        setupSocketConnection()
        setupSocketListeners()
    }
    
    private func setupButtonsActions() {
        for (index, button) in contentView.buttons.enumerated() {
            button.tag = index
            button.addTarget(self, action: #selector(sendDataToSocket), for: .touchUpInside)
        }
    }
    
    @objc func sendDataToSocket(_ button: UIButton) {
        let index = button.tag
        let data = SocketCallsJSONData.allData[index]
        // let callType = SocketCalls.allCases[index]
        if socket.status == .connected {
            socket.emit("message", data) {
                debugPrint("message on  write")
            }
        } else {
            AlertPresenter.showError(at: self, error: "Socket not connected")
        }
    }
    
    private func setupSocketConnection() {
        socket.on(clientEvent: .connect) {data, ack in
            debugPrint("socket connected")
        }
        socket.on(clientEvent: .disconnect) { (data, ack) in
            debugPrint("socket disconnected")
        }
        socket.on(clientEvent: .reconnect) { (data, ack) in
            debugPrint("socket reconnected")
        }
        socket.on(clientEvent: .error) { [unowned self] (data, ack) in
            AlertPresenter.showError(at: self, error: String(describing: data))
        }
        socket.connect()
    }
    
    private func setupSocketListeners() {
        socket.on("message") { [unowned self] (data, ack) in
            let response = String(describing: data.first)
            AlertPresenter.showSocketEventDescription(at: self, title: "Socket incoming message", message: response)
        }
    }
}
