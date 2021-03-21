//
//  QuestionBottomContent.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/21/21.
//

import Foundation
import CoreData

@objc(CoreQuestionBottomContent)
class CoreQuestionBottomContent: NSManagedObject {
    static let entityName: String = "CoreQuestionBottomContent"

    public required convenience init(from botContent: QuestionBottomContent, into context: NSManagedObjectContext) throws {
        guard let entityDesc = NSEntityDescription.entity(forEntityName: CoreQuestionBottomContent.entityName, in: context) else {
            throw CoreDataError.cantInitEnity(CoreQuestionBottomContent.entityName)
        }
        self.init(entity: entityDesc, insertInto: context)

        self.id = Int32(botContent.id)
        self.type = botContent.type.rawValue
        self.options = NSSet(array: try botContent.options
                                .map { try CoreOption(from: $0, into: context) })
    }

    func toBotContent() -> QuestionBottomContent? {
        guard let type = QuestionBottomContentType(rawValue: self.type ?? ""),
              let options = (self.options?.compactMap { ($0 as? CoreOption)?.toOption() }) else {
            return nil
        }
        return QuestionBottomContent(id: Int(self.id),
                                     type: type,
                                     options: options)
    }
}
