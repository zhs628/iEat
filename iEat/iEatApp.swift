//
//  iEatApp.swift
//  iEat
//
//  Created by zhs on 2024/7/27.
//
import SwiftUI
import SwiftData

@main
struct iEatApp: App {
    @StateObject private var stateMachine = StateMachine()
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(self.stateMachine)
            
        }
    }
}
