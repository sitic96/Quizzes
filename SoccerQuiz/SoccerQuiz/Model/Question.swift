//
//  Question.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation

enum QuestionTopContentType {
    case text(data: String)
    case image(urlString: String)
}

enum QuestionBottomContentType {
    case options(data: [String])
    case dropBox(data: [String])
}

struct Question {
    let id: Int
    let topContent: QuestionTopContentType
    let bottomContent: QuestionBottomContentType
}
