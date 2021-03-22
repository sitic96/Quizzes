//
//  QuizzesRouter.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/26/21.
//

import UIKit

protocol QuizzesRouterProtocol {
    func goToDetails(of quiz: QuizPreview)
}

struct QuizzesRouter {
    weak var controller: UIViewController?
}

extension QuizzesRouter: QuizzesRouterProtocol {
    func goToDetails(of quiz: QuizPreview) {
        guard let quizPreviewVC = UIStoryboard(name: "Main",
                                               bundle: .main)
                .instantiateViewController(withIdentifier: "QuizPreviewViewController") as? QuizPreviewViewController else {
            return
        }
        quizPreviewVC.viewModel = QuizPreviewViewModel(quizPreview: quiz)

        controller?.present(quizPreviewVC, animated: true, completion: nil)
    }
}
