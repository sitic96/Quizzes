//
//  CoreQuestion.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation
import CoreData

@objc(CoreQuestion)
class CoreQuestion: NSManagedObject {
    static let entityName = "CoreQuestion"

    public required convenience init(from question: Question, into context: NSManagedObjectContext) throws {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: CoreQuestion.entityName, in: context) else {
            throw CoreDataError.cantInitEnity(CoreQuestion.entityName)
        }
        self.init(entity: entityDescription, insertInto: context)
        self.id = Int32(question.id)

        self.answer = try CoreOption(from: question.answer, into: context)

        self.topContent = try CoreQuestionTopContent(from: question.topContent,
                                                     into: context)
        self.botContent = try CoreQuestionBottomContent(from: question.bottomContent,
                                                                             into: context)
    }

    func toQuestion() -> Question? {
        guard let answer = self.answer?.toOption(),
              let fetchedTopContent = self.topContent?.toTopContent(),
              let fetchedBotContent = self.botContent?.toBotContent() else {
            return nil
        }
        return Question(id: Int(self.id),
                        answer: answer,
                        topContent: fetchedTopContent,
                        bottomContent: fetchedBotContent)
    }
}
