//
//  QuestionsRouter.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 2/6/21.
//

import UIKit

protocol QuestionsRouterProtocol {
    func close()
    func showGetHelpScreen(for question: Question)
}

struct QuestionsRouter {
    weak var controller: UIViewController?
}

extension QuestionsRouter: QuestionsRouterProtocol {
    func close() {
        controller?.navigationController?.popViewController(animated: true)
    }

    func showGetHelpScreen(for question: Question) {
        guard let getHelpController = UIStoryboard(name: "Main", bundle: .main)
                .instantiateViewController(withIdentifier: "GetHelpViewController") as? GetHelpViewController else {
            return
        }
        getHelpController.viewModel = GetHelpViewModel(question: question)
        getHelpController.router = GetHelpRouter(controller: getHelpController)
        getHelpController.modalPresentationStyle = .overFullScreen
        getHelpController.modalTransitionStyle = .crossDissolve
        controller?.present(getHelpController, animated: true, completion: nil)
    }
}
