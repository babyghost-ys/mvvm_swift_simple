//
//  PostsViewModel.swift
//  mvvm_swift
//
//  Created by Peter Leung on 12/01/2023.
//

import Foundation

class PostsViewModel {
    
    private var apiHandler = APIHandler()
    private var postsData:[Post] = []
    
    func callApiHandler() {
        self.apiHandler.getDataFromAPI { posts in
            self.postsData = posts
        }
    }
}
