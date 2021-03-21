//
//  CoreDataError.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation

enum CoreDataError: Error {
    case cantInitEnity(String)
    case errorInSaving(underlineError: Error)
}
