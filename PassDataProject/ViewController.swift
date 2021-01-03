//
//  ViewController.swift
//  PassDataProject
//
//  Created by NIKOLAI BORISOV on 03.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //скрыть клавиатуру
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func loginTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "DetailSegue", sender: nil)
//Переход на разные вью
//        if someValue == true {
//            performSegue(withIdentifier: "DetailSegue", sender: nil)
//        } else {
//            performSegue(withIdentifier: "NextSegue", sender: nil)
//        }
    }
    
    @IBAction func unwindToMainScreen(segue: UIStoryboardSegue){
        guard segue.identifier == "UnwindSegue" else { return }
        guard let svc = segue.source as? SecondViewController else { return }
        self.resultLabel.text = svc.label.text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? SecondViewController else { return }
        dvc.login = loginTF.text
    }
}

