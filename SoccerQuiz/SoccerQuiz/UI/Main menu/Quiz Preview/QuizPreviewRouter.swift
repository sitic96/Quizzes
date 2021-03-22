//
//  QuizPreviewRouter.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/22/21.
//

import UIKit

protocol QuizPreviewRouterProtocol {
    func close()
}

struct QuizPreviewRouter {
    weak var controller: UIViewController?
}

extension QuizPreviewRouter: QuizPreviewRouterProtocol {
    func close() {
        controller?.dismiss(animated: true, completion: nil)
    }
}
