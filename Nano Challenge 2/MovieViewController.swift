//
//  ViewController.swift
//  Nano Challenge 2
//
//  Created by Leonardo Oliveira on 17/04/19.
//  Copyright © 2019 Leonardo Oliveira. All rights reserved.
//

import UIKit
import Foundation

class MovieViewController: UIViewController {
    
    var number = 0
    var history: [Int] = []
    var team = "blue"
    var gameScore: Float = 0.50
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var teamNumberLabel: UILabel!
    @IBOutlet weak var teamColorView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Team playing
        if team == "blue"{
            teamNumberLabel.text = "1"
            teamColorView.backgroundColor = #colorLiteral(red: 0.6196078431, green: 0.8901960784, blue: 0.9843137255, alpha: 1)
        
        } else{
            teamNumberLabel.text = "2"
            teamColorView.backgroundColor = #colorLiteral(red: 1, green: 0.5792968297, blue: 0.5529411765, alpha: 1)
        }
        
        // Random movie
        number = Int.random(in: 0...85)
//        print(number)
        imageView.image = UIImage(named: "img\(String(describing: number)).png")
        history.append(number)
    }
    
    
    @IBAction func anotherBtnPressed(_ sender: Any) {
        
        var isRepeated = true
        
        // Loop to garantee that another movie will be displayed
        while isRepeated == true{
            
            isRepeated = false
            
            number = Int.random(in: 0...85)
            
            for i in 0..<history.count {
                
                if number == history[i]{
                    isRepeated = true
                }
            }
            
            if history.count == 86{
                history = []
                isRepeated = false
            }
        }
        
        imageView.image = UIImage(named: "img\(String(describing: number)).png")
        history.append(number)
    }
    
    
    @IBAction func checkBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "movieSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "movieSegue"{
            let destination = segue.destination as! IconSelectionViewController
            destination.number = number
            destination.team = team
            destination.gameScore = gameScore
        }
    }
    
}

