//
//  CountContentView.swift
//  Learn
//
//  Created by Sergio Santos on 22/10/24.
//

import SwiftUI

struct CountContentView: View {
    // MARK: - Count Example
    @State private var count: Int = 0

    var body: some View {
        VStack {
            Text("Hello World!")
            Text("\(count)")
                .font(.largeTitle)

            Button("Increment") {
                count += 1
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        CountContentView()
    }
}
