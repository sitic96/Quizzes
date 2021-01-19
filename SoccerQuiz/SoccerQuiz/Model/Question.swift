//
//  Question.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation

enum QuestionTopContentType {
    case text(content: Content)
    case image(content: Content)
}

enum QuestionBottomContentType {
    case options(options: [Option])
    case dropBox(options: [Option])
}

struct Question {
    let id: Int
    let topContent: QuestionTopContentType
    let bottomContent: QuestionBottomContentType
}
