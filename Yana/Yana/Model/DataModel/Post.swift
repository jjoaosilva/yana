//
//  Post.swift
//  Yana
//
//  Created by Anderson Alencar on 04/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import Foundation

struct Post: Codable {
    let postID: Int
    var personID: Int
    var communityID: Int
    var title: String
    var description: String
    var useful: Int
    var status: Bool
    var comments: [Comment]
}
