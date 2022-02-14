//
//  ViewController.swift
//  MusicWireframe
//
//  Created by Виталий Татун on 14.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    var isPlaying: Bool = true {
        didSet {
            playPauseButton.isSelected = isPlaying
        }
    }
    
    @IBOutlet var reverseBackground: UIView!
    @IBOutlet var playPauseBackground: UIView!
    @IBOutlet var forwardBackground: UIView!
    @IBOutlet var albumImageView: UIImageView!
    @IBOutlet var reverseButton: UIButton!
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var forwardButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        [reverseBackground, playPauseBackground, forwardBackground] .forEach {
            view in
            view?.layer.cornerRadius = view!.frame.height / 2
            view?.clipsToBounds = true
            view?.alpha = 0.0
        }
    }
    

    
    
}

