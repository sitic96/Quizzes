//
//  CoreQuestion.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation
import CoreData

@objc class CoreQuestion: NSManagedObject {
    private static let entityName = "CoreQuestion"

    init(from question: Question, into context: NSManagedObjectContext) throws {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: CoreQuestion.entityName, in: context) else {
            throw CoreDataError.cantInitEnity(CoreQuestion.entityName)
        }
        super.init(entity: entityDescription, insertInto: context)
        self.id = Int16(question.id)
        switch question.topContent {
        case .image(let urlString):
            self.topContentType = "image"
        case .text(let data):
            self.botContentType = "text"
        }
    }
}
