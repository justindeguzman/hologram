//
//  Player.swift
//  hologram
//
//  Created by Justin de Guzman on 28/12/2015.
//  Copyright (c) 2015 Justin de Guzman. All rights reserved.
//

import UIKit
import MediaPlayer

class Player: UIViewController {
    
    var moviePlayer : MPMoviePlayerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var fileURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("video", ofType: "mp4")!)
        
        moviePlayer = MPMoviePlayerController(contentURL: fileURL)
        moviePlayer.view.frame = self.view.frame
        
        self.view.addSubview(moviePlayer.view)
        moviePlayer.fullscreen = true
        moviePlayer.controlStyle = MPMovieControlStyle.Fullscreen
        
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.None)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didPressDone:", name: MPMoviePlayerPlaybackDidFinishNotification, object: moviePlayer)
    }
    
    func didPressDone(notification: NSNotification) {
        self.dismissViewControllerAnimated(true) {
            NSNotificationCenter.defaultCenter().removeObserver(self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
