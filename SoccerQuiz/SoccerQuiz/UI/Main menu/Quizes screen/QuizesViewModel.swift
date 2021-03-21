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
    var allQuizzes: [QuizPreview] { get }
}

class QuizesViewModel {
    private let previews: [QuizPreview]

    var didToogleQuizzesState: (() -> Void)?

    init(previews: [QuizPreview]) {
        self.previews = previews
    }
}

extension QuizesViewModel: QuizesViewModelProtocol {
    var appTitle: String {
        LocalizeKeys.appTitle
    }

    var pointsNumber: Int {
        5
    }

    var allQuizzes: [QuizPreview] {
        previews
    }
}
