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
    var showQuizzesViewState: ShowQuizzesViewState { get }
    var allQuizzes: [Quiz] { get }
    var allWithoutFinishedQuizzes: [Quiz] { get }

    var didToogleQuizzesState: (() -> Void)? { get set }

    func didSelectToogleQuizzesViewState()
}

class QuizesViewModel {
    private let quizzes: [Quiz]
    var _showQuizzesViewState: ShowQuizzesViewState = .hideFinished

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

    var showQuizzesViewState: ShowQuizzesViewState {
        _showQuizzesViewState
    }

    var allQuizzes: [Quiz] {
        quizzes.sorted(by: {
            $0.availabilityStatus < $1.availabilityStatus
        })
    }

    var allWithoutFinishedQuizzes: [Quiz] {
        quizzes
            .filter { $0.availabilityStatus != .finished }
            .sorted(by: {
                $0.availabilityStatus < $1.availabilityStatus
            })
    }

    func didSelectToogleQuizzesViewState() {
        if _showQuizzesViewState == .showAll {
            _showQuizzesViewState = .hideFinished
        } else if _showQuizzesViewState == .hideFinished {
            _showQuizzesViewState = .showAll
        }
        didToogleQuizzesState?()
    }
}
