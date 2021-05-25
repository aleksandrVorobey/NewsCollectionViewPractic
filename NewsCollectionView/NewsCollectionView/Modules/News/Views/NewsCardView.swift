//
//  NewsCardView.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 20.05.2021.
//

import UIKit

class NewsCardView: UIView {
    
    private let titleLabel = UILabel()
    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.imageView)
        self.addSubview(self.titleLabel)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel.frame.origin = CGPoint(x: 1, y: 16)
        self.titleLabel.sizeToFit()
        self.imageView.frame = self.frame
    }
    
    func update(with viewModel: NewsCardViewModel) {
        self.titleLabel.text = viewModel.title
        self.imageView.image = UIImage(named: viewModel.imageName)
        self.setNeedsLayout()
    }
    
}
