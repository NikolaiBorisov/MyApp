//
//  WeatherViewController.swift
//  Weather
//
//  Created by Macbook on 15.12.2020.
//

import UIKit

class WeatherViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 10 }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        cell.weatherLabel.text = "30 C"
        cell.timeLabel.text = "30.08.2019 12:00"
        
        return cell
    }
}

//extension WeatherViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (collectionView.frame.width - 50) / 2
//        return CGSize(width: width, height: width)
//    }
//}

