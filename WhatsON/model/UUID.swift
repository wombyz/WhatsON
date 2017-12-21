//
//  UUID.swift
//  WhatsON
//
//  Created by Liam Ottley on 21/12/17.
//  Copyright © 2017 Liam Ottley. All rights reserved.
//

import Foundation

class MyClass: Hashable {

    
    static var nextUid = 1
    static func generateUid() -> Int {
        return nextUid++
    }
    
    let uid: Int
    var myName: String
    var myAge:Int
    var hashValue: Int {
        return self.uid
    }
    init(name: String, age: Int) {
        self.uid = MyClass.generateUid()
        self.myName = name
        self.myAge = age
    }
}
