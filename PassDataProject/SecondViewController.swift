//
//  SecondViewController.swift
//  PassDataProject
//
//  Created by NIKOLAI BORISOV on 03.01.2021.
//

import UIKit

class SecondViewController: UIViewController {

    var login: String?
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let login = self.login else { return }
        label.text = "Hello, \(login)!"
    }
   
    @IBAction func goBack(_ sender: UIButton) {
        performSegue(withIdentifier: "UnwindSegue", sender: nil)
    }
    
}
