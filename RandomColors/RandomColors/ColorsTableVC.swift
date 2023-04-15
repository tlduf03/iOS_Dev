//
//  ColorsTableVC.swift
//  RandomColors
//
//  Created by I want to... on 4/12/23.
//

import UIKit

class ColorsTableVC: UIViewController {
    
    var colors:[UIColor] = []
    
    enum Cells{
        static let colorCell = "ColorCell"
    }
    
    enum Segues{
        static let toDetail = "ToColorsDetailVC"
        
    }
    //this function runs as soon as the screen is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
        // Do any additional setup after loading the view.
    }
    
    //50 random colors
    func addRandomColors(){
        for _ in 0..<50 {
            colors.append(.random()) // this random is from UIColor ext
        }
    }
    
    //this functionality is moved to the UIColor.Ext
//    func createRandomColor() -> UIColor {
//        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
//                                  green: CGFloat.random(in: 0...1),
//                                  blue: CGFloat.random(in: 0...1),
//                                  alpha: 1)
//        return randomColor
//    }
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailVC //type cast: destVC is now type of ColorsDetailVC which is a subclass of UIViewController
        destVC.color = sender as? UIColor
    }
    
    
}
//for code organization purpose
extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
    
    //dataSource (How many rows needed to show?)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    //delegate SHOWing part!!!
    //(Waiting for an action and run automatically) (what to show in the rows?)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
            return UITableViewCell()
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") //as swiping the screen, cells are being reused with new contents
        let color = colors[indexPath.row]
        cell.backgroundColor = color
        
        return cell
    }
    
    //another delegate method / Once we tap the color row, this happens
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segues.toDetail, sender: color)
    }
}
