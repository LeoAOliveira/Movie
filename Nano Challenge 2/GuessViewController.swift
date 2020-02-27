//
//  GuessViewController.swift
//  Nano Challenge 2
//
//  Created by Leonardo Oliveira on 19/04/19.
//  Copyright © 2019 Leonardo Oliveira. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController {
    
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var teamNumberLabel: UILabel!
    @IBOutlet weak var teamColorView: UIView!
    
    var movieIcons: String = ""
    
    var number = 0
    var win = false
    var team  = "blue"
    var gameScore: Float = 0.0
    
    var time: Int = 90
    var timer: Timer!

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
        
        movieLabel.text = movieIcons
        
        timeCount()
    }
    
    // Timer
    func timeCount(){
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(guessTime), userInfo: nil, repeats: true)
    }
    
    @objc func guessTime() {
        
        if time != 0{
            
            time -= 1
            timeLabel.text = "\(time)"
            
        } else{
            
            timer.invalidate()
            timeLabel.text = "\(time)"
            
            performSegue(withIdentifier: "scoreSegue", sender: self)
        }
        
    }
    
    
    @IBAction func checkBtnPressed(_ sender: UIButton) {
        
        win = true
        performSegue(withIdentifier: "scoreSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "scoreSegue"{
            let destination = segue.destination as! ScoreViewController
            destination.number = number
            destination.team = team
            destination.win = win
            destination.gameScore = gameScore
            
        }
    }
    

}
