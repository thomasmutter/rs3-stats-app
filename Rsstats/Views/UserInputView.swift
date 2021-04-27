//
//  UserInputView.swift
//  Rsstats
//
//  Created by Thomas Mutter on 27/04/2021.
//

import SwiftUI

struct UserInputView: View {
    
    @State private var username: String = ""
    
    @ObservedObject private var vm: UserInputViewModel = UserInputViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Enter your username")
                    .navigationTitle("Search")
                    .navigationBarTitleDisplayMode(.inline)
                TextField("Enter a username", text: $username)
                    .multilineTextAlignment(TextAlignment.center)
                    .autocapitalization(.none)
                Spacer()
                    .frame(height: 30)
                Button("Fetch stats") {
                    vm.loadStats(username: username)
                }
                .disabled(username.isEmpty)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                NavigationLink(
                    destination: StatListView(stats: vm.stats),
                    isActive: $vm.statsLoaded,
                    label: {
                        EmptyView()
                    })
            }
            .padding()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct UserInputView_Previews: PreviewProvider {
    static var previews: some View {
        UserInputView()
    }
}
