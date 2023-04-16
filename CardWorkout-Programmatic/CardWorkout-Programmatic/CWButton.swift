//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by I want to... on 4/14/23.
//

import UIKit

class CWButton: UIButton {
    //initializer
    override init(frame: CGRect) { //overrides the UIButton init()
        super.init(frame: frame) //everything from UIButton
        configure() //plus customized configure
    }
    
    required init?(coder: NSCoder) { //when view is created from storyboard
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String){
        super.init(frame: .zero) //put 0 for all constraints for now
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }
     
    func configure(){
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false //not using Auto layout
    }
    
}
