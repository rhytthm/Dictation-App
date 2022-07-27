//
//  ViewController.swift
//  DictationApp
//
//  Created by Rhytthm Mahajan on 21/03/21.
//

import UIKit
import InstantSearchVoiceOverlay

class ViewController: UIViewController, VoiceOverlayDelegate {
    
    

    let voiceOverlay = VoiceOverlayController()
    @IBOutlet var myButton: UIButton!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.backgroundColor = .systemRed
        myButton.setTitleColor(.white,for:.normal)
    }

    @IBAction func didTapButton(){
        voiceOverlay.delegate = self
        voiceOverlay.settings.autoStop = true
        voiceOverlay.settings.autoStart = false
        voiceOverlay.settings.autoStopTimeout = 3
        voiceOverlay.start(on: self, textHandler: {text, final, _ in
            
            if final {
                print("Final Text is \(text)")
            }else{
                //print("In Progress: \(text)")
            }
        }, errorHandler: { error in
            
        })
    }
    func recording(text: String?, final: Bool?, error: Error?) {
        Label.text = text
    }

}

