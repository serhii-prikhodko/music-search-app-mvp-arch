//
//  ViewController.swift
//  music-search-app-mvp-arch
//
//  Created by Serhiy Prikhodko on 5/25/20.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
    
    // MARK: - Variables
    let searchController = UISearchController(searchResultsController: nil)
    var presenter: SearchViewPresenterProtocol!
    var enteredText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Functions
    func prepareSearchController() {
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search News"
        navigationItem.searchController = self.searchController
        definesPresentationContext = true
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        searchBar.text = enteredText
    }
}

extension SearchViewController: SearchViewProtocol {
    var artistParam: String? {
        get {
            return self.enteredText
        }
    }

    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}
