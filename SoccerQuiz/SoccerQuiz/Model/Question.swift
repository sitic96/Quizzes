//
//  Question.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation

enum QuestionTopContent {
    case text(content: Content)
    case image(content: Content)
}

enum QuestionBottomContent {
    case options(options: [Option])
    case dropBox(options: [Option])
}

struct Question {
    let id: Int
    let answer: [Option]
    let topContent: QuestionTopContent
    let bottomContent: QuestionBottomContent
}
