//
//  Option.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/19/21.
//

import Foundation

enum OptionType: String {
    case player
    case club
}

struct Option {
    let id: Int
    let type: OptionType
    let title: String
}
