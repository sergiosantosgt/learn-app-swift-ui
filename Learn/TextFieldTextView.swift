//
//  TextFieldTextView.swift
//  Learn
//
//  Created by Sergio Santos on 22/10/24.
//

import SwiftUI

struct TextFieldTextView: View {
    
    // MARK: - TextField Example
    @State private var name: String = String()
    @State private var friends: [String] = []

    var body: some View {
        VStack {
            TextField("Enter name", text: $name)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    friends.append(name)
                    name = String()
                }

            List(friends, id: \.self) { friend in
                Text(friend)
            }

            Spacer()
        }.padding()
    }
}

#Preview {
    NavigationStack {
        TextFieldTextView()
    }
}
