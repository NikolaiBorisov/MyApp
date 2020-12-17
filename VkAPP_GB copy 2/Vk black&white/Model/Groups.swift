//
//  Groups.swift
//  Vk black&white
//
//  Created by Macbook on 11.12.2020.
//

import UIKit

struct Group {
    var name: String
    var avatar: UIImage?
    var countOfPeople: Int = 100
    
    init(name: String, avatar: String) {
        self.name = name
        self.avatar = UIImage(named: avatar)
    }
}

extension Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        lhs.name == rhs.name && lhs.avatar == rhs.avatar
    }
}
