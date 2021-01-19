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
        self.id = Int32(question.id)

        switch question.topContent {
        case .image(let content):
            self.topContentType = "image"
            self.topContent = try CoreContent(from: content, into: context)
        case .text(let content):
            self.topContentType = "text"
            self.topContent = try CoreContent(from: content, into: context)
        }

        switch question.bottomContent {
        case .dropBox(let options):
            self.botContentType = "dropBox"
            self.botContent = try NSSet(array: options.map { try CoreOption(from: $0,
                                                                            into: context) })
        case .options(let options):
            self.botContentType = "4options"
            self.botContent = try NSSet(array: options.map { try CoreOption(from: $0,
                                                                            into: context) })
        }
    }
}
