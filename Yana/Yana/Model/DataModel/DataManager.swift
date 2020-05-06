//
//  DataManager.swift
//  Yana
//
//  Created by Anderson Alencar on 05/05/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import Foundation

class DataManager {

    // Retorna o conjunto de todas as comunidades existentes
    func getCommunities() -> [Community] {
        let fileUrl = Bundle.main.url(forResource: "Community", withExtension: "json")!
        let jsonData = try? Data(contentsOf: fileUrl)
        var communities = [Community]()
        do {
            communities = try JSONDecoder().decode([Community].self, from: jsonData!)
        } catch {
            print(error.localizedDescription)
        }
        return communities
    }

    // Retorna Todos os usuários existentes
    func getUsers() -> [Person] {
        let fileUrl = Bundle.main.url(forResource: "Users", withExtension: "json")!
        let jsonData = try? Data(contentsOf: fileUrl)
        var users = [Person]()
        do {
            users = try JSONDecoder().decode([Person].self, from: jsonData!)
        } catch {
            print(error.localizedDescription)
        }
        return users
    }

    // Retorna os últimos 3 posts na comunidade no formato Postpackage
    func getLastActivitiesCommunity(identifier: Int) -> [PostPackage] {
        let fileUrl = Bundle.main.url(forResource: "Posts", withExtension: "json")!
        let jsonData = try? Data(contentsOf: fileUrl)
        var posts = [Post]()
        do {
            posts = try JSONDecoder().decode([Post].self, from: jsonData!)
        } catch {
            print(error.localizedDescription)
        }
        posts = posts.filter({ (post) -> Bool in
            post.communityID == identifier
        })

        while posts.count > 3 {
            posts.removeLast()
        }

        let users = getUsers()

        let package = mountUserPackage(users: users, posts: posts)

        return package
    }

    // Retorna todos os posts na comunidade no formato Postpackage
    func getAllActivitiesCommunity(identifier: Int) -> [PostPackage] {
        let fileUrl = Bundle.main.url(forResource: "Posts", withExtension: "json")!
        let jsonData = try? Data(contentsOf: fileUrl)
        var posts = [Post]()
        do {
            posts = try JSONDecoder().decode([Post].self, from: jsonData!)
        } catch {
            print(error.localizedDescription)
        }

        posts = posts.filter({ (post) -> Bool in
            post.communityID == identifier
        })

        let users = getUsers()

        let package = mountUserPackage(users: users, posts: posts)

        return package
    }

    // Retorna uma estrutura de dados mais relevante pra aprensentar os dados
    func mountUserPackage(users: [Person], posts: [Post]) -> [PostPackage] {
        var package = [PostPackage]()

        for post in posts {
            for user in users where post.personID == user.personID {
                let postPack = PostPackage(postID: post.postID, personID: post.personID, communityID: post.communityID, title: post.title, description: post.description, useful: post.useful, status: post.status, comments: post.comments, authorName: user.userName, authorImageName: user.imageNameProfile)
                package.append(postPack)
            }
        }
        return package
    }

    // retorna a instancia do usuário a partir do seu ID
    func getAuthorOfPost(userIdentifier: Int) -> Person {
        let fileUrl = Bundle.main.url(forResource: "Users", withExtension: "json")!
        let jsonData = try? Data(contentsOf: fileUrl)
        var users = [Person]()
        do {
            users = try JSONDecoder().decode([Person].self, from: jsonData!)
        } catch {
            print(error.localizedDescription)
        }

        users = users.filter({ (user) -> Bool in
            user.personID == userIdentifier
        })
        return users.first!
    }
}
