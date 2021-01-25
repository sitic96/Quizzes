//
//  QuizzesRouter.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/26/21.
//

import UIKit

protocol QuizzesRouterProtocol {
    func goToDetails(of quiz: Quiz)
}

struct QuizzesRouter {
    weak var controller: UIViewController?
}

extension QuizzesRouter: QuizzesRouterProtocol {
    func goToDetails(of quiz: Quiz) {
        guard let quizDetailcVC = UIStoryboard(name: "Main",
                                               bundle: .main)
                .instantiateViewController(withIdentifier: "QuizDetailsViewController") as? QuizDetailsViewController else {
            return
        }
        quizDetailcVC.viewModel = QuizDetailsViewModel(quiz: quiz)
        controller?.navigationController?.pushViewController(quizDetailcVC, animated: true)
    }
}
