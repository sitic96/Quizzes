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
        
        kolodaView.delegate = self
        kolodaView.dataSource = self
        kolodaView.backgroundCardsScalePercent = 0.8
        kolodaView.visibleCardsDirection = .top
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
        return questionView
    }

    func koloda(_ koloda: KolodaView,
                allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        []
    }

    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {

    }

    func koloda(_ koloda: KolodaView, didShowCardAt index: Int) {
        guard let kolodaView = koloda.viewForCard(at: index) as? QuestionKolodaView else {
            return
        }

    }
}
