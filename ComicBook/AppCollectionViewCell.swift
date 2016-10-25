//
//  AppCollectionViewCell.swift
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-22.
//  Copyright © 2016 letscodes. All rights reserved.
//

import UIKit

class AppCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var appImageView: UIImageView!
    
    @IBOutlet weak var appLabelView: UILabel!
    
    
    var app : Character! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        appImageView.image = app.thumbnail
        appLabelView.text = app.title
        
        appLabelView.layer.shadowColor = UIColor.black.cgColor
        appLabelView.layer.shadowOffset = CGSize(width: 0, height: 0)
        appLabelView.layer.shadowRadius = 6
        appLabelView.layer.shadowOpacity = 1
    }
    
    
}
