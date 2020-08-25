//
//  ContentView.swift
//  cocoa-number-manegement-iOS
//
//  Created by 中岡黎 on 2020/08/25.
//  Copyright © 2020 中岡黎. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewmodel: CocoaViewModel

    var body: some View {
        VStack{
            Text(viewmodel.name)
            Button(action: {self.viewmodel.startScan()}){
                Text("buttun")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CocoaViewModel())
    }
}
