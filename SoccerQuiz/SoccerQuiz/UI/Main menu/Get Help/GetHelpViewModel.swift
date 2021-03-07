//
//  GetHelpViewModel.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/7/21.
//

import UIKit

enum SocialSharingChanel: CaseIterable {
    case stories
    case systemView
}

protocol GetHelpViewModelProtocol {
    var availableChanels: [SocialSharingChanel] { get }

    func didSelectHelpChanel(_ chanel: SocialSharingChanel)
}

class GetHelpViewModel {
    private func isChanelAvailable(for urlString: String) -> Bool {
        guard let chanelURL = URL(string: urlString),
              UIApplication.shared.canOpenURL(chanelURL) else {
            return false
        }
        return true
    }
}

extension GetHelpViewModel: GetHelpViewModelProtocol {
    var availableChanels: [SocialSharingChanel] {
        var options = [SocialSharingChanel]()

        SocialSharingChanel.allCases.forEach {
            switch $0 {
            case .stories:
                if isChanelAvailable(for: Const.storiesURLString) {
                    options.append(.stories)
                }
            case .systemView:
                options.append(.systemView)
            }
        }
        return options
    }

    func didSelectHelpChanel(_ chanel: SocialSharingChanel) {
        switch chanel {
        case .stories:
            guard let instagramURL = URL(string: Const.storiesURLString),
                  let imageData = #imageLiteral(resourceName: "logo_ball").jpegData(compressionQuality: 1.0),
                  isChanelAvailable(for: Const.storiesURLString) else {
                return
            }
            let items = [["com.instagram.sharedSticker.backgroundImage": imageData]]
            let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(60*5)]
            UIPasteboard.general.setItems(items, options: pasteboardOptions)
            UIApplication.shared.open(instagramURL, options: [:], completionHandler: nil)
        case .systemView:
            break
        }
    }
}

fileprivate extension Const {
    static let storiesURLString = "instagram-stories://share"
}
