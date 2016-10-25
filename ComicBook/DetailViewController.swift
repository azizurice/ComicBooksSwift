//
//  DetailViewController.swift
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-22.
//  Copyright © 2016 letscodes. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {
  
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var captionView: UILabel!
   
    
    @IBOutlet weak var detailLabelView: UILabel!
    
   
    var app : Character!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
         imageView.image = app.thumbnail
         captionView.text = app.title
         detailLabelView.text = app.detail
        detailLabelView.adjustsFontSizeToFitWidth = true
              
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
