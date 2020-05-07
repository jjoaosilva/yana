//
//  PostPackage.swift
//  Yana
//
//  Created by Anderson Alencar on 05/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import Foundation

struct PostPackage {
    let postID: Int
    var personID: Int
    var communityID: Int
    var title: String
    var description: String
    var useful: Int
    var status: Bool
    var comments: [Comment]
    let authorName: String
    let authorImageName: String
}
