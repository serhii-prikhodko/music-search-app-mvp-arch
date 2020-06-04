//
//  ViewController.swift
//  music-search-app-mvp-arch
//
//  Created by Serhiy Prikhodko on 5/25/20.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Variables
    let searchController = UISearchController(searchResultsController: nil)
    var presenter: SearchViewPresenterProtocol!
    var enteredText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.prepareSearchController()
    }
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Functions
    func prepareSearchController() {
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search Artist"
        navigationItem.searchController = self.searchController
        definesPresentationContext = true
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        self.enteredText = searchBar.text
        self.presenter.getSearchResults()
    }
}
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.presenter.artists?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let artist = presenter.artists?[indexPath.row]
        cell.textLabel?.text = artist?.artistName
        
        return cell
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

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artist = self.presenter.artists?[indexPath.row]
        self.presenter.tapOnTheArtist(artist: artist)
    }
}
