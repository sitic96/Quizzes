//
//  CachingManager.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation

typealias CachingCompletion = ((Result<Void, Error>) -> Void)

protocol CachingManagerProtocol {
    func saveQuiz(_ quizzes: [Quiz], completion: CachingCompletion?)
}

class CachingManager {
    static let shared: CachingManagerProtocol = CachingManager()
    private let coreDataManager: CoreDataManagerProtocol

    private init(coreDataManager: CoreDataManagerProtocol = CoreDataManager.shared) {
        self.coreDataManager = coreDataManager
    }
}

extension CachingManager: CachingManagerProtocol {
    func saveQuiz(_ quizzes: [Quiz], completion: CachingCompletion?) {
        coreDataManager.saveQuizzes(quizzes, completion: completion)
    }
}
