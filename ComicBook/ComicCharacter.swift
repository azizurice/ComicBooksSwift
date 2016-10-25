//
//  ComicCharacter.swift
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-22.
//  Copyright © 2016 letscodes. All rights reserved.
//

import Foundation


struct ComicCharacter {
    var title: String
    var detail: String
    var imageName: String
}

struct TIBApps {
    static func getAllApps() -> [ComicCharacter] {
        return [
            ComicCharacter(title: "Headsup Question Generator Game", detail: "beginner", imageName: "AlienHappy"),
            
            ComicCharacter(title: "Headsup Question Generator Game", detail: "beginner", imageName: "AlienNormal"),
            
            ComicCharacter(title: "Headsup Question Generator Game", detail: "beginner", imageName: "AlienToung")
            
            

            

            
        ]
    }
}
