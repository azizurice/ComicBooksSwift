//
//  DataSource.swift
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//

import Foundation
class DataSource {
    
    static var characters : [Character] = []
    
    init(){
    }
    
    
    static func getAllCharacters() -> [Character] {
        return characters
        
    }
    
}
