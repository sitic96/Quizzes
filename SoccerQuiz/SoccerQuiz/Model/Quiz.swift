//
//  Quiz.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation

protocol QuizPreviewable {
    var title: String { get }
    var availabilityStatus: AvailabilityStatus { get }
}

extension QuizPreviewable {
    var availabilityStatus: AvailabilityStatus {
        .notAvailable
    }
}

enum AvailabilityStatus: String {
    case finished
    case started
    case available
    case notAvailable
}

enum QuizQuestionStatus: String, CaseIterable {
    case notStarted
    case started
    case finished
}

typealias QuizQuestion = (question: Question, status: QuizQuestionStatus)

struct Quiz: QuizPreviewable {
    let id: Int
    let title: String
    let description: String
    let imageURLString: String
    let availabilityStatus: AvailabilityStatus
    let questions: [QuizQuestion]
}
