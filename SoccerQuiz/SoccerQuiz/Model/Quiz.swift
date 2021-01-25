//
//  Quiz.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation

enum AvailabilityStatus: Comparable {
    case finished
    case started
    case available
    case notAvailable
}

enum QuizQuestionStatus: CaseIterable {
    case notStarted
    case started
    case finished
}

typealias QuizQuestion = (question: Question, status: QuizQuestionStatus)

struct Quiz {
    let id: Int
    let title: String
    let description: String
    let imageURLString: String
    let availabilityStatus: AvailabilityStatus
    let questions: [QuizQuestion]
}
