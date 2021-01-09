//
//  ViewController.swift
//  TConverter
//
//  Created by NIKOLAI BORISOV on 03.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var slider: UISlider! {
        didSet {
            slider.maximumValue = 100
            slider.minimumValue = 0
            slider.value = 0
        }
    }
    @IBOutlet weak var celciusLabel: UILabel!
    @IBOutlet weak var farenheitLabel: UILabel!
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let temperatureCelsius = Int(round(sender.value))
        celciusLabel.text = "\(temperatureCelsius)ºC"
        let fahrenheitTemperature = Int(round((sender.value * 9 / 5) + 32))
        farenheitLabel.text = "\(fahrenheitTemperature)ºF"    }
}


