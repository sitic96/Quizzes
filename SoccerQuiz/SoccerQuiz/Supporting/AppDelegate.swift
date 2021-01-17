//
//  AppDelegate.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/17/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if UserDefaults.standard.bool(forKey: Const.UserDefaultsKeys.didLaunchBeforeKey) {
            guard let welcomeVC = UIStoryboard(name: "Login",
                                               bundle: .main)
                    .instantiateViewController(withIdentifier: "WelcomeBackContrller") as? WelcomeBackViewController else {
                return true
            }
            window?.rootViewController = welcomeVC
        } else {
            guard let authController = UIStoryboard(name: "Login",
                                                    bundle: .main).instantiateInitialViewController() as? AuthViewController else {
                return true
            }
            authController.viewModel = AuthViewModel()
            authController.router = AuthRouter(controller: authController)
            window?.rootViewController = authController
        }
        return true
    }
}

