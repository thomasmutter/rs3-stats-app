//
//  UserInfo.swift
//  Rsstats
//
//  Created by Thomas Mutter on 29/04/2021.
//

import SwiftUI

struct UserInfo: View {
    
    let name: String
    let total: Int
    
    var body: some View {
        HStack {
            Image("runescape")
            VStack {
                Text("\(name)")
                Text("\(total)")
            }
        }
    }
}

struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserInfo(name: "Gele Ui", total: 2000)
    }
}
