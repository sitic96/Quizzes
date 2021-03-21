//
//  CoreDataManager.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/21/21.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    func saveQuizzes(_ quizzes: [Quiz], completion: CachingCompletion?)
    func fetchQuizzes() -> [Quiz]
}

class CoreDataManager {
    static let shared: CoreDataManagerProtocol = CoreDataManager()

    private let container: NSPersistentContainer

    private init!() {
        container = NSPersistentContainer(name: Const.containerName)

        let semaphore = DispatchSemaphore(value: 0)
        var errorInStoreLoading: Error?
        container.loadPersistentStores { _, error in
            errorInStoreLoading = error
            semaphore.signal()
        }
        semaphore.wait()

        if let _ = errorInStoreLoading {
            return nil
        }
    }
}

extension CoreDataManager: CoreDataManagerProtocol {
    func saveQuizzes(_ quizzes: [Quiz], completion: CachingCompletion?) {
        container.performBackgroundTask { context in
            context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
            quizzes.forEach {
                let quizObject = try? CoreQuiz(from: $0, into: context)
            }

            do {
                try context.save()
                completion?(.success(Void()))
            } catch {
                completion?(.failure(CoreDataError.errorInSaving(underlineError: error)))
            }
        }
    }

    func fetchQuizzes() -> [Quiz] {
        let request = NSFetchRequest<NSManagedObject>(entityName: CoreQuiz.entityName)

        do {
            let rawResults = try container.viewContext.fetch(request)
            var quizzes = [Quiz]()
            rawResults.forEach {
                if let quiz = ($0 as? CoreQuiz)?.toQuiz() {
                    quizzes.append(quiz)
                }
            }
            return quizzes
        }
        catch {
            return []
        }
    }
}

fileprivate extension Const {
    static let containerName = "SoccerQuiz"
}
