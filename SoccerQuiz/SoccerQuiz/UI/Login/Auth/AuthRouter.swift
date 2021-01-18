//
//  AuthRouter.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/17/21.
//

import UIKit

protocol AuthRouterProtocol {
    func goNext()
}

struct AuthRouter {
    weak var controller: UIViewController?
}

extension AuthRouter: AuthRouterProtocol {
    func goNext() {
        guard let welcomeVC = UIStoryboard(name: "Login",
                                           bundle: .main)
                .instantiateViewController(withIdentifier: "WelcomeBackContrller") as? WelcomeBackViewController else {
            return
        }
        welcomeVC.viewModel =
            WelcomeBackViewModel(welcomeMessageKey: LocalizeKeys.Auth.firstWelcomeMessage)
        welcomeVC.router = WelcomeBackRouter(controller: welcomeVC)
        welcomeVC.modalPresentationStyle = .overFullScreen
        controller?.present(welcomeVC, animated: true, completion: nil)
    }
}
