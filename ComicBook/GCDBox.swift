//
//  GCDBox.swift
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(updates: () -> Void) {

    DispatchQueue.main.async {
       // updates()
    }
}
