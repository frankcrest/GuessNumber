//
//  ViewController.swift
//  BullsEye
//
//  Created by Frank Chen on 2018-11-24.
//  Copyright © 2018 Frank Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var currentRound = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var roundLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        
        startOver()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighed = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighed, for: .highlighted)
        
        
        let insets = UIEdgeInsets(top : 0, left: 14, bottom : 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert() {
        
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        score += points
        
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5{
            if difference == 1{
                points += 50
            }
            title = "You almost got it"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close!"
        }
        
        let message = "You scored \(points)"
        
       let alert = UIAlertController(title: title, message: message, preferredStyle:
    .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved (_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    @IBAction func startOver () {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound(){
        currentRound += 1
        
        targetValue = Int.random(in: 1...100)
        
        currentValue = 50
        
        slider.value = Float(currentValue)
        
        updateLabels()
    }
 
    func updateLabels(){
        targetLabel.text = String(targetValue)
        points.text = String(score)
        roundLabel.text = String(currentRound)
    }
    
}

