//
//  MenuViewController.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 04.11.2022.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    
//    private let gameCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        return collectionView
//    }()
    
    private var playButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        //setUpCollection()
        
       // gameCollectionView.delegate = self
       // gameCollectionView.dataSource = self
        
        setUpButton()
    }
        
    private func setUpCollection() {
        
//        view.addSubview(gameCollectionView)
//        gameCollectionView.backgroundColor = .systemBackground
//
//        gameCollectionView.snp.makeConstraints { make in
//            make.top.leading.equalToSuperview().offset(20)
//            make.bottom.trailing.equalToSuperview().offset(-20)
//        }
    }
    
    private func setUpButton() {
        
        view.addSubview(playButton)
        
        playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
        playButton.imageView?.tintColor = .systemGreen

        playButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        playButton.imageView?.snp.makeConstraints({ make in
            make.height.width.equalTo(100)
        })
        
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
    }
    
    
    @objc private func playButtonTapped() {
        navigationController?.pushViewController(GameViewController(), animated: true)
    }
}



//extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = gameCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = .purple
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let size = collectionView.frame.width * 0.45
//        return CGSize(width: size, height: size)
//    }
//}
