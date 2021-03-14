//
//  NetworkManager.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/13/21.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case errorInLoading
}
protocol NetworkManagerProtocol {
    func getQuizesPreviews(completion: @escaping ((Result<[QuizPreview], Error>) -> Void))
    func loadQuiz(id: Int, completion: @escaping ((Result<LoadedQuiz, Error>) -> Void))
}

class NetworkManager {
    static let shared: NetworkManagerProtocol = NetworkManager()

    private init() { }
}

// MARK: - NetworkManagerProtocol

extension NetworkManager: NetworkManagerProtocol {
    func getQuizesPreviews(completion: @escaping ((Result<[QuizPreview], Error>) -> Void)) {
        AF.request(SecretKeys.shared.apiKey.appending(SecretKeys.shared.quizPreviewsAPIKey))
            .responseDecodable(of: [QuizPreview].self) { result in
                guard let previews = result.value else {
                    completion(.failure(NetworkError.errorInLoading))
                    return
                }
                completion(.success(previews))
            }
    }

    func loadQuiz(id: Int, completion: @escaping ((Result<LoadedQuiz, Error>) -> Void)) {
        AF.request(SecretKeys.shared.apiKey.appending(SecretKeys.shared.quizAPIKey))
            .responseDecodable(of: LoadedQuiz.self) { result in
                guard let quiz = result.value else {
                    completion(.failure(NetworkError.errorInLoading))
                    return
                }
                completion(.success(quiz))
            }
    }
}
