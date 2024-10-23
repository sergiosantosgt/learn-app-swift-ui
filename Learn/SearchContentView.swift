//
//  SearchContentView.swift
//  Learn
//
//  Created by Sergio Santos on 22/10/24.
//

import SwiftUI

struct SearchContentView: View {
    
    // MARK: - Filtering Example
    @State private var search: String = ""
    @State private var friends: [String] = ["Sergio", "Lucas", "Jose", "Marcus"]
    @State private var filteredFriends: [String] = []
    
    var body: some View {
        VStack {
            List(filteredFriends, id: \.self) { friend in
                Text(friend)
            }
            .listStyle(.plain)
            .searchable(text: $search)
            .onChange(of: search) {
                filteredFriends = friends.filter {
                    $0.contains(search)
                }
                if filteredFriends.isEmpty {
                    filteredFriends = friends
                }
            }
            Spacer()
        }.padding()
            .onAppear(perform: {
                filteredFriends = friends
            })
            .navigationTitle("Friends")
    }
}

#Preview {
    NavigationStack {
        SearchContentView()
    }
}
