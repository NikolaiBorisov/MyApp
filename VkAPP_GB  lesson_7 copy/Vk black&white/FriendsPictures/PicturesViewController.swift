//
//  PicturesViewController.swift
//  Vk black&white
//
//  Created by Macbook on 08.12.2020.
//

import UIKit

class PicturesViewController: UICollectionViewController {
    
    var friend: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = friend.name
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { friend.photos.count }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendsPictures", for: indexPath) as! PicturesCell
        let album = friend.photos[indexPath.row]
        cell.pictures.image = album
        return cell
    }
}
//Разделение фото на две колонки
//extension PicturesViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (collectionView.frame.width - 50) / 2
//        return CGSize(width: width, height: width)
//    }
//}
