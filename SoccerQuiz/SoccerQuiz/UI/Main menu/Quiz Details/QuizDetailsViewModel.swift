//
//  QuizDetailsViewModel.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/25/21.
//

import Foundation

protocol QuizDetailsViewModelProtocol {
    var quizTitle: String { get }
    var quizDescription: String { get }
    var questions: [QuizQuestion] { get }

    var didSelectGoToQuestions: (([Question]) -> Void)? { get set }

    func didSelectQuestion(at index: Int)
}

class QuizDetailsViewModel {
    private let quiz: Quiz

    var didSelectGoToQuestions: (([Question]) -> Void)?

    init(quiz: Quiz) {
        self.quiz = quiz
    }
}

extension QuizDetailsViewModel: QuizDetailsViewModelProtocol {
    var quizTitle: String {
        quiz.title
    }

    var quizDescription: String {
        quiz.description
    }

    var questions: [QuizQuestion] {
        quiz.questions
    }
    
    func didSelectQuestion(at index: Int) {
        didSelectGoToQuestions?(quiz.questions
                                    .filter { $0.status != .finished }
                                    .map { $0.question })
    }
}
