//
//  AppDelegate.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 16.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)

		let musicListViewController = MusicListViewController()
		let navigationController = UINavigationController(rootViewController: musicListViewController)
		self.window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
		return true
	}

}
