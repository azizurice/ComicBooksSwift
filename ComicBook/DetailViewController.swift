//
//  DetailViewController.swift
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-22.
//  Copyright © 2016 letscodes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var detailLabelView: UILabel!
    var image : UIImage!
    var imageTitle: String?
    var imageDetail: String?
    //var index : Int?
    var app : ComicCharacter!
    
   // var comicCharacter: ComicCharacter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  let app = apps[index!]
        
        
      //  if let comicCharacter = ComicCharacter {
            
        //    navigationItem.title = comicCharacter.title?.capitalized
          //  imageView.image = UIImage(named: comicCharacter. .name!.lowercased())
           //   navigationItem.title = imageTitle?.capitalized
  
     //   navigationItem.title = app.title
         //navigationItem.title = app?.title.capitalized
             //
        imageView.image = UIImage(named: app.imageName)
  
        
              detailLabelView.text = app.detail
              
        
              //  UIImage(named: image)
       // }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
