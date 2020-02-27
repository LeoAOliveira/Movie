//
//  ScoreViewController.swift
//  Nano Challenge 2
//
//  Created by Leonardo Oliveira on 19/04/19.
//  Copyright © 2019 Leonardo Oliveira. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var score: UIProgressView!
    @IBOutlet weak var finishImage: UIImageView!
    
    var number = 0
    var win = false
    var finish = false
    var winner = ""
    var team = "blue"
    var gameScore: Float = 0.50

    @IBAction func ShareMovieImage(_ sender: Any) {
        let image = imageView.image
        
        let activityViewController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        
//        activityViewController.excludedActivityTypes = []
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishImage.image = nil
        
        // Score counter
        if win == true{
            
            if team == "blue"{
                gameScore += 0.13
            } else{
                gameScore -= 0.13
            }
            
        } else{
            
            if team == "blue"{
                gameScore -= 0.13
            } else{
                gameScore += 0.13
            }
        }
        
        // Display score
        score.progress = gameScore
        
        // Game finished
        if gameScore >= 1.0 {
            
            winner = "blue"
            finish = true
            finishImage.image = UIImage(named: "blue.png")
            gameScore = 0.50
            team = "red"
            
        } else if gameScore <= 0{
            
            winner = "red"
            finish = true
            finishImage.image = UIImage(named: "red.png")
            gameScore = 0.50
            team = "red"
        }
        
        // Correct movie
        imageView.image = UIImage(named: "img\(String(describing: number)).png")
        
        if team == "blue"{
            team = "red"
        } else{
            team = "blue"
        }
        
    }
    
    @IBAction func playBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "playSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "playSegue"{
            let destination = segue.destination as! MovieViewController
            destination.team = team
            destination.gameScore = gameScore
            
        }
    }


}
