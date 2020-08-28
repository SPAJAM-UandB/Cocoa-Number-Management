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
    @State private var blue = false
    @State private var yellow = false
    @State private var red = false
    @State private var green = false
    
    var body: some View {
            VStack{
//                Text(self.ledControll.stats)
//                Text(self.ledControll.led_mess)
//                VStack{
//                    Button(action: {self.ledControll.turnOnBlue()}){
//                        Image(systemName: "lightbulb")
//                        .resizable()
//                        .scaledToFit()
//                            .frame(width: 100, height: 100)
//                            .foregroundColor(.blue)
//                    }
//                    Button(action: {self.ledControll.turnOffBlue()}){
//                        Image(systemName: "lightbulb.slash")
//                        .resizable()
//                        .scaledToFit()
//                            .frame(width: 50, height: 50)
//                            .foregroundColor(.blue)
//                    }
//                }
                if self.ledControll.stats == "connect" {
                    Image(systemName: "wifi")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                } else {
                    Image(systemName: "wifi.slash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                Text(self.ledControll.button_mess)
                    .font(.title)
                Spacer()
                HStack{
                    Text("Illuminance: ")
                    Text(self.ledControll.illuminance)
                }
                .font(.largeTitle)
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        self.blue.toggle()
                        if self.blue {
                            self.ledControll.turnOnBlue()
                        } else {
                            self.ledControll.turnOffBlue()
                        }
                    })
                    {
                        if self.blue {
                            ZStack(){
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 120, height: 120)
                                Image(systemName: "lightbulb")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.white)
                            }
                        } else {
                            ZStack(){
                                Circle()
                                    .stroke(Color.blue, lineWidth: 5)
                                    .frame(width: 120, height: 120)
                                Image(systemName: "lightbulb.slash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                            }
                        }
                    }
                    Spacer()
                    Button(action: {
                        self.yellow.toggle()
                        if self.yellow {
                            self.ledControll.turnOnYellow()
                        } else {
                            self.ledControll.turnOffYellow()
                        }
                    })
                    {
                        if self.yellow {
                            ZStack(){
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width: 120, height: 120)
                                Image(systemName: "lightbulb")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.white)
                            }
                        } else {
                            ZStack(){
                                Circle()
                                    .stroke(Color.yellow, lineWidth: 5)
                                    .frame(width: 120, height: 120)
                                Image(systemName: "lightbulb.slash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        self.red.toggle()
                        if self.red {
                            self.ledControll.turnOnRed()
                        } else {
                            self.ledControll.turnOffRed()
                        }
                    })
                    {
                        if self.red {
                            ZStack(){
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 120, height: 120)
                                Image(systemName: "lightbulb")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.white)
                            }
                        } else {
                            ZStack(){
                                Circle()
                                    .stroke(Color.red, lineWidth: 5)
                                    .frame(width: 120, height: 120)
                                Image(systemName: "lightbulb.slash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.red)

                            }
                        }
                    }
                    Spacer()
                    Button(action: {
                        self.green.toggle()
                        if self.green {
                            self.ledControll.turnOnGreen()
                        } else {
                            self.ledControll.turnOffGreen()
                        }
                    })
                    {
                        if self.green {
                            ZStack(){
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 120, height: 120)
                                Image(systemName: "lightbulb")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.white)
                            }
                        } else {
                            ZStack(){
                                Circle()
                                    .stroke(Color.green, lineWidth: 5)
                                    .frame(width: 120, height: 120)
                                Image(systemName: "lightbulb.slash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.green)

                            }
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LedControll())
    }
}
