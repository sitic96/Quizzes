//
//  ColorRoundView.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 2/2/21.
//

import UIKit

typealias ColorRoundViewStyle = (borderColor: UIColor,
                                 borderWidth: CGFloat,
                                 fillColor: UIColor)

class ColorRoundView: UIView {
    private lazy var roundView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private func setupConstraints() {
        roundView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        roundView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        roundView.widthAnchor.constraint(equalTo: roundView.heightAnchor).isActive = true
        roundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1.0).isActive = true
    }

    private func setupStyle(_ style: ColorRoundViewStyle) {
        roundView.layer.borderWidth = style.borderWidth
        roundView.layer.borderColor = style.borderColor.cgColor
        roundView.backgroundColor = style.fillColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundView.layer.cornerRadius = roundView.frame.height / 2
    }

    func setUp(with style: ColorRoundViewStyle) {
        setupStyle(style)
        addSubview(roundView)
        setupConstraints()
    }

    func udpade(to newStyle: ColorRoundViewStyle) {
        setupStyle(newStyle)
    }
}
