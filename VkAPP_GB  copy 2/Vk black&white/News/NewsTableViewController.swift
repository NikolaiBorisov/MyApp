//
//  NewsTableViewController.swift
//  Vk black&white
//
//  Created by Macbook on 19.12.2020.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    let news = NewsFactory.makeNews()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) { animateTable() }

    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { news.count }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        
        cell.newsName.text = news[indexPath.row].newsNameLabel
        cell.newsAvatar.image = news[indexPath.row].newsAvatar
        cell.newsImage.image = news[indexPath.row].newsImage
        cell.newsComment.text = news[indexPath.row].newsCommentLabel
        
        let rightNow = Date()
        let calendar = Calendar.current
        let t = calendar.dateComponents([.minute], from: rightNow).minute!
        cell.newsDateTime.text = String(t) + " minutes ago"
        return cell
    }
}


