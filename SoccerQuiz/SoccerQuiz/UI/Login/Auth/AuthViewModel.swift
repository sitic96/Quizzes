//
//  AuthViewModel.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/17/21.
//

import Foundation

protocol AuthViewModelProtocol {
    func didSelectNext(with name: String?)

    var didSetNewName: (() -> Void)? { get set }
}

class AuthViewModel {
    var didSetNewName: (() -> Void)?
}

extension AuthViewModel: AuthViewModelProtocol {
    func didSelectNext(with name: String?) {
        UserDefaults.standard.set(name, forKey: Const.UserDefaultsKeys.userNameKey)
        UserDefaults.standard.set(true, forKey: Const.UserDefaultsKeys.didLaunchBeforeKey)
        didSetNewName?()
    }
}
