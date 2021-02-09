//
//  QuestionsRouter.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 2/6/21.
//

import UIKit

protocol QuestionsRouterProtocol {
    func close()
}

struct QuestionsRouter {
    weak var controller: UIViewController?
}

extension QuestionsRouter: QuestionsRouterProtocol {
    func close() {
        controller?.navigationController?.popViewController(animated: true)
    }
}
