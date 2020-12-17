//
//MyGroupsViewController.swift
//  Vk black&white
//  Created by Macbook on 08.12.2020.

import UIKit

class MyGroupsViewController: UITableViewController {

    var groups: [Group] = [
        Group(name: "GeekBrains", avatar: "Geeks"),
        Group(name: "SkillBox", avatar: "Skbox"),
        Group(name: "Netology", avatar: "Net"),
//        Group(name: "Mail.ru", avatar: "Mail"),
//        Group(name: "Yandex.ru", avatar: "Yandex.ru"),
//        Group(name: "Google.com", avatar: "Google"),
        ]
    
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { groups.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! MyGroupsCell
        let group = groups[indexPath.row]
        cell.groupName.text = group.name
        cell.groupImage.image = group.avatar
        
        return cell
        }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                if editingStyle == .delete {
                    groups.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    //tableView.reloadData()
                    }
    }
                    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let addGroupController = segue.source as? NotMyGroupsViewController else { return }
            if let indexPath = addGroupController.tableView.indexPathForSelectedRow {
                let group = addGroupController.newGroups[indexPath.row] //addGroupController.notMyGroups[indexPath.row]
                if !groups.contains(group) {
                    groups.append(group)
                    tableView.reloadData()
                }
            }
        }
    }
}


