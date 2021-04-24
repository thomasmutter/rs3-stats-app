//
//  StatRowView.swift
//  Rsstats
//
//  Created by Thomas Mutter on 23/04/2021.
//

import SwiftUI

struct StatRowView: View {
    
    var stat: StatModel
    
    var body: some View {
        HStack {
            Text("\(stat.name)")
            Spacer()
            Text("\(stat.level)")
        }.padding()
    }
}

struct StatRowView_Previews: PreviewProvider {
    static var previews: some View {
        StatRowView(stat: StatModel(name: "Attack", level: 99))
    }
}
