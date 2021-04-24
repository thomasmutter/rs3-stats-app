//
//  ProgressBar.swift
//  Rsstats
//
//  Created by Thomas Mutter on 23/04/2021.
//

import SwiftUI

struct ProgressBar: View {
    var value: Float = 0
    // TODO: Animate bar progressing when initializing
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .foregroundColor(.white)
                    .border(Color.black, width: 1)
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width) , height: geometry.size.height)
                    .foregroundColor(.green)
                    .border(Color.black, width: 1)
                Text("\(Int(round(self.value*100)))%")
                    .position(x: geometry.size.width/2, y: geometry.size.height/2)
            }
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: 0.3)
    }
}
