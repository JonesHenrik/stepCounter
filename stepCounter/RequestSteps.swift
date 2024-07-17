//
//  RequestSteps.swift
//  stepCounter
//
//  Created by Henrik Jones on 7/15/24.
//

import Foundation
import HealthKit

// https://developer.apple.com/documentation/healthkit/setting_up_healthkit

class stepViewController {
    
    let healthStore = HKHealthStore()
    
    let healthType: Set = [HKQuantityType(.stepCount)]
   
    func requestStepCount() async {
        do {
            if HKHealthStore.isHealthDataAvailable() {
                try await healthStore.requestAuthorization(toShare: healthType, read: healthType)
            }
        } catch {
            // Will fail if the usage and share description aren't in your Info.plist or
            // Health data isn't available on the current device
            
            fatalError("*** An unexpected error occured while requesting authorization: \(error.localizedDescription)")
        }
    }
}
