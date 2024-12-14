//
//  ViewController.swift
//  UIImageResizeSample
//
//  Created by Kyusok.lee on 2024/12/14.
//

import UIKit

class ViewController: UIViewController {

    private lazy var firstImageView: UIImageView = {
        let imageView = UIImageView()

        return imageView
    }()

    private lazy var secondImageView: UIImageView = {
        let imageView = UIImageView()

        return imageView
    }()

    private lazy var firstButton: UIButton = {
        let button = UIButton()

        button.addAction(.init { [weak self] _ in
            guard let self else { return }
            self.firstButtonTapped()
        }, for: .touchUpInside)
        return button
    }()

    private lazy var secondButton: UIButton = {
        let button = UIButton()

        button.addAction(.init { [weak self] _ in
            guard let self else { return }
            self.secondButtonTapped()
        }, for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(firstImageView)
//        view.addSubview(secondImageView)
//        view.addSubview(firstButton)
//        view.addSubview(secondButton)
        setupUI()
    }

    private func setupUI() {

    }



    private func firstButtonTapped() {

    }

    private func secondButtonTapped() {

    }
}

