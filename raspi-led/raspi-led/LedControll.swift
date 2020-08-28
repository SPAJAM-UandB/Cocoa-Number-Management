//
//  LedControll.swift
//  raspi-led
//
//  Created by 中岡黎 on 2020/08/26.
//  Copyright © 2020 中岡黎. All rights reserved.
//

import Foundation
import SocketIO

class LedControll: ObservableObject{
    @Published var led_mess: String = "LEDを光らせよう"
    @Published var button_mess: String = "ボタンから送られてくる"
    @Published var stats: String = "disconnect"
    var manager: SocketManager!
    var socket: SocketIOClient!
    
    init(){
        manager = SocketManager(socketURL: URL(string: "http://163.221.68.245:5000/")!, config: [.log(true), .compress])
        socket = manager.defaultSocket
        
        socket.on(clientEvent: .connect) { data, ack in
            print("connect")
            self.stats = "connect"
        }
        
        socket.on(clientEvent: .disconnect) { data, ack in
            print("disconnect")
            self.stats = "disconnect"
        }

        socket.on("message") { data, ark in
            print("Message received")
        }
        
        socket.on("led") { data, ark in
            print(type(of: data[0] as! String))
            self.led_mess = data[0] as! String
        }
        
        socket.on("broad") { data, ark in
            print(type(of: data[0] as! String))
            self.button_mess = data[0] as! String
        }

        socket.connect()
    }
    
    func turnOnBlue(){
        print("turn on bule")
        self.socket.emit("on_blue", "data")
    }
    
    func turnOnYellow(){
        print("turn on yellow")
        self.socket.emit("on_yellow", "data")
    }
    
    func turnOnRed(){
        print("turn on red")
        self.socket.emit("on_red", "data")
    }
    
    func turnOnGreen(){
        print("turn on green")
        self.socket.emit("on_green", "data")
    }
    func turnOffBlue(){
        print("turn off bule")
        self.socket.emit("off_blue", "data")
    }
    
    func turnOffYellow(){
        print("turn off yellow")
        self.socket.emit("off_yellow", "data")
    }
    
    func turnOffRed(){
        print("turn off red")
        self.socket.emit("off_red", "data")
    }
    
    func turnOffGreen(){
        print("turn off green")
        self.socket.emit("off_green", "data")
    }
}
