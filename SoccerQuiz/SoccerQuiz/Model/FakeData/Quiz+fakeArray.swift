//
//  Quiz+fakeArray.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/21/21.
//

import Foundation

extension Quiz {
    static func fakeArray() -> [Quiz] {
        [Quiz(id: 0, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: ""),
         Quiz(id: 0, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: ""),
         Quiz(id: 0, title: "First quiz with long name",
              description: "I'm your first quiz and my name is real long",
              imageURLString: ""),
         Quiz(id: 0, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: ""),
         Quiz(id: 0, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "")
        ]
    }
}
