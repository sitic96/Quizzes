//
//  CoreQuestionTopContent.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/21/21.
//

import Foundation
import CoreData

@objc(CoreQuestionTopContent)
class CoreQuestionTopContent: NSManagedObject {
    static let entityName = "CoreQuestionTopContent"

    public required convenience init(from topContent: QuestionTopContent, into context: NSManagedObjectContext) throws {
        guard let entityDesc = NSEntityDescription.entity(forEntityName: CoreQuestionTopContent.entityName, in: context) else {
            throw CoreDataError.cantInitEnity(CoreQuestionTopContent.entityName)
        }
        self.init(entity: entityDesc, insertInto: context)
        self.id = Int32(topContent.id)
        self.type = topContent.type.rawValue
        self.content = try CoreContent(from: topContent.content, into: context)
    }

    func toTopContent() -> QuestionTopContent? {
        guard let type = QuestionTopContentType(rawValue: self.type ?? ""),
              let content = self.content?.toContent() else {
            return nil
        }
        return QuestionTopContent(id: Int(self.id),
                           type: type,
                           content: content)
    }
}
