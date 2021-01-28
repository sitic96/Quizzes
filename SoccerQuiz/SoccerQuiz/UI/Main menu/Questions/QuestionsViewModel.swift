//
//  QuestionsViewModel.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/28/21.
//

import Foundation

protocol QuestionsViewModelProtocol {
    var questions: [Question] { get }
}

class QuestionsViewModel {
    private let availableQuestions: [Question]

    init(availableQuestions: [Question]) {
        self.availableQuestions = availableQuestions
    }
}

extension QuestionsViewModel: QuestionsViewModelProtocol {
    var questions: [Question] {
        availableQuestions
    }
}
