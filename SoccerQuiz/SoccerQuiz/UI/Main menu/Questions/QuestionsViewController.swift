//
//  QuestionsViewController.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/28/21.
//

import UIKit
import Localize_Swift
import Koloda

protocol QuestionSelectedAnswerDelegate: AnyObject {
    func didSelectAnswer(at index: Int?)
}

class QuestionsViewController: UIViewController {
    @IBOutlet private weak var kolodaView: KolodaView!
    @IBOutlet private weak var questionsDotsStackView: UIStackView!
    @IBOutlet private weak var needHelpButton: UIButton!
    @IBOutlet private var dotsStackViewWidthConstraint: NSLayoutConstraint!

    var router: QuestionsRouterProtocol!
    var viewModel: QuestionsViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
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

    private func bindViewModel() {
        viewModel.didSelectAnswer = { [weak self] in

            // KolodaView skip swipping if isAnimationg is true
            // We must wait until animation is finished

            var didSwipe = false
            DispatchQueue.global(qos: .userInteractive).async {
                while !(self?.kolodaView.isAnimating ?? true) && !didSwipe {
                    didSwipe = true
                    DispatchQueue.main.async {
                        self?.kolodaView.swipe(.left, force: true)
                    }
                }
            }
        }

        viewModel.didChangeSelectedQuestion = { [weak self] updatedIndexes in
            DispatchQueue.main.async {
                self?.updateDotsView(updatedIndexes)
            }
        }
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
            setupDotView(dotView, for: viewModel.questionsWithStatus[i].status,
                         isCurrent: i == viewModel.currentQuestionIndex)
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

    private func updateDotsView(_ updatedIndexes: [Int]) {
        updatedIndexes.forEach { index in
            guard let updatedDotView = questionsDotsStackView.arrangedSubviews
                    .first(where: { $0.tag == index }) as? ColorRoundView,
                  index < viewModel.questionsWithStatus.count else {
                return
            }
            setupDotView(updatedDotView, for: viewModel.questionsWithStatus[index].status,
                         isCurrent: index == viewModel.currentQuestionIndex)
        }
    }

    private func setupDotView(_ view: ColorRoundView, for status: QuizQuestionStatus, isCurrent: Bool) {
        if isCurrent {
            view.setUp(with: ColorRoundViewStyle(borderColor: StyleManager.General.Colors.grey,
                                                 borderWidth: 1.0,
                                                 fillColor: StyleManager.General.Colors.grey))
        } else {
            switch status {
            case .finished:
                view.setUp(with: ColorRoundViewStyle(borderColor: StyleManager.General.Colors.grey,
                                                     borderWidth: 1.0,
                                                     fillColor: StyleManager.QuestionsScreen.finishedQuestionColor))
            case .notStarted:
                view.setUp(with: ColorRoundViewStyle(borderColor: StyleManager.General.Colors.grey,
                                                     borderWidth: 1.0,
                                                     fillColor: StyleManager.General.Colors.white))
            case .started:
                view.setUp(with: ColorRoundViewStyle(borderColor: StyleManager.General.Colors.grey,
                                                     borderWidth: 1.0,
                                                     fillColor: StyleManager.QuestionsScreen.startedQuestionColor))
            }
        }
    }

    @IBAction private func didSelectGetHelp(_ sender: Any) {
        router.showGetHelpScreen(for: viewModel.currentQuestion)
    }
}

// MARK: KolodaViewDelegate, KolodaViewDataSource

extension QuestionsViewController: KolodaViewDelegate, KolodaViewDataSource {
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        viewModel.questions.count
    }

    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let questionView = QuestionKolodaView.loadFromNib()
        questionView.delegate = self
        questionView.setup(for: viewModel.questions[index])
        questionView.layer.masksToBounds = true
        questionView.layer.cornerRadius = Const.questionViewCornerRadius
        return questionView
    }

    func koloda(_ koloda: KolodaView,
                allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        [SwipeResultDirection.left, SwipeResultDirection.right]
    }

    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        router.close()
    }

    func koloda(_ koloda: KolodaView, didShowCardAt index: Int) {
        guard let kolodaView = koloda.viewForCard(at: index) as? QuestionKolodaView else {
            return
        }
        kolodaView.removeOverlayView()
    }

    func koloda(_ koloda: KolodaView,
                didSwipeCardAt index: Int,
                in direction: SwipeResultDirection) {
        viewModel.didSwipe(from: index)
    }
}

// MARK: QuestionSelectedAnswerDelegate

extension QuestionsViewController: QuestionSelectedAnswerDelegate {
    func didSelectAnswer(at index: Int?) {
        guard let index = index else { return }
        viewModel.didSelectAnswer(at: index)
    }
}

fileprivate extension Const {
    static let questionViewCornerRadius: CGFloat = 10.0
    static let kolodaTopMargin: CGFloat = 15.0
    static let backgroundScalePercent: CGFloat = 0.8
    static let dotStackViewSpacing: CGFloat = 17.0
    static let needHelpButtonCornerRadius: CGFloat = 5.0
}
