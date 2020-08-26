//
//  ContentView.swift
//  raspi-led
//
//  Created by 中岡黎 on 2020/08/26.
//  Copyright © 2020 中岡黎. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var ledControll: LedControll
    
    var body: some View {
        VStack{
            Text(self.ledControll.stats)
            Text(self.ledControll.mess)
            HStack{
                VStack{
                    Button(action: {self.ledControll.turnOnBlue()}){
                        Image(systemName: "lightbulb")
                        .resizable()
                        .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                    }
                    Button(action: {self.ledControll.turnOffBlue()}){
                        Image(systemName: "lightbulb.slash")
                        .resizable()
                        .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                    }
                }
                VStack{
                    Button(action: {self.ledControll.turnOnYellow()}){
                        Image(systemName: "lightbulb")
                        .resizable()
                        .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.yellow)
                    }
                    Button(action: {self.ledControll.turnOffYellow()}){
                        Image(systemName: "lightbulb.slash")
                        .resizable()
                        .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.yellow)
                    }
                }
                VStack{
                    Button(action: {self.ledControll.turnOnRed()}){
                        Image(systemName: "lightbulb")
                        .resizable()
                        .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.red)
                    }
                    Button(action: {self.ledControll.turnOffRed()}){
                        Image(systemName: "lightbulb.slash")
                        .resizable()
                        .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.red)
                    }
                }
                VStack{
                    Button(action: {self.ledControll.turnOnGreen()}){
                        Image(systemName: "lightbulb")
                        .resizable()
                        .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.green)
                    }
                    Button(action: {self.ledControll.turnOffGreen()}){
                        Image(systemName: "lightbulb.slash")
                        .resizable()
                        .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.green)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LedControll())
    }
}
