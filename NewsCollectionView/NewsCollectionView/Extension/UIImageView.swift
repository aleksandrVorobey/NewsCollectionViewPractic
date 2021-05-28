//
//  UIImageView.swift
//  NewsCollectionView
//
//  Created by Александр Воробей on 28.05.2021.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with url: URL?) {
        self.kf.setImage(with: url)
    }
}
