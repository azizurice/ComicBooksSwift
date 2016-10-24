//
//  MD5Swift.swift
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//

import Foundation

//extension String {
//    func md5() -> String! {
//        let str = self.cString(using: String.Encoding.utf8)
//        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
//        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
//        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
//        
//        CC_MD5(str!, strLen, result)
//        
//        var hash = NSMutableString()
//        for i in 0..<digestLen {
//            hash.appendFormat("%02x", result[i])
//        }
//        
//        result.destroy()
//        
//        return String(format: hash as String)
//    }
//}
