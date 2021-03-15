//
//  UIViewController+presentAlert.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/15/21.
//

import UIKit

struct AlertAction {
    let title: String
    let style: UIAlertAction.Style
    let handler: ((UIAlertAction) -> Void)?
}

extension UIViewController {
    func presentAlert(with message: String, title: String, actions: [AlertAction]) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        actions.forEach {
            alert.addAction(UIAlertAction(title: $0.title,
                                          style: $0.style,
                                          handler: $0.handler))
        }
        self.present(alert, animated: true, completion: nil)
    }
}
