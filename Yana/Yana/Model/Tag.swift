//
//  Tag.swift
//  Yana
//
//  Created by Pedro Sousa on 05/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import Foundation

public class Tag {
    var tagId: Int
    var name: String
    var imagePath: String

    init(tagId: Int, name: String, imagePath: String) {
        self.tagId = tagId
        self.name = name
        self.imagePath = imagePath
    }

    public static func getTag(tagId: Int) -> Tag {
        return Tag.mock[tagId]
    }

    public static func getAllTags() -> [Tag] {
        return Tag.mock
    }

    private static var mock: [Tag] = [
        Tag.init(tagId: 0, name: "Tag 1", imagePath: ""),
        Tag.init(tagId: 1, name: "Tag 2", imagePath: ""),
        Tag.init(tagId: 2, name: "Tag 3", imagePath: "")
    ]
}
