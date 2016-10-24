//
//  Character.swift
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//

import Foundation
import UIKit

struct Character{

    var title : String?
    var detail : String?
    var characterURL : String?
    var thumbnail: UIImage?
   
    
    init(){
    }
    
    init(title : String?, detail : String?, characterURL : String?){
        self.title = title
        self.detail = detail
        self.characterURL = characterURL
        self.thumbnail = nil
        
    }
    
}
