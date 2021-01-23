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
    var quizes: [Quiz] { get }
}

class QuizesViewModel { }

extension QuizesViewModel: QuizesViewModelProtocol {
    var appTitle: String {
        LocalizeKeys.appTitle
    }

    var pointsNumber: Int {
        5
    }

    var quizes: [Quiz] {
        Quiz.fakeArray()
    }
}
