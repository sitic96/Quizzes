//
//  GetHelpRouter.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 2/9/21.
//

import UIKit

protocol GetHelpRouterProtocol {
    func close()
}

struct GetHelpRouter {
    weak var controller: UIViewController?
}

extension GetHelpRouter: GetHelpRouterProtocol {
    func close() {
        controller?.dismiss(animated: true, completion: nil)
    }
}
