//
//  Community.swift
//  Yana
//
//  Created by Anderson Alencar on 04/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//
import UIKit
import Foundation

struct Community: Codable {
    let communityID: Int
    var communityName: String
    var numberFollowers: Int
    var imageNameBackground: String
}
