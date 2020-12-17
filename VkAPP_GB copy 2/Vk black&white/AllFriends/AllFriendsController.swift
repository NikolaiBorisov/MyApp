//
//  AllFriendsController.swift
//  Vk black&white
//
//  Created by Macbook on 08.12.2020.
//

import UIKit

class AllFriendsController: UITableViewController {
    
    
    enum UserSatus: String, CaseIterable {
        case online = "Online"
        case offline = "Offline"
        static func setRandomStatus() -> UserSatus {
            return UserSatus.allCases[Int.random(in: 0...1)]
        }
    }
        
    let friends = FriendsFactory.makeFriends()
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    private var filteredFriends = [User]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
    return searchController.isActive && !searchBarIsEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredFriends.count
        }
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! AllFriendsCell
        
        var friend: User
        if isFiltering {
            friend = filteredFriends[indexPath.row]
        } else {
            friend = friends[indexPath.row]
        }
        
        let user = friends[indexPath.row]
        cell.friendsName.text = user.name
        cell.friendsName.adjustsFontSizeToFitWidth = true
        cell.friendsName.minimumScaleFactor = CGFloat(10)
        cell.friendsPhoto.image = user.avatar
        let status = UserSatus.setRandomStatus()
        switch status {
        case .online: cell.friendsStatus.textColor = .black
        default: cell.friendsStatus.textColor = .lightGray
        //cell.friendsStatus.textColor = status == .online ? .black : .lightGray
        //cell.friendsStatus.text = status.rawValue
        }
        cell.friendsStatus.text = status.rawValue
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showUserImage" {
            let photoAlbum = segue.destination as? PicturesViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                let friend = friends[indexPath.row]
                photoAlbum?.friend = friend
            }
        }
    }
}

extension AllFriendsController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredFriends = friends.filter({ (friend: User) -> Bool in
            return friend.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
