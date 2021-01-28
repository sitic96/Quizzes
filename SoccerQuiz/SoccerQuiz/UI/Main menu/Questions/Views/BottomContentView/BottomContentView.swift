//
//  BottomContentView.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/28/21.
//

import UIKit

typealias BottomContentTextStyle = (font: UIFont, textColor: UIColor)

enum BottomContentType {
    case options(style: BottomContentTextStyle)
    case dropBox
}

class BottomContentView: UIView {
    private lazy var stackView: UIStackView = {
        let topStackView = UIStackView()
        topStackView.axis = .horizontal
        topStackView.alignment = .fill
        topStackView.distribution = .fillEqually
        topStackView.tag = 0
        let bottomStackView = UIStackView()
        bottomStackView.axis = .horizontal
        bottomStackView.alignment = .fill
        bottomStackView.distribution = .fillEqually
        bottomStackView.tag = 1
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.addArrangedSubview(topStackView)
        mainStackView.addArrangedSubview(bottomStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    }()

    private func setupConstraints(for view: UIView) {
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

    func setup(type: BottomContentType, options: [Option]) {
        switch type {
        case .options(let style):
            addSubview(stackView)
            setupConstraints(for: stackView)
            for i in 0..<options.count {
                let label = UILabel()
                label.text = options[i].title
                label.font = style.font
                label.textColor = style.textColor
                label.textAlignment = .center
                if i < 2 {
                    (stackView.arrangedSubviews
                        .first(where: { $0.tag == 0 }) as? UIStackView)?.addArrangedSubview(label)
                } else if (i > 1 && i < 4) {
                    (stackView.arrangedSubviews
                        .first(where: { $0.tag == 1 }) as? UIStackView)?.addArrangedSubview(label)
                }
            }
        case .dropBox:
            break
        }
    }
}
