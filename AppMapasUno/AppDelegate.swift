//
//  AppDelegate.swift
//  AppMapasUno
//
//  Created by formador on 13/2/17.
//  Copyright © 2017 formador. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        APITaskManager.shared.cargarDatos()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        APITaskManager.shared.salvarDatos()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        APITaskManager.shared.salvarDatos()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        APITaskManager.shared.cargarDatos()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        APITaskManager.shared.cargarDatos()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        APITaskManager.shared.salvarDatos()
    }


}

