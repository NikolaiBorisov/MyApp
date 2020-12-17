//
//  AllCitiesCell.swift
//  Weather
//
//  Created by Macbook on 07.12.2020.
//

import UIKit

class AllCitiesCell: UITableViewCell {
    
    @IBOutlet weak var cityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
