//
//  Question+fakeArray.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/25/21.
//

import Foundation

extension Question {
    static func fakeArray() -> [Question] {
        return [
            Question(id: 0,
                     answer: Option(id: 0,
                                    type: .player,
                                    title: "Palyer #1"),
                     topContent: QuestionTopContent(id: 0, type: .text,
                                                    content: Content(id: 0,
                                                                     content: "Who's the best player?")),
                     bottomContent: QuestionBottomContent(id: 0,
                                                          type: .options,
                                                          options: [Option(id: 0,
                                                                           type: .player,
                                                                           title: "Palyer #1"),
                                                                    Option(id: 1,
                                                                           type: .player,
                                                                           title: "Palyer #2"),
                                                                    Option(id: 2,
                                                                           type: .player,
                                                                           title: "Palyer #3"),
                                                                    Option(id: 3,
                                                                           type: .player,
                                                                           title: "Palyer #4")])),
            Question(id: 1,
                     answer: Option(id: 1,
                                    type: .player,
                                    title: "Palyer #2"),
                     topContent: QuestionTopContent(id: 1, type: .text,
                                                    content: Content(id: 1,
                                                                     content: "Who's the best player #1?")),
                     bottomContent: QuestionBottomContent(id: 0,
                                                          type: .options,
                                                          options: [Option(id: 0,
                                                                           type: .player,
                                                                           title: "Palyer #1"),
                                                                    Option(id: 1,
                                                                           type: .player,
                                                                           title: "Palyer #2"),
                                                                    Option(id: 2,
                                                                           type: .player,
                                                                           title: "Palyer #3"),
                                                                    Option(id: 3,
                                                                           type: .player,
                                                                           title: "Palyer #4")])),
            Question(id: 2,
                     answer: Option(id: 2,
                                    type: .player,
                                    title: "Palyer #3"),
                     topContent: QuestionTopContent(id: 2, type: .text,
                                                    content: Content(id: 2,
                                                                     content: "Who's the best player #2?")),
                     bottomContent: QuestionBottomContent(id: 0,
                                                          type: .options,
                                                          options: [Option(id: 0,
                                                                           type: .player,
                                                                           title: "Palyer #1"),
                                                                    Option(id: 1,
                                                                           type: .player,
                                                                           title: "Palyer #2"),
                                                                    Option(id: 2,
                                                                           type: .player,
                                                                           title: "Palyer #3"),
                                                                    Option(id: 3,
                                                                           type: .player,
                                                                           title: "Palyer #4")])),
            Question(id: 3,
                     answer: Option(id: 3,
                                    type: .player,
                                    title: "Palyer #4"),
                     topContent: QuestionTopContent(id: 3, type: .text,
                                                    content: Content(id: 3,
                                                                     content: "Who's the best player #3?")),
                     bottomContent: QuestionBottomContent(id: 0,
                                                          type: .options,
                                                          options: [Option(id: 0,
                                                                           type: .player,
                                                                           title: "Palyer #1"),
                                                                    Option(id: 1,
                                                                           type: .player,
                                                                           title: "Palyer #2"),
                                                                    Option(id: 2,
                                                                           type: .player,
                                                                           title: "Palyer #3"),
                                                                    Option(id: 3,
                                                                           type: .player,
                                                                           title: "Palyer #4")])),
            Question(id: 4,
                     answer: Option(id: 4,
                                    type: .player,
                                    title: "Palyer #5"),
                     topContent: QuestionTopContent(id: 4, type: .text,
                                                    content: Content(id: 4,
                                                                     content: "Who's the best player #4?")),
                     bottomContent: QuestionBottomContent(id: 0,
                                                          type: .options,
                                                          options: [Option(id: 0,
                                                                           type: .player,
                                                                           title: "Palyer #1"),
                                                                    Option(id: 1,
                                                                           type: .player,
                                                                           title: "Palyer #2"),
                                                                    Option(id: 2,
                                                                           type: .player,
                                                                           title: "Palyer #3"),
                                                                    Option(id: 3,
                                                                           type: .player,
                                                                           title: "Palyer #4")]))
        ]
    }
}
