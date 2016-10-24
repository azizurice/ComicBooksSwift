//
//  AppTableViewCell.swift
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-22.
//  Copyright © 2016 letscodes. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {

    
    @IBOutlet weak var appLabelView: UILabel!
    @IBOutlet weak var appImageView: UIImageView!
    
        
        var app : ComicCharacter! {
            didSet {
                self.updateUI()
            }
        }
        
        func updateUI() {
            appImageView.image = UIImage(named: app.imageName)
            appLabelView.text = app.title
            
            appLabelView.layer.shadowColor = UIColor.black.cgColor
            appLabelView.layer.shadowOffset = CGSize(width: 0, height: 0)
            appLabelView.layer.shadowRadius = 6
            appLabelView.layer.shadowOpacity = 1
        }
        
    
    

}
