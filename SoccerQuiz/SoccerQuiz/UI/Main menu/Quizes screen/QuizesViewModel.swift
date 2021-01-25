//
//  QuizesViewModel.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/19/21.
//

import Foundation

protocol QuizesViewModelProtocol {
    var appTitle: String { get }
    var pointsNumber: Int { get }
    var allQuizzes: [Quiz] { get }
}

class QuizesViewModel {
    private let quizzes: [Quiz]

    var didToogleQuizzesState: (() -> Void)?

    init(quizzes: [Quiz]) {
        self.quizzes = quizzes
    }
}

extension QuizesViewModel: QuizesViewModelProtocol {
    var appTitle: String {
        LocalizeKeys.appTitle
    }

    var pointsNumber: Int {
        5
    }

    var allQuizzes: [Quiz] {
        quizzes.sorted(by: {
            $0.availabilityStatus < $1.availabilityStatus
        })
    }
}
