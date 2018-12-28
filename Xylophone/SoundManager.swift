//
//  SoundManager.swift
//  Xylophone
//
//  Created by Georg Federmann on 27.12.18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation;
import AVFoundation;

class SoundManager {
    
    static var audioPlayer:AVAudioPlayer?;
    
    static func playSound(_ note:String){
        let bundlePath = Bundle.main.path(forResource:note, ofType:"wav");
        guard bundlePath != nil else {
            print("Couldn't resolve audio file for \(note).");
            return;
        }
        print("found audio file at \(bundlePath!).");
        let soundUrl = URL(fileURLWithPath: bundlePath!);
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl);
            audioPlayer?.play();
        } catch {
            print("Could not create AVAudioPlayer object for \(bundlePath!).");
        }
    }
}
