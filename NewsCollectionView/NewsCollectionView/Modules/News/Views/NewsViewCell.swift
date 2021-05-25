//
//  NewsViewCell.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 20.05.2021.
//

import UIKit

class NewsViewCell<T: UIView>: UICollectionViewCell {
    
    let containerView: T
   
    override init(frame: CGRect) {
        self.containerView = T(frame: .zero)
        super.init(frame: frame)
        self.contentView.addSubview(self.containerView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.frame = self.contentView.frame
    }
    
}
