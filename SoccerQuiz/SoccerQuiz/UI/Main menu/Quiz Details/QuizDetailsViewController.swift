//
//  QuizDetailsViewController.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/25/21.
//

import UIKit

class QuizDetailsViewController: UIViewController {
    @IBOutlet private weak var quizDescriptionLabel: UILabel!
    @IBOutlet private weak var questionsCollectionView: UICollectionView!

    var viewModel: QuizDetailsViewModelProtocol!
    var router: QuizDetailsRouterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupStyle()
        setupContent()
    }

    private func bindViewModel() {
        viewModel.didSelectGoToQuestions = { [weak self] questions in
            self?.router.gotToQuestions(questions)
        }
    }

    private func setupStyle() {
        view.backgroundColor = StyleManager.QuizDetailsScreen.backgroundColor

        quizDescriptionLabel.font = StyleManager.General.Fonts.subHeaderFont
        quizDescriptionLabel.textColor = StyleManager.General.Colors.Text.mainColor
    }

    private func setupContent() {
        title = viewModel.quizTitle
        quizDescriptionLabel.text = viewModel.quizDescription
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension QuizDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.questions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuestionCollectionViewCell.identifier,
                                                            for: indexPath) as? QuestionCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupContent(title: "\(indexPath.item)")

        var borderColor = UIColor.clear
        switch viewModel.questions[indexPath.item].status {
        case .finished:
            borderColor = StyleManager.QuizDetailsScreen.answeredBorderColor
        case .notStarted:
            borderColor = StyleManager.QuizDetailsScreen.notStartedBorderColor
        case .started:
            borderColor = StyleManager.QuizDetailsScreen.notFinishedBorderColor
        }

        cell.setupStyle(borderWidth: Const.questionBorderWidth,
                        borderColor: borderColor,
                        titleLabelFont: StyleManager.General.Fonts.titleFont,
                        titleLabelTextColor: StyleManager.General.Colors.Text.mainColor)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacingWidth = (Const.questionsPerLine - 1) * Const.questionsCellOffset
        let width = (collectionView.frame.width - totalSpacingWidth) /
            Const.questionsPerLine
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Const.questionsCellOffset
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectQuestion(at: indexPath.item)
    }
}

fileprivate extension Const {
    static let questionBorderWidth: CGFloat = 5.0
    static let questionsCellOffset: CGFloat = 10.0
    static let questionsPerLine: CGFloat = 4
}
