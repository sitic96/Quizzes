//
//  WelcomeBackRouter.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import UIKit

protocol WelcomeBackRouterProtocol {
    func goToMainScreen()
    func goToLoadingScreen()
}

struct WelcomeBackRouter {
    weak var controller: UIViewController?
}

extension WelcomeBackRouter: WelcomeBackRouterProtocol {
    func goToMainScreen() {
        guard let window = UIApplication.shared.keyWindow,
              let mainScreenFirstController = UIStoryboard(name: "Main", bundle: .main).instantiateInitialViewController() as? UINavigationController,
              let quizzesVC = mainScreenFirstController.viewControllers.first as? QuizzesViewController else {
            return
        }
        quizzesVC.viewModel = QuizesViewModel(previews: [])
        quizzesVC.router = QuizzesRouter(controller: quizzesVC)
        controller?.view.window?.rootViewController = mainScreenFirstController
        UIView.transition(with: window, duration: 0.3,
                          options: .transitionCrossDissolve, animations: nil)
    }

    func goToLoadingScreen() {
        guard let loadingVC = UIStoryboard(name: "Loading", bundle: .main)
                .instantiateInitialViewController() as? LoadingViewController else {
            return
        }
        loadingVC.viewModel = LoadingViewModel(networkManager: NetworkManager.shared)
        loadingVC.router = LoadingRouter(controller: loadingVC)
        loadingVC.modalPresentationStyle = .overFullScreen
        controller?.present(loadingVC, animated: true, completion: nil)
    }
}
