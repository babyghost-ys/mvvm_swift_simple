//
//  PostsViewModel.swift
//  mvvm_swift
//
//  Created by Peter Leung on 12/01/2023.
//

import Foundation

class PostsViewModel {
    
    private var apiHandler = APIHandler()
    var postsData:[Post] = []
    
    var bindViewModelToController : (() -> ()) = {}
    
    func callApiHandler() {
        self.apiHandler.getDataFromAPI { posts in
            self.postsData = posts
            self.bindViewModelToController()
        }
    }
}
