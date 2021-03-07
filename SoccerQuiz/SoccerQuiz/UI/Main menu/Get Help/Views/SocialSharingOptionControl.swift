//
//  SocialSharingOptionControl.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 2/9/21.
//

import UIKit

typealias SocialSharingOptionStyle = (titleFont: UIFont, titleColor: UIColor)

class SocialSharingOptionControl: UIControl {
    private lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    var socialSharingChanel: SocialSharingChanel!

    private func setupConstraints() {
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true

        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10.0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10.0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)

    }

    func setUp(style: SocialSharingOptionStyle, chanel: SocialSharingChanel,
               title: String, image: UIImage) {
        titleLabel.font = style.titleFont
        titleLabel.textColor = style.titleColor
        titleLabel.text = title
        socialSharingChanel = chanel

        imageView.image = image

        addSubview(imageView)
        addSubview(titleLabel)
        setupConstraints()
    }
}
