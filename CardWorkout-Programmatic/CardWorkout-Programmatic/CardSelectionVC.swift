//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by I want to... on 4/14/23.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    //Create buttons
    let cardImageView   = UIImageView() //we dragged the image on the screen
    let stopButton      = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let resetButton     = CWButton(backgroundColor: .systemGreen, title: "Reset")
    let rulesButton     = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    var cards: [UIImage] = CardDeck.allvalues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func stopTimer(){
        timer.invalidate()
    }
    
    @objc func resetTimer(){
        timer.invalidate()
        startTimer()
    }
    
    @objc func showRandomCard(){
        cardImageView.image = cards.randomElement()
    }
    
    func configureUI(){
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton() 
    }
    
    func configureCardImageView(){
        view.addSubview(cardImageView) //equivalent to drag a subView to View in storyboard
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS") //adding card images Assets
        
        //constraints (width, height, x , y)
        NSLayoutConstraint.activate([ //this activate can store multiple constraints
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton(){
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside )
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.centerYAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 50)
        ])
    }
    
    func configureResetButton(){
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        //add an action to the button
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    @objc func presentRulesVC(){
        present(RulesVC(), animated: true)
    }

}
