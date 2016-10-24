//
//  Constants.swift
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//

import Foundation

struct Constants {
    
struct Marvel {
    static let APIBaseURL1 = "https://gateway.marvel.com/v1/public/comics?ts=17&apikey=c30573ac063f8a33b1de98dffc550caf&hash=7f2feb587bc9e1e5353669b50619baaf&limit=2"
   
    static let APIBaseURL = "https://gateway.marvel.com/v1/public/comics"
    
    
}
    

struct MarvelParameterKeys {
        static let Method = "method"
        static let TS = "ts"
        static let APIKey = "apikey"
        static let HASH = "hash"
       }
    

// MARK: Marvel Parameter Keys
struct MarvelParameterValues {
    static let Method = "method"
    static let PUBLIC_KEY = "c30573ac063f8a33b1de98dffc550caf"
    static let PRIVATE_KEY = "6a8f9a8b05486f59c19998064421483ed2ec37f1"
    static let APIKey = "\(PUBLIC_KEY)"
    static let ts = "17"
   // static let ts = NSDate().timeIntervalSince1970.description
    static let Hash = "7f2feb587bc9e1e5353669b50619baaf"
    static let Limit = 100
}


// MARK: Marvel Response Keys
struct MarvelResponseKeys {
    static let Data = "data"
    static let Results = "results"
    static let Title = "title"
    static let Description = "description"
    static let Thumbnail = "thumbnail"
    static let Path = "path"
    static let Extension = "extension"
    //static let CharacterURL = Thumbnail +"/portrait_large"+Extension

}

// MARK: Marvel Response Values
struct MarvelResponseValues {
    static let OKStatus = "ok"
}
}
