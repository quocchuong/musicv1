//
//  ViewController.swift
//  music
//
//  Created by John Lam on 10/12/2014.
//  Copyright (c) 2014 John Lam. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{

    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet var sliVol: UISlider!
    @IBOutlet var lblVOl: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var fileLocation = NSString(string: NSBundle.mainBundle().pathForResource("Nho", ofType: "mp3")!)
        
        var error : NSError? = nil
        
        player  = AVAudioPlayer(contentsOfURL: NSURL(string: fileLocation), error: &error)
        
        sliVol.value = 1
        
        changeVol()
        
        player.play()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //stop button
    @IBAction func btnStop_Touch(sender: AnyObject)
    {
        player.stop()
    }
    
    @IBAction func sliVol_Slide(sender: AnyObject)
    {
        changeVol()
    }
    
    func changeVol()
    {
        lblVOl.text = "\(sliVol.value * 100)%"
        player.volume = sliVol.value
    }
}

