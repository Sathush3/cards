//
//  PlaySound.swift
//  cards
//
//  Created by Sathurshan Ramachandran on 2022-10-10.
//

import Foundation

import AVFoundation

//MARK: - AUDIO PLAYER

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type:String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPlayer?.play()
            
        }catch{
            print("Cannot find the audio file")
        }
    }
        
}
