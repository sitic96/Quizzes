//
//  TopContentView.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/28/21.
//

import UIKit
import Kingfisher

typealias TopContentTextStyle = (font: UIFont, textColor: UIColor)

enum TopContentType {
    case text(style: TopContentTextStyle, text: String)
    case image(imageURLString: String)
}

class TopContentView: UIView {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private func setupConstraints(for view: UIView) {
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor,
                                      constant: Const.contentOffset).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor,
                                       constant: -Const.contentOffset).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func setup(for type: TopContentType) {
        backgroundColor = .clear
        switch type {
        case .text(let style, let text):
            label.font = style.font
            label.textColor = style.textColor
            label.text = text
            addSubview(label)
            setupConstraints(for: label)
        case .image(let imageURL):
            addSubview(imageView)
            setupConstraints(for: imageView)
            imageView.kf.setImage(with: URL(string: imageURL))
        }
    }
}

fileprivate extension Const {
    static let contentOffset: CGFloat = 20.0
}
