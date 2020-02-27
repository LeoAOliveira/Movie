//
//  IconSelectionViewController.swift
//  Nano Challenge 2
//
//  Created by Leonardo Oliveira on 18/04/19.
//  Copyright © 2019 Leonardo Oliveira. All rights reserved.
//

import UIKit

class IconSelectionViewController: UIViewController {

    @IBOutlet weak var textView: EmojiTextView!
    @IBOutlet weak var teamColorView: UIView!
    @IBOutlet weak var teamNumberLabel: UILabel!
    
    @IBAction func EmojiShare(_ sender: Any) {
        var emojiText = "Can you guess the movie?\n"
        emojiText.append(contentsOf: self.textView.text)
        
        let activityViewController = UIActivityViewController(activityItems: [emojiText], applicationActivities: nil)
        
//        activityViewController.excludedActivityTypes = []
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    var number = 0
    var team = "blue"
    var gameScore: Float = 0.0
    
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
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
    }
    
    // To display the keyboard when the view appears
    override func viewDidAppear(_ animated: Bool) {
         textView.becomeFirstResponder()
    }
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "iconSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "iconSegue"{
            let destination = segue.destination as! GuessViewController
            destination.movieIcons = textView.text
            destination.number = number
            destination.team = team
            destination.gameScore = gameScore
        }
    }
    
}

// TextView class to display a emoji-only keyboard
class EmojiTextView: UITextView {
    
    override var textInputMode: UITextInputMode? {
        
        for mode in UITextInputMode.activeInputModes {
            
            if mode.primaryLanguage == "emoji" {
                
                return mode
            }
        }
        
        return nil
    }
}
