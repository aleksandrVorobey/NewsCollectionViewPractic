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
    
    private var viewModels = [NewsCardViewModel]()

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
        self.collectionView.frame = self.view.bounds
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        self.output.viewDidLoad()
        self.navigationItem.title = Localization.main
	}
}

extension NewsViewController: NewsViewInput {
    func set(viewModels: [NewsCardViewModel]) {
        self.viewModels = viewModels
        self.collectionView.reloadData()
    }
        
}

extension NewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio: CGFloat = 1.3
        let width = collectionView.frame.width - collectionView.contentInset.left - collectionView.contentInset.right
        let height = width * ratio
        return CGSize(width: width, height: height)
    }
}

extension NewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = self.viewModels[indexPath.item]
        let cell = collectionView.dequeueCell(cellType: NewsViewCell<NewsCardView>.self, for: indexPath)
        //let viewModel = NewsCardViewModel(title: "cell\(indexPath.item)", imageName: "news1")
        cell.containerView.update(with: viewModel)
        return cell
    }
}

private extension NewsViewController {
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(NewsViewCell<NewsCardView>.self)
        self.collectionView.backgroundColor = .white
        self.collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}
