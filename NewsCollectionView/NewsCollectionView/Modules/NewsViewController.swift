//
//  NewsViewController.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 20.05.2021.
//  
//

import UIKit

final class NewsViewController: UIViewController {
	private let output: NewsViewOutput
    private let collectionView: UICollectionView

    init(output: NewsViewOutput) {
        self.output = output
        let collectionViewLayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        view.addSubview(self.collectionView)
        setupCollectionView()
        self.view = view
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.frame = self.view.frame
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        self.view.backgroundColor = .green
	}
}

extension NewsViewController: NewsViewInput {
    
}

extension NewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio: CGFloat = 1.3
        let width = collectionView.frame.width
        let height = width * ratio
        return CGSize(width: width, height: height)
    }
}

extension NewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(cellType: UICollectionViewCell.self, for: indexPath)
        cell.backgroundColor = .brown
        return cell
    }
}

private extension NewsViewController {
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UICollectionViewCell.self)
        self.collectionView.backgroundColor = .white
    }
}
