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
    
    @IBAction func playPauseButtonTapped() {
        isPlaying.toggle()
        
        if isPlaying {
            UIView.animate(
                withDuration: 0.8,
                delay: 0,
                usingSpringWithDamping: 0.6,
                initialSpringVelocity: 0.1,
                options: [],
                animations: {
                    self.albumImageView.transform = CGAffineTransform.identity
                },
                completion: nil)
        } else {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }
    
    @IBAction func touchedDown(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        UIView.animate(withDuration: 0.25) {
            buttonBackground.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        
        
    }
    
    @IBAction func touchedUpInside(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        UIView.animate(withDuration: 0.25) {
            buttonBackground.alpha = 0
            
            buttonBackground.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            sender.transform = CGAffineTransform.identity
        } completion: { (_) in
            buttonBackground.transform = CGAffineTransform.identity
        }
    }
    
}

