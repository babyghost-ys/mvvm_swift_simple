//
//  ViewController.swift
//  mvvm_swift
//
//  Created by Peter Leung on 12/01/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var postsTableView: UITableView!
    
    private var postsViewModel = PostsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsTableView.dataSource = self
        postsTableView.delegate = self
        
        postsViewModel.callApiHandler()
        postsViewModel.bindViewModelToController = {
            DispatchQueue.main.async {
                self.postsTableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsViewModel.postsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = postsViewModel.postsData[indexPath.row].title
        
        cell.contentConfiguration = content
        return cell
    }

}

