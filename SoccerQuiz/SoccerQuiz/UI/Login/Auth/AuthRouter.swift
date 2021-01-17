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
        
    }
}
