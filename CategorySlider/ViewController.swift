//
//  ViewController.swift
//  CategorySlider
//
//  Created by AbdallahMahameed on 13/07/2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Slider Test"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension UICollectionViewCell {
    static var cellID: String {
        return String(describing: Self.self)
    }
}
