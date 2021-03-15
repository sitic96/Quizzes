//
//  LoadingViewModel.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/15/21.
//

import Foundation

protocol LoadingViewModelProtocol {
    var didFinishLoading: ((Result<[QuizPreview], Error>) -> Void)? { get set }

    func loadPreviews()
}

class LoadingViewModel {
    private let networkManager: NetworkManagerProtocol
    var didFinishLoading: ((Result<[QuizPreview], Error>) -> Void)?

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

extension LoadingViewModel: LoadingViewModelProtocol {
    func loadPreviews() {
        guard let didFinishLoading = didFinishLoading else {
            return
        }
        networkManager.getQuizesPreviews(completion: didFinishLoading)
    }
}
