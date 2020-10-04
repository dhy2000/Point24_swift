//
//  RationalNumber.swift
//  Point24
//
//  Created by Mr. Apple on 10/4/20.
//  Copyright © 2020 Mr. Apple. All rights reserved.
//

import Foundation

class RationalNumber {
    var p: Int = 0, q: Int = 1
    
    init() {
        p = 0
        q = 1
    }
    init(_ n: Int) {
        p = n
        q = 1
    }
    init(_ p: Int, _ q: Int) {
        self.p = p
        self.q = q
    }
    
    
    
}