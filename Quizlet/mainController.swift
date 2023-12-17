//
//  mainController.swift
//  Quizlet
//
//  Created by Ramazan Kalabay on 15.12.2023.
//

import UIKit
import AVFoundation

class mainController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice1Label: UIButton!
    @IBOutlet weak var choice2Label: UIButton!
    @IBOutlet weak var choice3Label: UIButton!
    @IBOutlet weak var progressViewLabel: UIProgressView!
    
    var winSoundPlayer: AVAudioPlayer?
    var loseSoundPlayer: AVAudioPlayer?
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        setupAudioPlayers()
    }
    
    @IBAction func choice1ActionButton(_ sender: UIButton) {
        processAnswer(userAnswer: sender.titleLabel?.text ?? "", sender: sender)
    }
    
    @IBAction func choice2ActionButton(_ sender: UIButton) {
        processAnswer(userAnswer: sender.titleLabel?.text ?? "", sender: sender)
    }
    
    @IBAction func choice3ActionButton(_ sender: UIButton) {
        processAnswer(userAnswer: sender.titleLabel?.text ?? "", sender: sender)
    }
    
    func processAnswer(userAnswer: String, sender: UIButton) {
        let userGotItRight = quizBrain.checkAnswer(userAnswer)

        if userGotItRight {
            questionLabel.text = "Right"
            sender.backgroundColor = UIColor.green
            playWinSound()
        } else {
            questionLabel.text = "Wrong"
            sender.backgroundColor = UIColor.red
            playLoseSound()
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressViewLabel.progress = quizBrain.getProgress()
        scoreLabel.text = quizBrain.getScore()
        choice1Label.backgroundColor = UIColor.clear
        choice2Label.backgroundColor = UIColor.clear
        choice3Label.backgroundColor = UIColor.clear
        
        let variants = quizBrain.getChoiceAnswer()
        choice1Label.setTitle(variants[0], for: .normal)
        choice2Label.setTitle(variants[1], for: .normal)
        choice3Label.setTitle(variants[2], for: .normal)
        
        stopAllSounds()
    }
    
    func setupAudioPlayers() {
            if let winSoundPath = Bundle.main.path(forResource: "win_sound", ofType: "wav") {
                let winSoundURL = URL(fileURLWithPath: winSoundPath)
                do {
                    winSoundPlayer = try AVAudioPlayer(contentsOf: winSoundURL)
                } catch {
                    print("Error initializing win sound player: \(error.localizedDescription)")
                }
            }

            if let loseSoundPath = Bundle.main.path(forResource: "lose_sound", ofType: "wav") {
                let loseSoundURL = URL(fileURLWithPath: loseSoundPath)
                do {
                    loseSoundPlayer = try AVAudioPlayer(contentsOf: loseSoundURL)
                } catch {
                    print("Error initializing lose sound player: \(error.localizedDescription)")
                }
            }
        }
    
    func playWinSound() {
        winSoundPlayer?.currentTime = 0
        winSoundPlayer?.play()
    }

    func playLoseSound() {
        loseSoundPlayer?.currentTime = 0
        loseSoundPlayer?.play()
    }
    
    func stopAllSounds() {
        winSoundPlayer?.stop()
        loseSoundPlayer?.stop()
    }

}
