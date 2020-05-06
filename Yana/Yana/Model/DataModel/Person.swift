//
//  Person.swift
//  Yana
//
//  Created by Anderson Alencar on 04/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit
import Foundation

struct Person: Codable {
    let personID: Int
    var userName: String
    var email: String
    //var password: String  pensar se isso é nescessário para outros usuários ou só para o logado
    var imageNameProfile: String
    var postID: [Int]
}
