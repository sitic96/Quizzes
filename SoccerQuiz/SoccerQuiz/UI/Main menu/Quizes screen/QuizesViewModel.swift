//
//  QuizesViewModel.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/19/21.
//

import Foundation

protocol QuizesViewModelProtocol {
    var pointsNumber: Int { get }
}

class QuizesViewModel { }

extension QuizesViewModel: QuizesViewModelProtocol {
    var pointsNumber: Int {
        5
    }
}
