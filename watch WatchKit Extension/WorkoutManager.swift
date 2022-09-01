//
//  WorkoutManager.swift
//  wind-watch WatchKit Extension
//
//  Created by gie on 2/8/22.
//

import Foundation
import HealthKit
import CoreLocation

class WorkoutManager: NSObject, ObservableObject {
    
    let healthStore = HKHealthStore()
    let locationManager = CLLocationManager()
    
    func requestLocationAuthorization() {
        print("prepare to request location permission")
        
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            
            print("it is enabled")
            switch self.locationManager.authorizationStatus {
                case .notDetermined:
                    print("not determined")
                case .restricted:
                    print("restricted")
                case .denied:
                    print("denied")
                case .authorizedAlways, .authorizedWhenInUse:
                    print("Access")
            }
        } else {
            print("it is not enabled")
        }
        
    }
    
    func requestHealthAuthorization() {
        // The quantity type to write to the health store.
        let typesToShare: Set = [HKQuantityType.workoutType(), HKSeriesType.workoutRoute()]
        
        // The quantity types to read from the health store.
        let typesToRead: Set = [
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .appleExerciseTime)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
            HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!,
            HKObjectType.activitySummaryType(),
        ]
        
        
        // Request authorization for those quantity types.
        HKHealthStore().requestAuthorization(toShare: typesToShare, read: typesToRead) {
            (success, error) in
            // Handle error.
        }
    }
}
