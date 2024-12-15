//
//  ViewController.swift
//  UIImageResizeSample
//
//  Created by Kyusok.lee on 2024/12/14.
//

import UIKit

private enum Const {
    static let tokyoTowerImage = UIImage(named: "tokyoTower_sample")
    static let santaImage = UIImage(named: "santa")
    static let playButtonTitle = "再生する"
    static let santaButtonTitle = "サンタ！サンタ！"
    static let imageSize = CGSize(width: 150, height: 150)
    static let buttonImageSize = CGSize(width: 20, height: 20)
}

class ViewController: UIViewController {

    //
    private lazy var firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = Const.tokyoTowerImage
        return imageView
    }()


    private lazy var secondImageView: UIImageView = {
        let imageView = UIImageView()
        let renderer = UIGraphicsImageRenderer(size: Const.imageSize)
        let resizedImage = renderer.image { _ in
            Const.tokyoTowerImage?.draw(in: CGRect(origin: .zero, size: Const.imageSize))
        }

//         全く同じ比率にしたい場合
//        // 画像の比率
//        let aspectRatio = imageSize!.width / imageSize!.height
//        let targetRect: CGRect
//        if aspectRatio > 1 {
//            // 横長の場合
//            let newHeight = targetSize.width / aspectRatio
//            targetRect = CGRect(
//                x: 0,
//                y: (targetSize.height - newHeight) / 2,
//                width: targetSize.width,
//                height: newHeight
//            )
//        } else {
//            // 縦長または正方形の場合
//            let newWidth = targetSize.height * aspectRatio
//            targetRect = CGRect(
//                x: (targetSize.width - newWidth) / 2,
//                y: 0,
//                width: newWidth,
//                height: targetSize.height
//            )
//        }

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = resizedImage

        return imageView
    }()

    private lazy var thirdImageView: UIImageView = {
        let imageView = UIImageView()
        let resizedImage = Const.tokyoTowerImage?.preparingThumbnail(of: Const.imageSize)
        imageView.translatesAutoresizingMaskIntoConstraints = false
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

//        view.addSubview(firstImageView)
//        view.addSubview(secondImageView)
        view.addSubview(thirdImageView)
//        view.addSubview(playButton)
//        view.addSubview(santaButton)
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .secondarySystemBackground

        NSLayoutConstraint.activate([
//            // firstImageView の制約
//            firstImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//            firstImageView.heightAnchor.constraint(equalToConstant: 150),
//            firstImageView.widthAnchor.constraint(equalToConstant: 150),
//            firstImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            // secondImageView の制約
//            secondImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//            secondImageView.heightAnchor.constraint(equalToConstant: 150),
//            secondImageView.widthAnchor.constraint(equalToConstant: 150),
//            secondImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            // thirdImageView の制約
            thirdImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            thirdImageView.heightAnchor.constraint(equalToConstant: 150),
            thirdImageView.widthAnchor.constraint(equalToConstant: 150),
            thirdImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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

