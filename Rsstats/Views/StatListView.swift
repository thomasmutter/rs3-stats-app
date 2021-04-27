//
//  IntroView.swift
//  Rsstats
//
//  Created by Thomas Mutter on 22/04/2021.
//

import SwiftUI

struct StatListView: View {
    
    let stats: [StatModel]
    
    var body: some View {
            List(stats) { stat in
                NavigationLink(destination: StatDetailsView(stat: stat)) {
                    StatRowView(stat: stat)
                }
            }
            .padding()
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        StatListView(stats: [StatModel()])
    }
}
