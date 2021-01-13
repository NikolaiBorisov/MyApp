//
//  AllFriendsController.swift
//  Vk black&white
//
//  Created by Macbook on 08.12.2020.
//

import UIKit

struct SectionF {
    var title: String
    var items: [User]
}

class AllFriendsController: UITableViewController, UISearchBarDelegate {
    
    let friends = FriendsFactory.makeFriends()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filteredFriends = [User]()
    var friendSection = [SectionF]()
    var searching = false
    
    override func viewWillAppear(_ animated: Bool) {
        animateTable()
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let friendDictionary = Dictionary.init(grouping: friends) {
            $0.name.prefix(1)
        }
        friendSection = friendDictionary.map {SectionF(title: String($0.key), items: $0.value)}
        friendSection.sort {$0.title < $1.title}
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if searching {
            return 1
        } else {
            return friendSection.count
        }
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        friendSection.map {$0.title}
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return  filteredFriends.count
        } else {
            return friendSection[section].items.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! AllFriendsCell
        
        let user = friends[indexPath.row]
        cell.friendsName.text = user.name
        cell.friendsName.adjustsFontSizeToFitWidth = true
        cell.friendsName.minimumScaleFactor = CGFloat(10)
        cell.friendsPhoto.image = user.avatar
        let status = UserSatus.setRandomStatus()
        switch status {
        case .online: cell.friendsStatus.textColor = .black
        default: cell.friendsStatus.textColor = .lightGray
        //Статус без switch
        //cell.friendsStatus.textColor = status == .online ? .black : .lightGray
        //cell.friendsStatus.text = status.rawValue
        }
        cell.friendsStatus.text = status.rawValue
        
        if searching {
            cell.friendsName.text = filteredFriends[indexPath.row].name
            cell.friendsPhoto.image = filteredFriends[indexPath.row].avatar
        } else {
            cell.friendsName.text = friendSection[indexPath.section].items[indexPath.row].name
            cell.friendsPhoto.image = friendSection[indexPath.section].items[indexPath.row].avatar
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let label = UILabel()
        headerView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        label.text = friendSection[section].title
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.thin)
        headerView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
        label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16)
        ])
        return headerView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showUserImage" {
            let photoAlbum = segue.destination as? PicturesViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                //let friend = friends[indexPath.row]
                //photoAlbum?.friend = friend
                
                if searching {
                    photoAlbum?.friend = filteredFriends[indexPath.row]
                } else {
                    photoAlbum?.friend = friendSection[indexPath.section].items[indexPath.row]
                }
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredFriends = friends.filter({$0.name.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
