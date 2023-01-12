//
//  Post.swift
//  mvvm_swift
//
//  Created by Peter Leung on 12/01/2023.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
