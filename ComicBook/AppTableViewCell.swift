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
    
        
        var app : Character! {
            didSet {
                self.updateUI()
            }
        }
        
        func updateUI() {
            downloadImage(urlString: app.characterURL!)
            
             appImageView.layer.borderColor = UIColor.red.cgColor
           
            appLabelView.text = app.title
            
            appLabelView.layer.shadowColor = UIColor.black.cgColor
            appLabelView.layer.shadowOffset = CGSize(width: 0, height: 0)
            appLabelView.layer.shadowRadius = 6
            appLabelView.layer.shadowOpacity = 1
        }
    

    
    
    private func downloadImage(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.appImageView.image = image
                self.app.thumbnail =  image
               
            })
            
        }).resume()
    }
    

    

}
