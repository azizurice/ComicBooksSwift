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
            ComicCharacter(title: "Headsup Question Generator Game", detail: "beginner", imageName: "1"),
            
            ComicCharacter(title: "Headsup Question Generator Game", detail: "beginner", imageName: "2"),
            

            ComicCharacter(title: "Headsup Question Generator Game", detail: "beginner", imageName: "3"),
            

            ComicCharacter(title: "Headsup Question Generator Game", detail: "beginner", imageName: "4"),
            

            ComicCharacter(title: "Headsup Question Generator Game", detail: "beginner", imageName: "5"),
            

            ComicCharacter(title: "Headsup Question Generator Game", detail: "beginner", imageName: "6"),
            

            ComicCharacter(title: "Headsup Question Generator Game", detail: "beginner", imageName: "7"),
            

            ComicCharacter(title: "Headsup Question Generator Game", detail: "beginner", imageName: "8"),
            

            ComicCharacter(title: "Headsup Question Generator Game", detail: "beginner", imageName: "9"),
            

            ComicCharacter(title: "Headsup Question Generator Game", detail: "beginner", imageName: "10"),
            

            ComicCharacter(title: "Headsup Question Generator Game", detail: "beginner", imageName: "11")
            

            
        ]
    }
}
