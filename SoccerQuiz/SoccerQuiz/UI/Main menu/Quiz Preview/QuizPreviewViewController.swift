//
//  QuizPreviewViewController.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/21/21.
//

import UIKit
import Kingfisher

class QuizPreviewViewController: UIViewController {
    @IBOutlet private weak var quizImageView: UIImageView!
    @IBOutlet private weak var quizTitle: UILabel!
    @IBOutlet private weak var quizDescription: UILabel!
    @IBOutlet private weak var buyButton: UIButton!

    var viewModel: QuizPreviewViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        quizImageView.kf.setImage(with: URL(string: viewModel.quizPreview.imageURLString))
        quizTitle.text = viewModel.quizPreview.title
        quizDescription.text = viewModel.quizPreview.description
    }

    private func setupStyle() {
        
    }
}
