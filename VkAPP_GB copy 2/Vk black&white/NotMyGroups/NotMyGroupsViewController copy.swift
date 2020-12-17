//
// NotMyGroupsViewController.swift
//  Vk black&white
//  Created by Macbook on 08.12.2020.

import UIKit

class NotMyGroupsViewController: UITableViewController {
    
    var newGroups = [
        Group(name: "GeekBrains", avatar: "Geeks"),
        Group(name: "SkillBox", avatar: "Skbox"),
        Group(name: "Netology", avatar: "Net"),
        Group(name: "Mail.ru", avatar: "Mail"),
        Group(name: "Yandex.ru", avatar: "Yandex.ru"),
        Group(name: "Google.com", avatar: "Google"),
        ]
    
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { newGroups.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newGroupCell", for: indexPath) as! MyGroupsCell
        let group = newGroups[indexPath.row]
        cell.groupName.text = group.name
        cell.groupImage.image = group.avatar
        return cell
    }
}

