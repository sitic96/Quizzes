//
//  QuestionsViewModel.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/28/21.
//

import Foundation

protocol QuestionsViewModelProtocol {
    var quizName: String { get }
    var questions: [Question] { get }
    var questionsWithStatus: [QuizQuestion] { get }
}

class QuestionsViewModel {
    private let quiz: Quiz

    init(quiz: Quiz) {
        self.quiz = quiz
    }
}

extension QuestionsViewModel: QuestionsViewModelProtocol {
    var quizName: String {
        quiz.title
    }

    var questions: [Question] {
        quiz.questions.map { $0.question }
    }

    var questionsWithStatus: [QuizQuestion] {
        quiz.questions
    }
}