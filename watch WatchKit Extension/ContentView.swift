//
//  ContentView.swift
//  watch WatchKit Extension
//
//  Created by gie on 31/8/22.
//

import SwiftUI
import HealthKit
import CoreLocation

struct ContentView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
            Button(action: {
                workoutManager.requestLocationAuthorization()
            }) {
                Text("Request Location Permission")
            }
            Button(action: {
                workoutManager.requestLocationAuthorizationWithDispatch()
            }) {
                Text("Request ( Dispatch )Location Permission")
            }
        }
        .onAppear() {
            print("on appear - content view")
            workoutManager.requestLocationAuthorizationWithDispatch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WorkoutManager())
    }
}
