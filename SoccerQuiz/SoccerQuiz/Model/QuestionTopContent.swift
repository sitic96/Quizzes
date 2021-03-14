//
//  QuestionTopContent.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/14/21.
//

import Foundation

enum QuestionTopContentType: String, Decodable {
    case text
    case image
}

struct QuestionTopContent: Decodable {
    let id: Int
    let type: QuestionTopContentType
    let content: Content
}
