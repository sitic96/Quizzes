//
//  Option.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/19/21.
//

import Foundation

enum OptionType: String, Decodable {
    case player
    case club
    case unknown
}

struct Option: Decodable {
    let id: Int
    let type: OptionType
    let title: String
}
