//
//  LoadingRouter.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/15/21.
//

import UIKit

protocol LoadingRouterProtocol {
    func goToMainScreen(previews: [QuizPreview])
}

struct LoadingRouter {
    weak var controller: LoadingViewController?
}

extension LoadingRouter: LoadingRouterProtocol {
    func goToMainScreen(previews: [QuizPreview]) {
        guard let window = UIApplication.shared.keyWindow,
              let mainScreenFirstController = UIStoryboard(name: "Main", bundle: .main).instantiateInitialViewController() as? UINavigationController,
              let quizzesVC = mainScreenFirstController.viewControllers.first as? QuizzesViewController else {
            return
        }
        quizzesVC.viewModel = QuizesViewModel(previews: previews)
        quizzesVC.router = QuizzesRouter(controller: quizzesVC)
        controller?.view.window?.rootViewController = mainScreenFirstController
        UIView.transition(with: window, duration: 0.3,
                          options: .transitionCrossDissolve, animations: nil)
    }
}
