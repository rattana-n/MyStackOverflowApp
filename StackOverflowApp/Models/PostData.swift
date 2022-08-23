//
//  PostData.swift
//  StackOverflowApp
//
//  Created by Rattana Noeun on 4/17/22.
//

import Foundation

struct Results: Decodable {
    let items: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return title
    }
    let title: String
    let score: Int
    let answer_count: Int
    let link: String?
}
