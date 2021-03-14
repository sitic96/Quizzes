//
//  LoadedQuiz.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/14/21.
//

import Foundation

struct LoadedQuiz: Decodable {
    let id: Int
    let title: String
    let description: String
    let imageURLString: String
    let questions: [Question]
}
