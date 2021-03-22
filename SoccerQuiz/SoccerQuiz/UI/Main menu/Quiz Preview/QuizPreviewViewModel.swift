//
//  QuizPreviewViewModel.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/22/21.
//

import Foundation

protocol QuizPreviewViewModelProtocol {
    var quizPreview: QuizPreview { get }
    var isQuizAvailableToStart: Bool { get }
}

class QuizPreviewViewModel {
    var quizPreview: QuizPreview

    init(quizPreview: QuizPreview) {
        self.quizPreview = quizPreview
    }
}

extension QuizPreviewViewModel: QuizPreviewViewModelProtocol {
    // To be implemented in next phase, for now all quizzes are available
    var isQuizAvailableToStart: Bool {
        true
    }
}
