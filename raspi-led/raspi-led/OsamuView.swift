//
//  OsamuView.swift
//  raspi-led
//
//  Created by 山田理 on 2020/08/29.
//  Copyright © 2020 中岡黎. All rights reserved.
//

import SwiftUI

struct OsamuView: View {
    @State var count:Int = 0
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button(action: {self.count += 1} ) {
                Text(String(count))
            }
        }
    }
}

struct OsamuView_Previews: PreviewProvider {
    static var previews: some View {
        OsamuView()
    }
}
