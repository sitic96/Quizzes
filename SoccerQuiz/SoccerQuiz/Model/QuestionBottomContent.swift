//
//  QuestionBottomContent.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/14/21.
//

import Foundation

enum QuestionBottomContentType: String, Decodable {
    case options
    case dropBox
}
struct QuestionBottomContent: Decodable {
    let id: Int
    let type: QuestionBottomContentType
    let content: [Option]
}
