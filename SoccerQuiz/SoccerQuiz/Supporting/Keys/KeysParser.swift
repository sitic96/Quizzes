//
//  SecretKeys.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/14/21.
//

import Foundation

protocol SecretKeysProtocol {
    var apiKey: String { get }
    var quizPreviewsAPIKey: String { get }
    var quizAPIKey: String { get }
}

/// - Important: You need to add Keys.plist to the project to use api calls, please contact developer to get this file

class SecretKeys {
    static let shared: SecretKeysProtocol = SecretKeys()

    var keys: NSDictionary

    private init() {
        keys = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Keys", ofType: "plist")!)!
    }
}

extension SecretKeys: SecretKeysProtocol {
    var apiKey: String {
        keys[Const.apiKey] as! String
    }

    var quizPreviewsAPIKey: String {
        keys[Const.previewsKey] as! String
    }

    var quizAPIKey: String {
        keys[Const.quizKey] as! String
    }
}

fileprivate extension Const {
    static let apiKey = "apiURL"
    static let previewsKey = "previewsPath"
    static let quizKey = "quizPath"
}
