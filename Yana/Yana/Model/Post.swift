//
//  Post.swift
//  Yana
//
//  Created by Pedro Sousa on 05/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import Foundation

public class Post {
    var postId: Int
    var tagId: Int
    var userId: Int
    var title: String
    var content: String

    init(postId: Int, tagId: Int, userId: Int, title: String, content: String) {
        self.postId = postId
        self.tagId = tagId
        self.userId = userId
        self.title = title
        self.content = content
    }

    public static func getPost(postId: Int) -> Post {
        return Post.mock[postId]
    }

    public static func getPost(tag: Int) -> [Post] {
        var res: [Post] = []
        for post in Post.mock where post.tagId == tag {
            res.append(post)
        }
        return res
    }

    public static func getPost(user: Int) -> [Post] {
        var res: [Post] = []
        for post in Post.mock where post.userId == user {
            res.append(post)
        }
        return res
    }

    public static func getAllPosts() -> [Post] {
        return Post.mock
    }

    private static var mock: [Post] = [
        Post.init(postId: 0, tagId: 0, userId: 0, title: "Tag 1 - Post 1", content: "Post content."),
        Post.init(postId: 1, tagId: 0, userId: 1, title: "Tag 1 - Post 2", content: "Post content."),
        Post.init(postId: 2, tagId: 0, userId: 2, title: "Tag 1 - Post 3", content: "Post content."),
        Post.init(postId: 3, tagId: 1, userId: 2, title: "Tag 2 - Post 1", content: "Post content."),
        Post.init(postId: 4, tagId: 1, userId: 2, title: "Tag 2 - Post 2", content: "Post content."),
        Post.init(postId: 5, tagId: 1, userId: 0, title: "Tag 2 - Post 3", content: "Post content."),
        Post.init(postId: 6, tagId: 2, userId: 1, title: "Tag 3 - Post 1", content: "Post content."),
        Post.init(postId: 7, tagId: 2, userId: 1, title: "Tag 3 - Post 2", content: "Post content."),
        Post.init(postId: 8, tagId: 2, userId: 0, title: "Tag 3 - Post 3", content: "Post content.")
    ]
}
