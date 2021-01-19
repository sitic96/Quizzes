//
//  WelcomeBackRouter.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import UIKit

protocol WelcomeBackRouterProtocol {
    func goToMainScreen()
}

struct WelcomeBackRouter {
    weak var controller: UIViewController?
}

extension WelcomeBackRouter: WelcomeBackRouterProtocol {
    func goToMainScreen() {
        guard let window = UIApplication.shared.keyWindow,
              let mainScreenFirstController = UIStoryboard(name: "Main", bundle: .main).instantiateInitialViewController() as? QuizesViewController else {
            return
        }
        mainScreenFirstController.viewModel = QuizesViewModel()
        controller?.view.window?.rootViewController = mainScreenFirstController
        UIView.transition(with: window, duration: 0.3,
                          options: .transitionCrossDissolve, animations: nil)
    }
}
