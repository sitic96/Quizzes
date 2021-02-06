//
//  QuestionsViewController.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/28/21.
//

import UIKit
import Localize_Swift
import Koloda

class QuestionsViewController: UIViewController {
    @IBOutlet private weak var kolodaView: KolodaView!
    @IBOutlet private weak var questionsDotsStackView: UIStackView!
    @IBOutlet private weak var needHelpButton: UIButton!
    @IBOutlet private var dotsStackViewWidthConstraint: NSLayoutConstraint!

    var viewModel: QuestionsViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        setupContent()
        setupDotsView()
        title = viewModel.quizName
        
        kolodaView.delegate = self
        kolodaView.dataSource = self
        kolodaView.backgroundCardsScalePercent = Const.backgroundScalePercent
        kolodaView.backgroundCardsTopMargin = Const.kolodaTopMargin
        kolodaView.visibleCardsDirection = .top
        kolodaView.alphaValueSemiTransparent = 0.4
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationTileStyle(NavigationTitleStyle(foregroundColor: StyleManager.General.Colors.black,
                                                      font: StyleManager.General.Fonts.subtitleFont,
                                                      tintColor: StyleManager.General.Colors.mainColor))
    }

    private func setupStyle() {
        view.backgroundColor = StyleManager.QuestionsScreen.backgroundColor
        needHelpButton.backgroundColor = StyleManager.QuestionsScreen.helpButtonBackgroundColor
        needHelpButton.titleLabel?.font = StyleManager.General.Fonts.subtitleFont
        needHelpButton.setTitleColor(StyleManager.General.Colors.white,
                                     for: .normal)
        needHelpButton.layer.cornerRadius = Const.needHelpButtonCornerRadius
    }

    private func setupContent() {
        needHelpButton
            .setTitle(LocalizeKeys.Main.Questions.needHelpButtonTitle.localized(),
                      for: .normal)
    }

    private func setupDotsView() {
        for i in 0..<viewModel.questionsWithStatus.count {
            let dotView = ColorRoundView()
            switch viewModel.questionsWithStatus[i].status {
            case .finished:
                dotView.setUp(with: ColorRoundViewStyle(borderColor: StyleManager.General.Colors.grey,
                                                        borderWidth: 1.0,
                                                        fillColor: StyleManager.QuestionsScreen.finishedQuestionColor))
            case .notStarted:
                dotView.setUp(with: ColorRoundViewStyle(borderColor: StyleManager.General.Colors.grey,
                                                        borderWidth: 1.0,
                                                        fillColor: StyleManager.General.Colors.grey))
            case .started:
                dotView.setUp(with: ColorRoundViewStyle(borderColor: StyleManager.General.Colors.grey,
                                                        borderWidth: 1.0,
                                                        fillColor: StyleManager.QuestionsScreen.startedQuestionColor))
            }
            dotView.tag = i
            dotView.translatesAutoresizingMaskIntoConstraints = false
            questionsDotsStackView.addArrangedSubview(dotView)
            dotView.heightAnchor.constraint(equalTo: questionsDotsStackView.heightAnchor).isActive = true
        }
        questionsDotsStackView.spacing = Const.dotStackViewSpacing
        dotsStackViewWidthConstraint.constant = CGFloat(viewModel.questions.count) *
            questionsDotsStackView.frame.height +
            ((CGFloat(viewModel.questions.count) - 1) * Const.dotStackViewSpacing)
    }
}

// MARK: KolodaViewDelegate, KolodaViewDataSource

extension QuestionsViewController: KolodaViewDelegate, KolodaViewDataSource {
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        viewModel.questions.count
    }

    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let questionView = QuestionKolodaView.loadFromNib()
        questionView.setup(for: viewModel.questions[index])
        questionView.layer.masksToBounds = true
        questionView.layer.cornerRadius = Const.questionViewCornerRadius
        return questionView
    }

    func koloda(_ koloda: KolodaView,
                allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        []
    }

    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        dismiss(animated: true, completion: nil)
    }

    func koloda(_ koloda: KolodaView, didShowCardAt index: Int) {
        guard let kolodaView = koloda.viewForCard(at: index) as? QuestionKolodaView else {
            return
        }
        kolodaView.removeOverlayView()
    }
}

fileprivate extension Const {
    static let questionViewCornerRadius: CGFloat = 10.0
    static let kolodaTopMargin: CGFloat = 15.0
    static let backgroundScalePercent: CGFloat = 0.8
    static let dotStackViewSpacing: CGFloat = 17.0
    static let needHelpButtonCornerRadius: CGFloat = 5.0
}
