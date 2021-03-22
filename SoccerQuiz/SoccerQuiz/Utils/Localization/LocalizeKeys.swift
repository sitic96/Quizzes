//
//  LocalizeKeys.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/17/21.
//

import Foundation

struct LocalizeKeys {
    static let appTitle = "appTitle"

    struct Auth {
        static let welcomeMessage = "welcomeMessage"
        static let namePlaceholder = "namePlaceholder"
        static let next = "next"
        static let welcomeBackMessage = "welcomeBackMessage"
        static let firstWelcomeMessage = "firstWelcomeMessage"
    }

    struct Loading {
        static let errorAlertTitle = "loadingErrorAlertTitle"
        static let errorAlertMessage = "loadingErrorAlertMessage"
        static let alertTryAgainTitle = "loadingAlertTryAgainTitle"
    }

    struct Main {
        struct Quizes {
            static let selectThemeTitle = "selectThemeTitle"
        }

        struct Questions {
            static let needHelpButtonTitle = "needHelpButtonTitle"
        }

        struct GetHelp {
            static let askFriendsTitle = "askFriendsTitle"
            static let orTitle = "orTitle"
            static let otherOptionsTitle = "otherOptionsTitle"
            static let storiesTitle = "storiesTtile"
            static let whatsappTitle = "whatsappTitle"
        }

        struct QuizPreview {
            static let buyQuizTitle = "buyQuizTitle"
            static let playQuizTitle = "playQuizTitle"
        }
    }
}
