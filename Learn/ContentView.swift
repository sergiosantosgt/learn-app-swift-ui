//
//  ContentView.swift
//  Learn
//
//  Created by Sergio Santos on 23/07/24.
//

import SwiftUI
import Observation

//struct LightBulbView: View {
//    
//    @Binding var isOn: Bool
//    
//    var body: some View {
//        VStack {
//            Image(systemName: isOn ?  "lightbulb.fill": "lightbulb")
//                .font(.largeTitle)
//                .foregroundStyle(isOn ? .yellow: .black)
//            Button("Toggle") {
//                isOn.toggle()
//            }
//        }
//    }
//}
//
//struct ContentView: View {
//    
//    @State private var isLightOn: Bool = false
//    
//    var body: some View {
//        VStack {
//            LightBulbView(isOn: $isLightOn)
//        }
//        .padding()
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(isLightOn ? .black: .white)
//    }
//}
//
//#Preview {
//    ContentView()
//}

// MARK: - Using app state ObservableObject

//// Pre iOS 17
//class AppState: ObservableObject {
//    @Published var isOn: Bool = false
//}
//
//struct LightBulbView: View {
//    
//    @EnvironmentObject private var appState: AppState
//    
//    var body: some View {
//        VStack {
//            Image(systemName: appState.isOn ? "lightbulb.fill": "lightbulb")
//                .font(.largeTitle)
//                .foregroundStyle(appState.isOn ? .yellow: .black)
//            Button("Toggle") {
//                appState.isOn.toggle()
//            }
//        }
//    }
//}
//
//struct LightRoomView: View {
//    
//    var body: some View {
//        LightBulbView()
//    }
//}
//
//struct ContentView: View {
//    
//    @EnvironmentObject private var appState: AppState
//    
//    var body: some View {
//        VStack {
//          LightRoomView()
//        }
//        .padding()
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(appState.isOn ? .black: .white)
//    }
//}
//
//#Preview {
//    ContentView()
//        .environmentObject(AppState())
//}

// MARK: - Using app state Environment

@Observable
class AppState {
    var isOn: Bool = false
}

struct LightBulbView: View {
    
    @Environment(AppState.self) private var appState: AppState
    
    var body: some View {
        
        @Bindable var appState = appState
        
        VStack {
            Image(systemName: appState.isOn ? "lightbulb.fill": "lightbulb")
                .font(.largeTitle)
                .foregroundStyle(appState.isOn ? .yellow: .black)
            
            Toggle("IsOn", isOn: $appState.isOn)
            
            /*
            Button("Toggle") {
                appState.isOn.toggle()
            } */
        }
    }
}

struct LightRoomView: View {
    
    var body: some View {
        LightBulbView()
    }
}

struct ContentView: View {
    
    @Environment(AppState.self) private var appState: AppState
    
    var body: some View {
        VStack {
          LightRoomView()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(appState.isOn ? .black: .white)
    }
}

#Preview {
    ContentView()
        .environment(AppState())
}
