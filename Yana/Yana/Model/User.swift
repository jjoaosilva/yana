//
//  User.swift
//  Yana
//
//  Created by Pedro Sousa on 05/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import Foundation

public class User {
    let userId: Int
    let name: String
    let tags: [Int]

    init(userId: Int, name: String, tags: [Int]) {
        self.userId = userId
        self.name = name
        self.tags = tags
    }

    public static func getUser(userId: Int) -> User {
        return User.mock[userId]
    }

    public static func getAllUsers() -> [User] {
        return User.mock
    }

    private static var mock: [User] = [
        User.init(userId: 0, name: "João", tags: [1, 2]),
        User.init(userId: 1, name: "Anderson", tags: [2]),
        User.init(userId: 2, name: "Ronaldo", tags: [2, 3])
    ]
}
