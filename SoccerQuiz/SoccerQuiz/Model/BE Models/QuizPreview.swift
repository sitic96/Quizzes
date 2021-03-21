//
//  QuizPreview.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/13/21.
//

import Foundation

struct QuizPreview: Decodable, QuizPreviewable {
    let quizId: Int
    let title: String
    let imageURLString: String
    let description: String
}
