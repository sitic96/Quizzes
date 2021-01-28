//
//  UIView+nibLoadable.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/28/21.
//

import UIKit

protocol NibLoadable: AnyObject {
    static var nibName: String { get }
}

extension NibLoadable where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }

    static func loadFromNib() -> Self {
        let nibViews = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)

        guard let targetView = nibViews?.first as? Self else {
            fatalError("Could not load nib with name: \(nibName)")
        }

        return targetView
    }
}

extension UIView: NibLoadable { }
