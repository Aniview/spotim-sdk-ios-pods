//
//  AppDelegate.swift
//  SpotImStandaloneAds
//
//  Created by Pavlo Yevtukhov on 04/18/2023.
//  Copyright (c) 2023 Pavlo Yevtukhov. All rights reserved.
//

import AppTrackingTransparency
import SpotImStandaloneAds
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        SpotImAds.initSDK(
            spotId: AppConstants.spotId,
            storeURL: URL(string: AppConstants.storeURL)!
        )

        window?.rootViewController = UINavigationController(rootViewController: LandingViewController())
        window?.makeKeyAndVisible()

        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        ATTrackingManager.requestTrackingAuthorization { status in
            print("Tracking: authorized:", status == .authorized)
        }
    }
}
