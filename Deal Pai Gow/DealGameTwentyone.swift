//
//  DealGame.swift
//  Pai Gow
//
//  Created by Aaron Fleming on 5/21/21.
//

import Foundation
import AVFoundation
import UIKit

class DealGameTwentyone: UIViewController {
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var newGame: UIButton!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var playersCards: UIButton!
    @IBOutlet weak var dealersCards: UIButton!
    @IBOutlet weak var highCardOne: UILabel!
    @IBOutlet weak var highCardTwo: UILabel!
    @IBOutlet weak var cardOne: UIButton!
    @IBOutlet weak var cardTwo: UIButton!
    @IBOutlet weak var cardThree: UIButton!
    @IBOutlet weak var cardFour: UIButton!
    @IBOutlet weak var cardFive: UIButton!
    @IBOutlet weak var cardSix: UIButton!
    @IBOutlet weak var cardSeven: UIButton!
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var openHand: UIButton!
    @IBOutlet weak var dealGame: UIButton!
    @IBOutlet weak var setHand: UIButton!
    @IBOutlet weak var playerLowHand: UIButton!
    @IBOutlet weak var setHandFirstChoice: UIButton!
    @IBOutlet weak var setHandSecondChoice: UIButton!
    @IBOutlet weak var setHandCardOne: UIButton!
    @IBOutlet weak var setHandCardTwo: UIButton!
    @IBOutlet weak var setHandCardThree: UIButton!
    @IBOutlet weak var setHandCardFour: UIButton!
    @IBOutlet weak var setHandCardFive: UIButton!
    @IBOutlet weak var openPlayersCards: UIButton!
    @IBOutlet weak var playerCardOne: UIButton!
    @IBOutlet weak var playerCardTwo: UIButton!
    @IBOutlet weak var playerCardThree: UIButton!
    @IBOutlet weak var playerCardFour: UIButton!
    @IBOutlet weak var playerCardFive: UIButton!
    @IBOutlet weak var playerHighCardOne: UIButton!
    @IBOutlet weak var playerHighCardTwo: UIButton!
    @IBOutlet weak var mainBet: UITextField!
    @IBOutlet weak var fortuneBet: UITextField!
    @IBOutlet weak var tableMinimum: UILabel!
    @IBOutlet weak var fortuneLabel: UILabel!
    @IBOutlet weak var betLabel: UILabel!
    @IBOutlet weak var envyButton: UIButton!
    @IBOutlet weak var push: UIButton!
    @IBOutlet weak var pay: UIButton!
    @IBOutlet weak var take: UIButton!
    @IBOutlet weak var payMainBet: UITextField!
    @IBOutlet weak var mainBetLabel: UILabel!
    @IBOutlet weak var fortuneBetLabel: UILabel!
    @IBOutlet weak var bobPlays: UILabel!
    @IBOutlet weak var payTwo: UIButton!
    @IBOutlet weak var takeTwo: UIButton!
    @IBOutlet weak var payFortuneBet: UITextField!
    @IBOutlet weak var edtPayMainHeight: NSLayoutConstraint!
    @IBOutlet weak var edtPayFortuneHeight: NSLayoutConstraint!
    @IBOutlet weak var edtFortuneBetHeight: NSLayoutConstraint!
    @IBOutlet weak var edtMainBetHeight: NSLayoutConstraint!
    @IBOutlet weak var btnGroupTwoSV: UIStackView!
    @IBOutlet weak var btnGroupSV: UIStackView!
    @IBOutlet weak var envyPlaced: UIImageView!
    @IBOutlet weak var envyRules: UILabel!
    @IBOutlet weak var level2: UILabel!
    let btnFontSize: CGFloat = {
        if screenHeight > 700 {
            return 17.0
        } else {
            return 12.0
        }
    }()
    
    let edtFontSize: CGFloat = {
        if screenHeight > 700 {
            return 17.0
        } else {
            return 12.0
        }
    }()
    
    let titleFontSize: CGFloat = {
        if screenHeight > 700 {
            return 22.0
        } else {
            return 17.0
        }
    }()
    
    let edtHeight: CGFloat = {
        if screenHeight > 700 {
            return 34.0
        } else {
            return 22.0
        }
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Constant.storyboardName = "DealGameTwentyone"
        print("Level 2")
        let kb = UIToolbar()
        kb.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneClick))
        payMainBet.inputAccessoryView = kb
        payFortuneBet.inputAccessoryView = kb
        kb.items = [doneButton]
        highCardOne.text = ""
        highCardTwo.text = ""
        dealersCards.alpha = 0
        playersCards.alpha = 0
        cardOne.alpha = 0
        cardTwo.alpha = 0
        cardThree.alpha = 0
        cardFour.alpha = 0
        cardFive.alpha = 0
        cardSix.alpha = 0
        cardSeven.alpha = 0
        openHand.alpha = 0
        setHand.alpha = 0
        playerLowHand.alpha = 0
        highCardOne.alpha = 0
        highCardTwo.alpha = 0
        setHandFirstChoice.alpha = 0
        setHandSecondChoice.alpha = 0
        setHandCardOne.alpha = 0
        setHandCardTwo.alpha = 0
        setHandCardThree.alpha = 0
        setHandCardFour.alpha = 0
        setHandCardFive.alpha = 0
        openPlayersCards.alpha = 0
        playerCardOne.alpha = 0
        playerCardTwo.alpha = 0
        playerCardThree.alpha = 0
        playerCardFour.alpha = 0
        playerCardFive.alpha = 0
        playerHighCardOne.alpha = 0
        playerHighCardTwo.alpha = 0
        push.alpha = 0
        pay.alpha = 0
        take.alpha = 0
        payMainBet.alpha = 0
        mainBetLabel.alpha = 0
        mainBet.text = "25"
        fortuneBet.text = "5"
        mainBet.textAlignment = .center
        fortuneBet.textAlignment = .center
        payTwo.alpha = 0
        takeTwo.alpha = 0
        fortuneBetLabel.alpha = 0
        payFortuneBet.alpha = 0
        newGame.alpha = 0
        envyPlaced.alpha = 0
        envyRules.alpha = 0
        
        bobPlays.font = .systemFont(ofSize: titleFontSize)
        fortuneLabel.font = .systemFont(ofSize: btnFontSize)
        fortuneBet.font = .systemFont(ofSize: edtFontSize)
        betLabel.font = .systemFont(ofSize: btnFontSize)
        mainBet.font = .systemFont(ofSize: edtFontSize)
        
        push.titleLabel?.font = .systemFont(ofSize: btnFontSize)
        pay.titleLabel?.font = .systemFont(ofSize: btnFontSize)
        take.titleLabel?.font = .systemFont(ofSize: btnFontSize)
        payTwo.titleLabel?.font = .systemFont(ofSize: btnFontSize)
        takeTwo.titleLabel?.font = .systemFont(ofSize: btnFontSize)
        
        dealGame.titleLabel?.font = .systemFont(ofSize: btnFontSize)
        openHand.titleLabel?.font = .systemFont(ofSize: btnFontSize)
        mainBetLabel.font = .systemFont(ofSize: btnFontSize)
        fortuneBetLabel.font = .systemFont(ofSize: btnFontSize)
        setHand.titleLabel?.font = .systemFont(ofSize: btnFontSize)
        openPlayersCards.titleLabel?.font = .systemFont(ofSize: btnFontSize)
        
        payFortuneBet.font = .systemFont(ofSize: edtFontSize)
        payMainBet.font = .systemFont(ofSize: edtFontSize)
        
        tableMinimum.font = .systemFont(ofSize: btnFontSize)
        
        edtPayMainHeight.constant = edtHeight
        edtFortuneBetHeight.constant = edtHeight
        edtMainBetHeight.constant = edtHeight
        edtPayFortuneHeight.constant = edtHeight
    }
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    @objc func doneClick()
    {
    self.view.endEditing(true)
    }
    
    @IBAction func envyTapped(_ sender: Any) {
        envyButton.alpha = 0
        envyPlaced.alpha = 1
        if envyRules.alpha == 1 {
        envyRules.alpha = 0
        }
    }
    @IBAction func dealGameTapped(_ sender: Any) {
        
        if envyPlaced.alpha == 1 {
            dealersCards.alpha = 1
            playersCards.alpha = 1
            dealGame.alpha = 0
            openHand.alpha = 1
            bobPlays.alpha = 0
        }
        if envyPlaced.alpha == 0 {
            envyRules.alpha = 1
        }
        
    }
    
    @IBAction func setHandTapped(_ sender: Any) {
        if highCardOne.text == "Jack Of Hearts." && highCardTwo.text == "King Of Hearts." || highCardOne.text == "King Of Hearts." && highCardTwo.text == "Jack Of Hearts."   {
        
            playerLowHand.alpha = 1
            setHand.alpha = 0
            openPlayersCards.alpha = 1
            setHandCardOne.alpha = 1
            setHandCardTwo.alpha = 1
            setHandCardThree.alpha = 1
            setHandCardFour.alpha = 1
            setHandCardFive.alpha = 1
            setHandFirstChoice.alpha = 1
            setHandSecondChoice.alpha = 1
            cardOne.alpha = 0
            cardTwo.alpha = 0
            cardThree.alpha = 0
            cardFour.alpha = 0
            cardFive.alpha = 0
            cardSix.alpha = 0
            cardSeven.alpha = 0
            firstChoice.alpha = 0
            secondChoice.alpha = 0
        } else {
            highCardOne.text = ""
            highCardTwo.text = ""
            cardOne.alpha = 1
            cardTwo.alpha = 1
            cardThree.alpha = 1
            cardFour.alpha = 1
            cardFive.alpha = 1
            cardSix.alpha = 1
            cardSeven.alpha = 1
            firstChoice.setImage(nil, for: .normal)
            secondChoice.setImage(nil, for: .normal)
            
        }
    }
    @IBAction func openHandTapped(_ sender: Any) {
        cardOne.alpha = 1
        cardTwo.alpha = 1
        cardThree.alpha = 1
        cardFour.alpha = 1
        cardFive.alpha = 1
        cardSix.alpha = 1
        cardSeven.alpha = 1
        openHand.alpha = 0
        dealGame.alpha = 0
        dealersCards.alpha = 0
        setHand.alpha = 1
    }
    
    @IBAction func openPlayersCardsTapped(_ sender: Any) {
        playersCards.alpha = 0
        playerLowHand.alpha = 0
        playerCardOne.alpha = 1
        playerCardTwo.alpha = 1
        playerCardThree.alpha = 1
        playerCardFour.alpha = 1
        playerCardFive.alpha = 1
        playerHighCardOne.alpha = 1
        playerHighCardTwo.alpha = 1
        openPlayersCards.alpha = 0
        push.alpha = 1
        pay.alpha = 1
        take.alpha = 1
        payMainBet.alpha = 1
        mainBetLabel.alpha = 1
        
        
    }
    
    @IBAction func pushButtonTapped(_ sender: Any) {
        push.alpha = 0
        pay.alpha = 0
        payMainBet.alpha = 0
        take.alpha = 0
        mainBetLabel.alpha = 0
        betLabel.text = "0"
        betLabel.textAlignment = .center
        payTwo.alpha = 1
        takeTwo.alpha = 1
        payFortuneBet.alpha = 1
        fortuneBetLabel.alpha = 1
        btnGroupSV.isHidden = true
        btnGroupTwoSV.isHidden = false
        
    }
    
    @IBAction func payButtonTapped(_ sender: Any) {
        pay.alpha = 0
        payMainBet.alpha = 0
    }
    
    @IBAction func takeButtonTapped(_ sender: Any) {
        take.alpha = 0
    }
    
    @IBAction func payTwoButtonTapped(_ sender: Any) {
        var dogLoseLeftRotate: UIImage!
        var dogLoseRightRotate: UIImage!
        var images: [UIImage]!
        var animatedImage: UIImage!
        var dogWin: UIImage!
        if payFortuneBet.text == "10" {
            payTwo.alpha = 0
            takeTwo.alpha = 0
            payFortuneBet.alpha = 0
            fortuneBetLabel.alpha = 0
            fortuneLabel.text = "10"
            fortuneLabel.textAlignment = .center
            payFortuneBet.textAlignment = .center
            fortuneBet.text = "5"
            newGame.alpha = 1
            payFortuneBet.textAlignment = .center
            var dogLose: UIImage!
            dogLose = UIImage(named: "dogNormal")
            dogLoseLeftRotate = UIImage(named: "dogWin")
            
            images = [dogLose, dogLoseLeftRotate]
            
            animatedImage = UIImage.animatedImage(with: images, duration: 0.2)
            
            ImageView.image = animatedImage
            let CatSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "audio", ofType: "mp3")!)
                    do {
                        audioPlayer = try AVAudioPlayer(contentsOf: CatSound as URL)
                        audioPlayer.prepareToPlay()
                    } catch {
                        print("Problem in getting File")
                    }
                    audioPlayer.play()
                }
    
        else if payFortuneBet.text != "10" {
            payFortuneBet.text = ""
        }
    }
    
    @IBAction func takeTwoButtonTapped(_ sender: Any) {
        
        takeTwo.alpha = 0
        
    }
    
    @IBAction func btnClick(_ sender: UIButton) {
        
        switch sender.tag{
            
        case 1:
            if ( highCardTwo.text == ""){
                cardOne.alpha = 0
                if highCardOne.text == ""{
                    highCardOne.text = "Jack Of Hearts."
                    firstChoice.setImage(UIImage(named: "jackHearts.png"), for: .normal)
                }else{
                    highCardTwo.text = "Jack Of Hearts."
                    secondChoice.setImage(UIImage(named: "jackHearts.png"), for: .normal)
                    
                }
        }else {
                if checkResult(){
                    highCardOne.text = "Jack Of Hearts."
                    firstChoice.setImage(UIImage(named: "jackHearts.png"), for: .normal)
                    cardOne.alpha = 0
                }
    }
            
            
        case 2:
            if ( highCardTwo.text == ""){
                cardTwo.alpha = 0
                if highCardOne.text == ""{
                    highCardOne.text = "King Of Hearts."
                    firstChoice.setImage(UIImage(named: "kingHearts.png"), for: .normal)
                }else{
                    highCardTwo.text = "King Of Hearts."
                    secondChoice.setImage(UIImage(named: "kingHearts.png"), for: .normal)
                }
            }else{
                if checkResult(){
                    highCardOne.text = "King Of Hearts."
                    firstChoice.setImage(UIImage(named: "kingHearts.png"), for: .normal)
                    cardTwo.alpha = 0
                }
            }
            
        case 3:
    
            if ( highCardTwo.text == ""){
                cardThree.alpha = 0
                if highCardOne.text == ""{
                    highCardOne.text = "Two Of Diamonds."
                    firstChoice.setImage(UIImage(named: "twoDiamonds.png"), for: .normal)
                }else{
                    highCardTwo.text = "Two Of Diamonds."
                    secondChoice.setImage(UIImage(named: "twoDiamonds.png"), for: .normal)
                }
            }else{
                if checkResult(){
                    highCardOne.text = "Two Of Diamonds."
                    firstChoice.setImage(UIImage(named: "twoDiamonds.png"), for: .normal)
                    cardThree.alpha = 0
                }
            }
            
        case 4:
            if ( highCardTwo.text == ""){
                cardFour.alpha = 0
                if highCardOne.text == ""{
                    highCardOne.text = "Seven Of Spades."
                    firstChoice.setImage(UIImage(named: "sevenSpades.png"), for: .normal)
                }else{
                    highCardTwo.text = "Seven Of Spades."
                    secondChoice.setImage(UIImage(named: "sevenSpades.png"), for: .normal)
                }
            }else{
                if checkResult(){
                    highCardOne.text = "Seven Of Spades."
                    firstChoice.setImage(UIImage(named: "sevenSpades.png"), for: .normal)
                    cardFour.alpha = 0
                }
            }
  
            
        case 5:
            if ( highCardTwo.text == ""){
                cardFive.alpha = 0
                if highCardOne.text == ""{
                    highCardOne.text = "Ace Of Diamonds."
                    firstChoice.setImage(UIImage(named: "aceDiamonds.png"), for: .normal)
                }else{
                    highCardTwo.text = "Ace Of Diamonds."
                    secondChoice.setImage(UIImage(named: "aceDiamonds.png"), for: .normal)
                }
           
            }else{
                if checkResult(){
                    highCardOne.text = "Ace Of Diamonds."
                    firstChoice.setImage(UIImage(named: "aceDiamonds.png"), for: .normal)
                    cardFive.alpha = 0
                }
            }
   
                
        case 6:
            if ( highCardTwo.text == ""){
                cardSix.alpha = 0
                if highCardOne.text == ""{
                    highCardOne.text = "Ace Of Spades."
                    firstChoice.setImage(UIImage(named: "aceSpades.png"), for: .normal)
                }else{
                    highCardTwo.text = "Ace Of Spades."
                    secondChoice.setImage(UIImage(named: "aceSpades.png"), for: .normal)
                }
            }else{
                if checkResult(){
                    highCardOne.text = "Ace Of Spades."
                    firstChoice.setImage(UIImage(named: "aceSpades.png"), for: .normal)
                    cardSix.alpha = 0
                }
            }
                    
        case 7:
            if ( highCardTwo.text == ""){
                cardSeven.alpha = 0
                if highCardOne.text == ""{
                    highCardOne.text = "Nine Of Clubs."
                    firstChoice.setImage(UIImage(named: "nineClubs.png"), for: .normal)
                }else{
                    highCardTwo.text = "Nine Of Clubs."
                    secondChoice.setImage(UIImage(named: "nineClubs.png"), for: .normal)
                }
            }else{
                if checkResult(){
                    highCardOne.text = "Nine Of Clubs."
                    firstChoice.setImage(UIImage(named: "nineClubs.png"), for: .normal)
                    cardSeven.alpha = 0
                }
            }
   
            
        default:
            highCardOne.text = ""
            highCardTwo.text = ""
        }
    }
    func checkResult() -> Bool{
        
            highCardOne.text = ""
            highCardTwo.text = ""
            cardOne.alpha = 1
            cardTwo.alpha = 1
            cardThree.alpha = 1
            cardFour.alpha = 1
            cardFive.alpha = 1
            cardSix.alpha = 1
            cardSeven.alpha = 1
            firstChoice.setImage(nil, for: .normal)
            secondChoice.setImage(nil, for: .normal)
            return true
    }
    func infinite360Animation(targetView: UIView, duration: Double) {
            UIView.animate(withDuration: duration/2, delay: 0, options: .curveLinear) {
                targetView.transform = CGAffineTransform.identity.rotated(by: .pi )
            } completion: { (_) in
                UIView.animate(withDuration: duration/2, delay: 0, options: .curveLinear) {
                    targetView.transform = CGAffineTransform.identity.rotated(by: .pi * 2)
                } completion: { (_) in
                    self.infinite360Animation(targetView: targetView, duration: duration)
                }
            }
        }
}
