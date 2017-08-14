//
//  ViewController.swift
//  hustle-mode
//
//  Created by Apostolos Chalkias on 14/08/2017.
//  Copyright © 2017 Apostolos Chalkias. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var darkBlueBg: UIImageView!
    
    @IBOutlet weak var powerBtn: UIButton!
    
    @IBOutlet weak var cloudHolder: UIView!
    
    @IBOutlet weak var rocket: UIImageView!
    
    @IBOutlet weak var hustleLbL: UILabel!
    
    @IBOutlet weak var onLbl: UILabel!
    
    var player: AVAudioPlayer!

    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
    }

   
    @IBAction func powerBtnPressed(_ sender: Any) {
        
        cloudHolder.isHidden = false
        darkBlueBg.isHidden = true
        powerBtn.isHidden = true
        
        player.play()
        
        //Animation
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 140, width: 375, height: 402)
        }) { (finished) in
            self.hustleLbL.isHidden = false
            self.onLbl.isHidden = false
        }
        
    }
    

}

