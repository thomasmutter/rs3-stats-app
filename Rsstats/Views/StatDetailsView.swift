//
//  StatDetails.swift
//  Rsstats
//
//  Created by Thomas Mutter on 23/04/2021.
//

import SwiftUI

struct StatDetailsView: View {
    
    let stat: StatModel
    
    var body: some View {
        VStack {
            Text("\(stat.name)")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
                .frame(height: 50)
            Text("\(stat.level)")
                .font(.largeTitle)
                .padding()
                .background(Color.black)
                .foregroundColor(.yellow)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Spacer()
                .frame(height: 100)
            Text("Progress to next level")
            HStack{
                Text("\(stat.level)")
                    .padding(.leading)
                ProgressBar(value: Float(Float.random(in: 0...1)))
                    .frame(height: 30)
                Text("\(stat.level + 1)")
                    .padding(.trailing)
            }
            Text("Experience: \(stat.xp)")
        }
    }
}

struct StatDetails_Previews: PreviewProvider {
    static var previews: some View {
        StatDetailsView(stat: StatModel(id: 0, name: "Attack", level: 99, xp: 13100000))
    }
}
