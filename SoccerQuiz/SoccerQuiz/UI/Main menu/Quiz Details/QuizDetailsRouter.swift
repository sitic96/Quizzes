//
//  QuizDetailsRouter.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/28/21.
//

import UIKit

protocol QuizDetailsRouterProtocol {
    func gotToQuestions(_ questions: [Question])
}

struct QuizDetailsRouter {
    weak var controller: UIViewController?
}

extension QuizDetailsRouter: QuizDetailsRouterProtocol {
    func gotToQuestions(_ questions: [Question]) {
        guard let questionsVC = UIStoryboard(name: "Main",
                                             bundle: .main)
                .instantiateViewController(withIdentifier: "QuestionsViewController") as? QuestionsViewController else {
            return
        }
        questionsVC.viewModel =
            QuestionsViewModel(availableQuestions: questions)
        questionsVC.modalPresentationStyle = .overFullScreen
        controller?.present(questionsVC, animated: true, completion: nil)
    }
}
