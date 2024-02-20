//
//  ViewController.swift
//  CatchTheAbdiGame
//
//  Created by Ali serkan Boyracı  on 8.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //views
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var highScoreLabel: UILabel!
    @IBOutlet var abdi1: UIImageView!
    @IBOutlet var abdi2: UIImageView!
    @IBOutlet var abdi3: UIImageView!
    @IBOutlet var abdi4: UIImageView!
    @IBOutlet var abdi5: UIImageView!
    @IBOutlet var abdi6: UIImageView!
    @IBOutlet var abdi7: UIImageView!
    @IBOutlet var abdi8: UIImageView!
    @IBOutlet var abdi9: UIImageView!
    @IBOutlet var abdi10: UIImageView!
    @IBOutlet var abdi11: UIImageView!
    @IBOutlet var abdi12: UIImageView!
    @IBOutlet var abdi13: UIImageView!
    @IBOutlet var abdi14: UIImageView!
    @IBOutlet var abdi15: UIImageView!
    
    //variables
    var score = 0
    var timer = Timer()
    var counter = 0
    var abdiArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        //HighScore check
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore") //tekrar açılırken gözükmesi için.
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        abdi1.isUserInteractionEnabled = true // to clicked active
        abdi2.isUserInteractionEnabled = true
        abdi3.isUserInteractionEnabled = true
        abdi4.isUserInteractionEnabled = true
        abdi5.isUserInteractionEnabled = true
        abdi6.isUserInteractionEnabled = true
        abdi7.isUserInteractionEnabled = true
        abdi8.isUserInteractionEnabled = true
        abdi9.isUserInteractionEnabled = true
        abdi10.isUserInteractionEnabled = true
        abdi11.isUserInteractionEnabled = true
        abdi12.isUserInteractionEnabled = true
        abdi13.isUserInteractionEnabled = true
        abdi14.isUserInteractionEnabled = true
        abdi15.isUserInteractionEnabled = true
        
        // adding tap recognizer
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer10 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer11 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer12 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer13 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer14 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer15 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        // connect tap recognizer
        abdi1.addGestureRecognizer(recognizer1)
        abdi2.addGestureRecognizer(recognizer2)
        abdi3.addGestureRecognizer(recognizer3)
        abdi4.addGestureRecognizer(recognizer4)
        abdi5.addGestureRecognizer(recognizer5)
        abdi6.addGestureRecognizer(recognizer6)
        abdi7.addGestureRecognizer(recognizer7)
        abdi8.addGestureRecognizer(recognizer8)
        abdi9.addGestureRecognizer(recognizer9)
        abdi10.addGestureRecognizer(recognizer10)
        abdi11.addGestureRecognizer(recognizer11)
        abdi12.addGestureRecognizer(recognizer12)
        abdi13.addGestureRecognizer(recognizer13)
        abdi14.addGestureRecognizer(recognizer14)
        abdi15.addGestureRecognizer(recognizer15)
        
        abdiArray = [abdi1,abdi2,abdi3,abdi4,abdi5,abdi6,abdi7,abdi8,abdi9,abdi10,abdi11,abdi12,abdi13,abdi14,abdi15]
        
        
        

        
        counter = 30
        timeLabel.text = "\(counter)" //String(counter)
        // decrease 1 second time interval
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(myTimer), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(hideAbdi), userInfo: nil, repeats: true)
        
        
        hideAbdi()
        
    }
    
    
    @objc func hideAbdi() {
        for abdi in abdiArray {
            abdi.isHidden = true // to unshow all abdis.
        }
        let random = Int(arc4random_uniform(UInt32(abdiArray.count - 1))) //if write 15 or .count, we didn't have 15th abdi. because array starts with 0.
        //because of this we must decrease 1.
        // we must cast Int. to take random number.
        abdiArray[random].isHidden = false
        
    }
    

    
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)" // after increasing 1, you have to show that increase again
        
    }
    
    @objc func myTimer() {
        counter -= 1
        timeLabel.text = String(counter)
    
        if counter == 0 {
            timer.invalidate() //stop the timer
            hideTimer.invalidate() //stop abdi timer.
            
            // to hide all abdis
            for abdi in abdiArray {
                abdi.isHidden = true
            
            timeLabel.text = "Time is Over"
             
                
            //HighScore to set
                if self.score > self.highScore {
                    self.highScore = self.score
                    highScoreLabel.text = "Highscore: \(self.highScore)"
                    UserDefaults.standard.set(self.highScore, forKey: "highScore") //to set highscore
                }
           
                
            //Alert
            let alert = UIAlertController(title: "ZAMAN DOLDU!", message: "TEKRAR OYNA?", preferredStyle: .alert)
            
            let okButton = UIAlertAction(title: "NO", style: .destructive)
                
            let replayButton = UIAlertAction(title: "YES", style: .cancel) { [self] UIAlertAction in
                //replay function-to play gaain
                //to reset score
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                // to reset counter
                self.counter = 30
                self.timeLabel.text = String(self.counter)
                // reset Timers
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(myTimer), userInfo: nil, repeats: true)
                hideTimer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(hideAbdi), userInfo: nil, repeats: true)
                
                
            }
            
            //to add buttons
            alert.addAction(replayButton)
            alert.addAction(okButton)
            // to show alert
            self.present(alert, animated: true, completion: nil)
        }
    }

}

}

// PAW petrol olani yapilacak= paw patrolleree gore puanlar degisecek.
// ekran eklenecek
// kullanici adlari ve puanlari gosterilecek
// oyuna zorluk seviyesi ve sure secme eklenecek


