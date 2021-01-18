//
//  WelcomeBackViewModel.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation

protocol WelcomeBackViewModelProtocol {
    var welcomeMessageLocalizeKey: String { get }
    var userName: String { get }
}

class WelcomeBackViewModel {
    var welcomeMessageLocalizeKey: String

    init(welcomeMessageKey: String) {
        self.welcomeMessageLocalizeKey = welcomeMessageKey
    }
}

extension WelcomeBackViewModel: WelcomeBackViewModelProtocol {
    var userName: String {
        UserDefaults.standard.string(forKey: Const.UserDefaultsKeys.userNameKey) ?? ""
    }
}
