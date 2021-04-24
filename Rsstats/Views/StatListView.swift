//
//  IntroView.swift
//  Rsstats
//
//  Created by Thomas Mutter on 22/04/2021.
//

import SwiftUI

struct StatListView: View {
    
    @ObservedObject private var vm: StatListViewModel = StatListViewModel()
    var body: some View {
        NavigationView {
            VStack {
                List(vm.stats) { stat in
                    NavigationLink(destination: StatDetailsView(stat: stat)) {
                        StatRowView(stat: stat)
                    }
                    .navigationTitle("Rs3 Stats")
                }
                HStack {
                    Button(action: { vm.loadStats() }) {
                        Text("Fetch")
                    }
                    Spacer()
                    Button(action: { vm.clearStats() }) {
                        Text("Clear")
                    }
                }
                .padding()
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        StatListView()
    }
}
