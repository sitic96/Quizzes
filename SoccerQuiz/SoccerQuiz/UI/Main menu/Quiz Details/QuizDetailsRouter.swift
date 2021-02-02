//
//  QuizDetailsRouter.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/28/21.
//

import UIKit

protocol QuizDetailsRouterProtocol {
    func goToQuestions(of quiz: Quiz)
}

struct QuizDetailsRouter {
    weak var controller: UIViewController?
}

extension QuizDetailsRouter: QuizDetailsRouterProtocol {
    func goToQuestions(of quiz: Quiz) {
        guard let questionsVC = UIStoryboard(name: "Main",
                                             bundle: .main)
                .instantiateViewController(withIdentifier: "QuestionsViewController") as? QuestionsViewController else {
            return
        }
        questionsVC.viewModel =
            QuestionsViewModel(quiz: quiz)
        questionsVC.modalPresentationStyle = .overFullScreen
        controller?.navigationController?.pushViewController(questionsVC, animated: true)
    }
}
