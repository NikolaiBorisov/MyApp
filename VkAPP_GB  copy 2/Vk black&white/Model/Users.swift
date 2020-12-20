//
//  Users.swift
//  Vk black&white
//
//  Created by Macbook on 11.12.2020.
//

import UIKit

struct User {
    var name: String
    var avatar: UIImage?
    var photos: [UIImage?]
}

final class FriendsFactory {
    static func makeFriends() -> [User] {
        
        let neo = User(name: "Mr. Anderson", avatar: UIImage(named: "Neo"), photos:
                        [UIImage(named: "Neo2"),
                        UIImage(named: "Neo3"),
                        UIImage(named: "Neo4")])
        
        let trinity = User(name: "Trinity", avatar: UIImage(named: "Trinity"), photos:
                        [UIImage(named: "Trinity2-1"),
                        UIImage(named: "Trinity3"),
                        UIImage(named: "Trinity4")])
        
        let morpheus = User(name: "Morpheus", avatar: UIImage(named: "Morpheus"), photos:
                        [UIImage(named: "Mor2"),
                        UIImage(named: "Mor3"),
                        UIImage(named: "Mor4")])
        
        let agent = User(name: "Agent Smith", avatar: UIImage(named: "AgentSmith"), photos:
                        [UIImage(named: "Ag2"),
                        UIImage(named: "Ag3"),
                        UIImage(named: "Ag4")])
        
        let neoba = User(name: "Neoba", avatar: UIImage(named: "Neoba2-1"), photos:
                        [UIImage(named: "Neoba2"),
                        UIImage(named: "Neoba3"),
                        UIImage(named: "Neoba4")])
        
        return [neo, trinity, morpheus, agent, neoba]
    }
}
    
