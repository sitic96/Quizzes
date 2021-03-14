//
//  Question.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation

struct Question: Decodable {
    let id: Int
    let answer: Option
    let topContent: QuestionTopContent
    let bottomContent: QuestionBottomContent
}
