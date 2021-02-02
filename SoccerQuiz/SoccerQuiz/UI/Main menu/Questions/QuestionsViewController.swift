//
//  QuestionsViewController.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/28/21.
//

import UIKit
import Koloda

class QuestionsViewController: UIViewController {
    @IBOutlet private weak var kolodaView: KolodaView!
    @IBOutlet private weak var optionsStackView: UIStackView!

    var viewModel: QuestionsViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
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
}
