//
//  ViewController.swift
//  UIImageResizeSample
//
//  Created by Kyusok.lee on 2024/12/14.
//

import UIKit

private enum Const {
    static let tokyoTowerImage = UIImage(named: "tokyoTower_sample")
    static let playButtonTitle = "再生する"
    static let santaButtonTitle = "サンタ！サンタ！"
    static let imageSize = CGSize(width: 20, height: 20)
}

class ViewController: UIViewController {

    //
    private lazy var firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Const.tokyoTowerImage
        return imageView
    }()


    private lazy var secondImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "tokyoTower_sample")
        let imageSize = CGSize(width: 20, height: 20)
        let renderer = UIGraphicsImageRenderer(size: imageSize)
        let resizedImage = renderer.image { _ in
            image?.draw(in: CGRect(origin: .zero, size: imageSize))
        }

        imageView.contentMode = .scaleAspectFit
        imageView.image = resizedImage

        return imageView
    }()

    /// SFSymbolsのイメージを使用した再生ボタン
    private lazy var playButton: UIButton = {
        let button = UIButton()

        // UIButton.Configurationに書き換えた際、元のimageをそのまま使用すると修正前の画像サイズと一致しないため、画像サイズの再調整を行う

        button.addAction(.init { [weak self] _ in
            guard let self else { return }
            self.playButtonTapped()
        }, for: .touchUpInside)
        return button
    }()

    /// Assetsに入れたサンタイメージを使用したボタン
    private lazy var santaButton: UIButton = {
        let button = UIButton()

        button.addAction(.init { [weak self] _ in
            guard let self else { return }
            self.santaButtonTapped()
        }, for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(firstImageView)
        view.addSubview(secondImageView)
//        view.addSubview(playButton)
//        view.addSubview(santaButton)
        setupUI()
    }

    private func setupUI() {

        NSLayoutConstraint.activate([
            // firstImageView の制約
            firstImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            firstImageView.heightAnchor.constraint(equalToConstant: 150),
            firstImageView.widthAnchor.constraint(equalToConstant: 150),
            firstImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // secondImageView の制約
            secondImageView.topAnchor.constraint(equalTo: firstImageView.bottomAnchor, constant: 20),
            secondImageView.heightAnchor.constraint(equalToConstant: 150),
            secondImageView.widthAnchor.constraint(equalToConstant: 150),
            secondImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//           // playButton
//            playButton.topAnchor.constraint(equalTo: secondImageView.bottomAnchor, constant: 20),
//            playButton.heightAnchor.constraint(equalToConstant: 50),
//            playButton.widthAnchor.constraint(equalToConstant: 150),
//            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//           // santaButton
//            santaButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 20),
//            santaButton.heightAnchor.constraint(equalToConstant: 50),
//            santaButton.widthAnchor.constraint(equalToConstant: 100),
//            santaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }



    private func playButtonTapped() {

    }

    private func santaButtonTapped() {

    }
}

