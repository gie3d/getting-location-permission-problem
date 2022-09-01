//
//  testswiftuiApp.swift
//  watch WatchKit Extension
//
//  Created by gie on 31/8/22.
//

import SwiftUI

@main
struct testswiftuiApp: App {
    @StateObject var workoutManager = WorkoutManager()
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(workoutManager)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
