//
//  UIViewController+navigationTitleColor.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 2/2/21.
//

import UIKit

typealias NavigationTitleStyle = (foregroundColor: UIColor, font: UIFont,
                                  tintColor: UIColor)
extension UIViewController {
    func setupNavigationTileStyle(_ style: NavigationTitleStyle) {
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: style.foregroundColor,
             NSAttributedString.Key.font: style.font]
        navigationController?.navigationBar.tintColor = style.tintColor
    }
}
