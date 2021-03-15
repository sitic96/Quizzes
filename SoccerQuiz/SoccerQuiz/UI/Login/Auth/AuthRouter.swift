//
//  AuthRouter.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/17/21.
//

import UIKit

protocol AuthRouterProtocol {
    func goToLoadingScreen()
}

struct AuthRouter {
    weak var controller: UIViewController?
}

extension AuthRouter: AuthRouterProtocol {
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
