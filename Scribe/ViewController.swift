//
//  ViewController.swift
//  Scribe
//
//  Created by Justin Lindsay on 7/21/17.
//  Copyright © 2017 Justin Lindsay. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    @IBOutlet weak var transcriptionTxtField: UITextView!
    
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitySpinner.isHidden = true
        
    }
    
    func requestSpeechAuth() {
        
        SFSpeechRecognizer.requestAuthorization { authStatus in
            
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
                    
                    do {
                        
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound
                        sound.play()
                        
                    } catch {
                        
                        print("Error")
                        
                    }
                    
                    
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request) { (result, error) in
                     
                        if let error = error {
                            
                            print("There was an error: \(error)")
                            
                        } else {
                            
                            print(result?.bestTranscription.formattedString as Any)
                            
                        }
                        
                    }
                    
                }
                
            }
        }
    }
    
    
    @IBAction func playBtnPressed(_ sender: CircleButton) {
        
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        requestSpeechAuth()
        
    }
    

}

