//
//  BubsApp.swift
//  Bubs
//
//  Created by Haya Albaker on 29/09/2024.

import SwiftUI

@main
struct BubsApp:App{
    @StateObject var vm = ViewModel()
    var body: some Scene {
        WindowGroup {
//            NavigationStack {
                HomePage()
                    .environmentObject(vm)
//            }
        }
    }
}
