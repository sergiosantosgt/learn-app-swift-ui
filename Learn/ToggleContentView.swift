//
//  ToggleContentView.swift
//  Learn
//
//  Created by Sergio Santos on 22/10/24.
//

import SwiftUI

struct ToggleContentView: View {
    // MARK: - Toggle Example
    @State private var isOn: Bool = false

    var body: some View {
        VStack {
            Toggle(isOn: $isOn, label: {
                Text(isOn ? "ON" : "OFF")
                    .foregroundStyle(.white)
            }).fixedSize()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(isOn ? .yellow : .black)
    }
}

#Preview {
    NavigationStack {
        ToggleContentView()
    }
}
