//
//  ColorsDetailVC.swift
//  RandomColors
//
//  Created by I want to... on 4/12/23.
//

import UIKit

class ColorsDetailVC: UIViewController {
    
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .blue
    }
}
