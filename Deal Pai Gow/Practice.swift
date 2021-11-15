//
//  Practice.swift
//  Pai Gow
//
//  Created by Aaron Fleming on 5/21/21.
//

import Foundation

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

class Practice: UIViewController {

    var level1: Bool = true
    var level2: Bool = false
    var level3: Bool = false
    var level4: Bool = false
    var level5: Bool = false
    var level6: Bool = false
    var level7: Bool = false
    var level8: Bool = false
    var level9: Bool = false
    var level10: Bool = false
    var level11: Bool = false
    var level12: Bool = false
    var level13: Bool = false
    var level14: Bool = false
    var level15: Bool = false
    var level16: Bool = false
    var level17: Bool = false
    var level18: Bool = false
    var level19: Bool = false
    var level20: Bool = false
    @IBOutlet weak var highCardOne: UILabel!
    @IBOutlet weak var highCardTwo: UILabel!
    @IBOutlet weak var incorrect: UILabel!
    @IBOutlet weak var correct: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var instructionsLB: UILabel!
    @IBOutlet weak var aceHighLabel: UILabel!
    @IBOutlet weak var practice: UILabel!
    @IBOutlet weak var dogNormal: UIImageView!
    
    let cardOne: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints  = false
        return button
    }()
    
    let cardTwo: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints  = false
        return button
    }()
    
    let cardThree: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints  = false
        return button
    }()
    
    let cardFour: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints  = false
        return button
    }()
    
    let cardFive: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints  = false
        return button
    }()
    
    let cardSix: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints  = false
        return button
    }()
    
    let cardSeven: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints  = false
        return button
    }()
    
    let firstChoice: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints  = false
        return button
    }()
    
    let secondChoice: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints  = false
        return button
    }()
    
    let deltaHeight: CGFloat = {
        if screenHeight > 700 {
            return 20.0
        } else {
            return 50.0
        }
    }()
    
    let images: [String] = [
        "aceClubs",
        "aceDiamonds",
        "twoHearts",
        "sevenSpades",
        "queenClubs",
        "kingDiamonds",
        "kingHearts"
    ]
    
    let angles: [CGFloat] = [-0.55, -0.40, -0.17, 0.0, 0.17, 0.40, 0.55]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogNormal.isHidden = true
        practice.isHidden = true
        aceHighLabel.isHidden = true
        incorrect.isHidden = true
        correct.isHidden = true
        highCardOne.text = ""
        highCardTwo.text = ""
        
        if screenHeight < 700 {
            instructionsLB.font = UIFont(name: "Chalkboard SE", size: 12.0)
            highCardOne.font = UIFont(name: "Chalkboard SE", size: 12.0)
            highCardTwo.font = UIFont(name: "Chalkboard SE", size: 12.0)
            incorrect.font = UIFont(name: "Chalkboard SE", size: 12.0)
            correct.font = UIFont(name: "Chalkboard SE", size: 12.0)
        }
        
        let buttons: [UIButton] = [cardOne, cardTwo, cardThree, cardFour, cardFive, cardSix, cardSeven]
        var curAngle: CGFloat = CGFloat((202.5 /  180 * Double.pi))
        let stepAngle: CGFloat = CGFloat(22.5 / 180 * Double.pi)
        let cardWidth = screenWidth * 50.0 / 414.0
        let cardHeight = cardWidth * 1.3
        let radius: CGFloat = screenWidth / 2.0 - cardWidth / 2.0 - 10.0
        
        for i in 0..<buttons.count {
            let button = buttons[i]
            self.view.addSubview(button)
            button.tag = i + 1
            button.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
            button.widthAnchor.constraint(equalToConstant: cardWidth).isActive = true
            button.heightAnchor.constraint(equalToConstant: cardHeight).isActive = true
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: cos(curAngle) * radius).isActive = true
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: sin(curAngle) * radius + deltaHeight).isActive = true
            button.transform = CGAffineTransform(rotationAngle: curAngle - CGFloat(Double.pi / 2.0))
            button.setBackgroundImage(UIImage(named: images[i]), for: .normal)
            curAngle += stepAngle
        }
        
        let centerDelta = cardWidth / 2.0 + 12.0
        
        self.view.addSubview(firstChoice)
        firstChoice.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: deltaHeight).isActive = true
        firstChoice.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -centerDelta).isActive = true
        firstChoice.widthAnchor.constraint(equalToConstant: cardWidth).isActive = true
        firstChoice.heightAnchor.constraint(equalToConstant: cardHeight).isActive = true
        
        
        self.view.addSubview(secondChoice)
        secondChoice.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: deltaHeight).isActive = true
        secondChoice.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: centerDelta).isActive = true
        secondChoice.widthAnchor.constraint(equalToConstant: cardWidth).isActive = true
        secondChoice.heightAnchor.constraint(equalToConstant: cardHeight).isActive = true
    }
    
    @objc func btnClick(_ sender: UIButton) {
        
        switch sender.tag{
            
        case 1:
            if level1{
            if ( highCardTwo.text == ""){
                cardOne.isHidden = true
                correct.isHidden = true
                incorrect.isHidden = true
                instructionsLB.isHidden = true
                if highCardOne.text == ""{
                    highCardOne.text = "Ace Of Clubs."
                    firstChoice.setBackgroundImage(UIImage(named: "aceClubs.png"), for: .normal)
                }else{
                    correct.isHidden = true
                    incorrect.isHidden = true
                    instructionsLB.isHidden = true
                    highCardTwo.text = "Ace Of Clubs."
                    secondChoice.setBackgroundImage(UIImage(named: "aceClubs.png"), for: .normal)
                    
                }
            }else{
                if checkResult(){
                    correct.isHidden = true
                    incorrect.isHidden = true
                    instructionsLB.isHidden = true
                    highCardOne.text = "Ace Of Clubs."
                    firstChoice.setBackgroundImage(UIImage(named: "aceClubs.png"), for: .normal)
                    cardOne.isHidden = true
                }
            }
            }else if level2{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Seven Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Seven Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }else if level3{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Joker."
                        firstChoice.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Joker."
                        secondChoice.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        highCardOne.text = "Joker."
                        correct.isHidden = true
                        incorrect.isHidden = true
                        firstChoice.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }
            else if level4{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Eight Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Eight Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        highCardOne.text = "Eight Of Diamonds."
                        correct.isHidden = true
                        incorrect.isHidden = true
                        firstChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }
            else if level5{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Four Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Four Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        highCardOne.text = "Four Of Hearts."
                        correct.isHidden = true
                        incorrect.isHidden = true
                        firstChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }else if level6{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ace Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "aceHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Ace Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "aceHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        highCardOne.text = "Ace Of Hearts."
                        correct.isHidden = true
                        incorrect.isHidden = true
                        firstChoice.setBackgroundImage(UIImage(named: "aceHearts.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }else if level7{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Four Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Four Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        highCardOne.text = "Four Of Hearts."
                        correct.isHidden = true
                        incorrect.isHidden = true
                        firstChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }else if level8{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Seven Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        highCardOne.text = "Seven Of Diamonds."
                        correct.isHidden = true
                        incorrect.isHidden = true
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }else if level9{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Six Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Six Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        highCardOne.text = "Six Of Clubs."
                        correct.isHidden = true
                        incorrect.isHidden = true
                        firstChoice.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }else if level10{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ace Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Ace Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        highCardOne.text = "Ace Of Spades."
                        correct.isHidden = true
                        incorrect.isHidden = true
                        firstChoice.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }else if level11{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Two Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        highCardOne.text = "Two Of Clubs."
                        correct.isHidden = true
                        incorrect.isHidden = true
                        firstChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }
            else if level12{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Joker."
                        firstChoice.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Joker."
                        secondChoice.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        highCardOne.text = "Joker."
                        correct.isHidden = true
                        incorrect.isHidden = true
                        firstChoice.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }
            else if level13{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Seven Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Seven Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }else if level14{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "twoSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Two Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "twoSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Two Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "twoSpades.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }else if level15{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "twoSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Two Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "twoSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Two Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "twoSpades.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }else if level16{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ace Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "aceHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Ace Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "aceHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Ace Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "aceHearts.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }else if level17{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "King Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "kingHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "King Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "kingHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "King Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "kingHearts.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }else if level18{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Seven Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Seven Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }else if level19{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Joker."
                        firstChoice.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Joker."
                        secondChoice.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Joker."
                        firstChoice.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }else if level20{
                if ( highCardTwo.text == ""){
                    cardOne.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ace Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Ace Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Ace Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                        cardOne.isHidden = true
                    }
                }
            }
            
            
        case 2:
            if level1{
            if ( highCardTwo.text == ""){
                cardTwo.isHidden = true
                correct.isHidden = true
                incorrect.isHidden = true
                instructionsLB.isHidden = true
                if highCardOne.text == ""{
                    highCardOne.text = "Ace Of Diamonds."
                    firstChoice.setBackgroundImage(UIImage(named: "aceDiamonds.png"), for: .normal)
                }else{
                    correct.isHidden = true
                    incorrect.isHidden = true
                    instructionsLB.isHidden = true
                    highCardTwo.text = "Ace Of Diamonds."
                    secondChoice.setBackgroundImage(UIImage(named: "aceDiamonds.png"), for: .normal)
                }
            }else{
                if checkResult(){
                    correct.isHidden = true
                    incorrect.isHidden = true
                    instructionsLB.isHidden = true
                    highCardOne.text = "Ace Of Diamonds."
                    firstChoice.setBackgroundImage(UIImage(named: "aceDiamonds.png"), for: .normal)
                    cardTwo.isHidden = true
                }
            }
            }else if level2{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Five Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "fiveClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Five Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "fiveClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Five Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "fiveClubs.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level3{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Two Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Two Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level4{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ten Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "tenClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Ten Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "tenClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Ten Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "tenClubs.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level5{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Queen Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "queenHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Queen Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "queenHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Queen Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "queenHearts.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }
            else if level6{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Two Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Two Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }
            else if level7{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Seven Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Seven Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level8{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Jack Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Jack Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Jack Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level9{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Two Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Two Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level10{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Two Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Two Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }
            else if level11{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Eight Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "eightSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Eight Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "eightSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Eight Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "eightSpades.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level12{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Five Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "fiveSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Five Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "fiveSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Five Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "fiveSpades.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level13{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Three Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Three Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Three Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level14{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Six Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sixDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Six Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "sixDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Six Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sixDiamonds.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level15{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Two Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Two Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level16{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Seven Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Seven Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level17{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Eight Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "eightHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Eight Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "eightHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Eight Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "eightHearts.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level18{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Seven Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Seven Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level19{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ten Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "tenSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Ten Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "tenSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Ten Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "tenSpades.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }else if level20{
                if ( highCardTwo.text == ""){
                    cardTwo.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Jack Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Jack Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Jack Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                        cardTwo.isHidden = true
                    }
                }
            }

            
        
        case 3:
            if level1{
            if ( highCardTwo.text == ""){
                cardThree.isHidden = true
                correct.isHidden = true
                incorrect.isHidden = true
                instructionsLB.isHidden = true
                if highCardOne.text == ""{
                    highCardOne.text = "Two Of Hearts."
                    firstChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                }else{
                    correct.isHidden = true
                    incorrect.isHidden = true
                    instructionsLB.isHidden = true
                    highCardTwo.text = "Two Of Hearts."
                    secondChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                }
            }else{
                if checkResult(){
                    correct.isHidden = true
                    incorrect.isHidden = true
                    instructionsLB.isHidden = true
                    highCardOne.text = "Two Of Hearts."
                    firstChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                    cardThree.isHidden = true
                }
            }
            }else if level2{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Jack of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "jackHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Jack of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "jackHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Jack of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "jackHearts.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level3{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Jack Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Jack Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Jack Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level4{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Eight Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "eightHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Eight Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "eightHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Eight Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "eightHearts.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level5{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Three Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Three Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Three Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level6{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Jack Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "jackClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Jack Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "jackClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Jack Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "jackClubs.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level7{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Jack Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Jack Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Jack Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level8{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Jack Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Jack Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Jack Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level9{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Eight Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "eightClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Eight Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "eightClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Eight Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "eightClubs.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level10{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "King Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "King Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "King Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level11{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Nine Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Nine Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Nine Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level12{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Three Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "threeClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Three Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "threeClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Three Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "threeClubs.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level13{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Seven Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Seven Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level14{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Nine Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Nine Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Nine Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level15{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Nine Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Nine Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Nine Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level16{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Six Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Six Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Six Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level17{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ace Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Ace Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Ace Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level18{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "twoSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Two Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "twoSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Two Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "twoSpades.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level19{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ten Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "tenHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Ten Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "tenHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Ten Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "tenHearts.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }else if level20{
                if ( highCardTwo.text == ""){
                    cardThree.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "King Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "kingSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "King Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "kingSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "King Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "kingSpades.png"), for: .normal)
                        cardThree.isHidden = true
                    }
                }
            }
            
        case 4:
            if level1{
            if ( highCardTwo.text == ""){
                correct.isHidden = true
                incorrect.isHidden = true
                instructionsLB.isHidden = true
                cardFour.isHidden = true
                if highCardOne.text == ""{
                    highCardOne.text = "Seven Of Spades."
                    firstChoice.setBackgroundImage(UIImage(named: "sevenSpades.png"), for: .normal)
                }else{
                    correct.isHidden = true
                    incorrect.isHidden = true
                    instructionsLB.isHidden = true
                    highCardTwo.text = "Seven Of Spades."
                    secondChoice.setBackgroundImage(UIImage(named: "sevenSpades.png"), for: .normal)
                }
            }else{
                if checkResult(){
                    correct.isHidden = true
                    incorrect.isHidden = true
                    instructionsLB.isHidden = true
                    highCardOne.text = "Seven Of Spades."
                    firstChoice.setBackgroundImage(UIImage(named: "sevenSpades.png"), for: .normal)
                    cardFour.isHidden = true
                }
            }
            }else if level2{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Nine of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Nine of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Nine of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }else if level3{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Four Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "fourDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Four Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "fourDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Four Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "fourDiamonds.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }
            else if level4{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Four Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "fourDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Four Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "fourDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Four Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "fourDiamonds.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }
            else if level5{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ace Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "aceHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Ace Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "aceHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Ace Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "aceHearts.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }
            else if level6{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ace Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Ace Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Ace Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }else if level7{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Nine Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Nine Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Nine Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }else if level8{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Four Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Four Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Four Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }else if level9{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Six Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "sixSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Six Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "sixSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Six Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "sixSpades.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }else if level10{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Six Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sixDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Six Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "sixDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Six Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sixDiamonds.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }else if level11{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Jack Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Jack Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Jack Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }
            else if level12{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Jack Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Jack Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Jack Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }else if level13{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Three Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "threeClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Three Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "threeClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Three Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "threeClubs.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }else if level14{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Jack Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Jack Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Jack Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }else if level15{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Jack Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Jack Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Jack Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }else if level16{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Nine Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Nine Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Nine Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }else if level17{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Eight Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Eight Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Eight Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }else if level18{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Four Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Four Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Four Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }else if level19{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Four Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Four Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Four Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }else if level20{
                if ( highCardTwo.text == ""){
                    cardFour.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Seven Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Seven Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        cardFour.isHidden = true
                    }
                }
            }
            
        case 5:
            if level1{
            if ( highCardTwo.text == ""){
                cardFive.isHidden = true
                correct.isHidden = true
                incorrect.isHidden = true
                instructionsLB.isHidden = true
                if highCardOne.text == ""{
                    highCardOne.text = "Queen Of Clubs."
                    firstChoice.setBackgroundImage(UIImage(named: "queenClubs.png"), for: .normal)
                }else{
                    correct.isHidden = true
                    incorrect.isHidden = true
                    instructionsLB.isHidden = true
                    highCardTwo.text = "Queen Of Clubs."
                    secondChoice.setBackgroundImage(UIImage(named: "queenClubs.png"), for: .normal)
                }
           
            }else{
                if checkResult(){
                    correct.isHidden = true
                    incorrect.isHidden = true
                    instructionsLB.isHidden = true
                    highCardOne.text = "Queen Of Clubs."
                    firstChoice.setBackgroundImage(UIImage(named: "queenClubs.png"), for: .normal)
                    cardFive.isHidden = true
                }
            }
            }else if level2{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Nine of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "nineSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Nine of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "nineSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Nine of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "nineSpades.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level3{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Two Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Two Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level4{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Three Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "threeDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Three Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "threeDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Three Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "threeDiamonds.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }
            else if level5{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Six Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "sixHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Six Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "sixHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Six Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "sixHearts.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level6{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Seven Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Seven Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level7{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Two Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Two Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level8{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Five Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "fiveHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Five Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "fiveHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Five Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "fiveHearts.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level9{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Seven Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Seven Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level10{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Six Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "sixHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Six Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "sixHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Six Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "sixHearts.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level11{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "King Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "kingHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "King Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "kingHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "King Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "kingHearts.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level12{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Two Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Two Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level13{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Three Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "threeDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Three Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "threeDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Three Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "threeDiamonds.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level14{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Eight Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Eight Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Eight Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level15{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Two Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Two Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level16{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Jack Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "jackClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Jack Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "jackClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Jack Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "jackClubs.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level17{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Two Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Two Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level18{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Seven Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Seven Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level19{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Seven Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Seven Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }else if level20{
                if ( highCardTwo.text == ""){
                    cardFive.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ten Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "tenSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Ten Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "tenSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Ten Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "tenSpades.png"), for: .normal)
                        cardFive.isHidden = true
                    }
                }
            }
   
                
        case 6:
            if level1{
            if ( highCardTwo.text == ""){
                cardSix.isHidden = true
                correct.isHidden = true
                incorrect.isHidden = true
                instructionsLB.isHidden = true
                if highCardOne.text == ""{
                    highCardOne.text = "King Of Diamonds."
                    firstChoice.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                }else{
                    correct.isHidden = true
                    incorrect.isHidden = true
                    instructionsLB.isHidden = true
                    highCardTwo.text = "King Of Diamonds."
                    secondChoice.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                }
            }else{
                if checkResult(){
                    correct.isHidden = true
                    incorrect.isHidden = true
                    instructionsLB.isHidden = true
                    highCardOne.text = "King Of Diamonds."
                    firstChoice.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                    cardSix.isHidden = true
                }
            }
            }else if level2{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Seven of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Seven of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level3{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Queen Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "queenHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Queen Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "queenHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Queen Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "queenHearts.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }
            else if level4{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Eight Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "eightSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Eight Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "eightSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Eight Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "eightSpades.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }
            else if level5{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Five Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "fiveDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Five Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "fiveDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Five Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "fiveDiamonds.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }
            else if level6{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Joker."
                        firstChoice.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Joker."
                        secondChoice.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Joker."
                        firstChoice.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level7{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Eight Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Eight Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Eight Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level8{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Five Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "fiveClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Five Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "fiveClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Five Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "fiveClubs.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level9{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "King Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "King Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "King Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level10{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "twoDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Two Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "twoDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Two Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "twoDiamonds.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level11{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Three Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Three Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Three Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level12{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Eight Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "eightHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Eight Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "eightHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Eight Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "eightHearts.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level13{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Seven Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Seven Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenSpades.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level14{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "King Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "King Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "King Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level15{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "twoDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Two Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "twoDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Two Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "twoDiamonds.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level16{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "King Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "King Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "King Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level17{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "King Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "King Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "King Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level18{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Eight Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "eightClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Eight Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "eightClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Eight Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "eightClubs.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level19{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ace Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "aceClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Ace Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "aceClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Ace Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "aceClubs.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }else if level20{
                if ( highCardTwo.text == ""){
                    cardSix.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Queen Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "queenSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Queen Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "queenSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Queen Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "queenSpades.png"), for: .normal)
                        cardSix.isHidden = true
                    }
                }
            }
                    
        case 7:
            if level1{
            if ( highCardTwo.text == ""){
                cardSeven.isHidden = true
                correct.isHidden = true
                incorrect.isHidden = true
                instructionsLB.isHidden = true
                if highCardOne.text == ""{
                    highCardOne.text = "King Of Hearts."
                    firstChoice.setBackgroundImage(UIImage(named: "kingHearts.png"), for: .normal)
                }else{
                    correct.isHidden = true
                    incorrect.isHidden = true
                    instructionsLB.isHidden = true
                    highCardTwo.text = "King Of Hearts."
                    secondChoice.setBackgroundImage(UIImage(named: "kingHearts.png"), for: .normal)
                }
            }else{
                if checkResult(){
                    correct.isHidden = true
                    incorrect.isHidden = true
                    instructionsLB.isHidden = true
                    highCardOne.text = "King Of Hearts."
                    firstChoice.setBackgroundImage(UIImage(named: "kingHearts.png"), for: .normal)
                    cardSeven.isHidden = true
                }
            }
            }else if level2{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Seven of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Seven of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level3{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Four Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "fourSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Four Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "fourSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Four Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "fourSpades.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level4{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "King Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "King Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "King Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }
            else if level5{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Seven Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Seven Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level6{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ten Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "tenDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Ten Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "tenDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Ten Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "tenDiamonds.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level7{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Three Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Three Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Three Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level8{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Seven Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Seven Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Seven Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level9{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "King Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "kingSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "King Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "kingSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "King Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "kingSpades.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level10{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Six Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "sixSpades.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Six Of Spades."
                        secondChoice.setBackgroundImage(UIImage(named: "sixSpades.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Six Of Spades."
                        firstChoice.setBackgroundImage(UIImage(named: "sixSpades.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level11{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Six Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "sixHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Six Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "sixHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Six Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "sixHearts.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level12{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Six Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Six Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Six Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level13{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Six Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Six Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Six Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level14{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ace Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "aceDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Ace Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "aceDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Ace Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "aceDiamonds.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level15{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Ace Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "aceDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Ace Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "aceDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Ace Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "aceDiamonds.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level16{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Eight Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardTwo.text = "Eight Of Diamonds."
                        secondChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        highCardOne.text = "Eight Of Diamonds."
                        firstChoice.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level17{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Three Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "threeClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Three Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "threeClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Three Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "threeClubs.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level18{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "King Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "King Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "King Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level19{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "King Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "King Of Clubs."
                        secondChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "King Of Clubs."
                        firstChoice.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
                }
            }else if level20{
                if ( highCardTwo.text == ""){
                    cardSeven.isHidden = true
                    correct.isHidden = true
                    incorrect.isHidden = true
                    aceHighLabel.isHidden = true
                    if highCardOne.text == ""{
                        highCardOne.text = "Two Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                    }else{
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardTwo.text = "Two Of Hearts."
                        secondChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                        
                    }
                }else{
                    if checkResult(){
                        correct.isHidden = true
                        incorrect.isHidden = true
                        aceHighLabel.isHidden = true
                        highCardOne.text = "Two Of Hearts."
                        firstChoice.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                        cardSeven.isHidden = true
                    }
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
            cardOne.isHidden = false
            cardTwo.isHidden = false
            cardThree.isHidden = false
            cardFour.isHidden = false
            cardFive.isHidden = false
            cardSix.isHidden = false
            cardSeven.isHidden = false
            firstChoice.setBackgroundImage(nil, for: .normal)
            secondChoice.setBackgroundImage(nil, for: .normal)
            return true
    }
    @IBAction func submitTapped(_ sender: Any) {
        if level1{
        if highCardOne.text == "King Of Hearts." && highCardTwo.text == "King Of Diamonds." || highCardOne.text == "King Of Diamonds." && highCardTwo.text == "King Of Hearts."   {
            cardSix.isHidden = false
            cardSeven.isHidden = false
            level1 = false
            level2 = true
            highCardOne.text = ""
            highCardTwo.text = ""
            cardOne.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
            cardTwo.setBackgroundImage(UIImage(named: "fiveClubs.png"), for: .normal)
            cardThree.setBackgroundImage(UIImage(named: "jackHearts.png"), for: .normal)
            cardFour.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
            cardFive.setBackgroundImage(UIImage(named: "nineSpades.png"), for: .normal)
            cardSix.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
            cardSeven.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
            firstChoice.setBackgroundImage(nil, for: .normal)
            secondChoice.setBackgroundImage(nil, for: .normal)
            correct.isHidden = false
            incorrect.isHidden = true
            instructionsLB.isHidden = true
            
        } else {
            firstChoice.setBackgroundImage(nil, for: .normal)
            secondChoice.setBackgroundImage(nil, for: .normal)
            highCardOne.text = ""
            highCardTwo.text = ""
            cardOne.isHidden = false
            cardTwo.isHidden = false
            cardThree.isHidden = false
            cardFour.isHidden = false
            cardFive.isHidden = false
            cardSix.isHidden = false
            cardSeven.isHidden = false
            firstChoice.setImage(nil, for: .normal)
            secondChoice.setImage(nil, for: .normal)
            incorrect.isHidden = false
            correct.isHidden = true
            instructionsLB.isHidden = true
            
        }
        } else if level2{
            if highCardOne.text == "Nine of Clubs." && highCardTwo.text == "Nine of Spades." || highCardOne.text == "Nine of Spades." &&
                highCardTwo.text == "Nine of Clubs."   {
                cardFour.isHidden = false
                cardFive.isHidden = false
                level2 = false
                level3 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "fourDiamonds.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "queenHearts.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "fourSpades.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }
        else if level3{
            if highCardOne.text == "Joker." && highCardTwo.text == "Queen Of Hearts." || highCardOne.text == "Queen Of Hearts." && highCardTwo.text == "Joker."   {
                cardOne.isHidden = false
                cardSix.isHidden = false
                level3 = false
                level4 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "tenClubs.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "eightHearts.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "fourDiamonds.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "threeDiamonds.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "eightSpades.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }
        else if level4{
            if highCardOne.text == "King Of Clubs." && highCardTwo.text == "Ten Of Clubs." || highCardOne.text == "Ten Of Clubs." && highCardTwo.text == "King Of Clubs."   {
                cardTwo.isHidden = false
                cardSeven.isHidden = false
                level4 = false
                level5 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "queenHearts.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "aceHearts.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "sixHearts.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "fiveDiamonds.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }
        else if level5{
            if highCardOne.text == "Ace Of Hearts." && highCardTwo.text == "Queen Of Hearts." || highCardOne.text == "Queen Of Hearts." && highCardTwo.text == "Ace Of Hearts."   {
                cardTwo.isHidden = false
                cardFour.isHidden = false
                level5 = false
                level6 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "aceHearts.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "jackClubs.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "tenDiamonds.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }
        else if level6{
            if highCardOne.text == "Joker." && highCardTwo.text == "Jack Of Clubs." || highCardOne.text == "Jack Of Clubs." && highCardTwo.text == "Joker." || highCardOne.text == "Ace Of Hearts." && highCardTwo.text == "Jack Of Clubs." || highCardOne.text == "Jack Of Clubs." && highCardTwo.text == "Ace Of Hearts." || highCardOne.text == "Ace Of Spades." && highCardTwo.text == "Jack Of Clubs." || highCardOne.text == "Jack Of Clubs." && highCardTwo.text == "Ace Of Spades." {
                cardOne.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardSix.isHidden = false
                level6 = false
                level7 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }else if level7{
            if highCardOne.text == "Nine Of Clubs." && highCardTwo.text == "Eight Of Diamonds." || highCardOne.text == "Eight Of Diamonds." && highCardTwo.text == "Nine Of Clubs." {
                cardFour.isHidden = false
                cardSix.isHidden = false
                level7 = false
                level8 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "fiveHearts.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "fiveClubs.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }else if level8{
            if highCardOne.text == "Jack Of Spades." && highCardTwo.text == "Jack Of Diamonds." || highCardOne.text == "Jack Of Diamonds." && highCardTwo.text == "Jack Of Spades." {
                cardTwo.isHidden = false
                cardThree.isHidden = false
                level8 = false
                level9 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "eightClubs.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "sixSpades.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "kingSpades.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }
        else if level9{
            if highCardOne.text == "Six Of Spades." && highCardTwo.text == "Six Of Clubs." || highCardOne.text == "Six Of Clubs." && highCardTwo.text == "Six Of Spades." {
                cardOne.isHidden = false
                cardFour.isHidden = false
                level9 = false
                level10 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "sixDiamonds.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "sixHearts.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "sixSpades.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }
        else if level10{
            if highCardOne.text == "Ace Of Spades." && highCardTwo.text == "King Of Clubs." || highCardOne.text == "King Of Clubs." && highCardTwo.text == "Ace Of Spades." {
                cardOne.isHidden = false
                cardThree.isHidden = false
                level10 = false
                level11 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "eightSpades.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "kingHearts.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "sixHearts.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }
        else if level11{
            if highCardOne.text == "Nine Of Clubs." && highCardTwo.text == "Jack Of Diamonds." || highCardOne.text == "Jack Of Diamonds." && highCardTwo.text == "Nine Of Clubs." {
                cardThree.isHidden = false
                cardFour.isHidden = false
                level11 = false
                level12 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "fiveSpades.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "threeClubs.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "eightHearts.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }
        else if level12{
            if highCardOne.text == "Jack Of Diamonds." && highCardTwo.text == "Eight Of Hearts." || highCardOne.text == "Eight Of Hearts." && highCardTwo.text == "Jack Of Diamonds." {
                cardFour.isHidden = false
                cardSix.isHidden = false
                level12 = false
                level13 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "threeHearts.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "threeClubs.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "threeDiamonds.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "sevenSpades.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "sixClubs.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }else if level13{
            if highCardOne.text == "Seven Of Diamonds." && highCardTwo.text == "Seven Of Hearts." || highCardOne.text == "Seven Of Hearts." && highCardTwo.text == "Seven Of Diamonds." || highCardOne.text == "Seven Of Hearts." && highCardTwo.text == "Seven Of Spades." || highCardOne.text == "Seven Of Spades." && highCardTwo.text == "Seven Of Hearts." || highCardOne.text == "Seven Of Diamonds." && highCardTwo.text == "Seven Of Spades." || highCardOne.text == "Seven Of Spades." && highCardTwo.text == "Seven Of Diamonds." {
                cardOne.isHidden = false
                cardThree.isHidden = false
                cardSix.isHidden = false
                level13 = false
                level14 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "twoSpades.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "sixDiamonds.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "aceDiamonds.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }else if level14{
            if highCardOne.text == "Two Of Spades." && highCardTwo.text == "Nine Of Clubs." || highCardOne.text == "Nine Of Clubs." && highCardTwo.text == "Two Of Spades." {
                cardOne.isHidden = false
                cardThree.isHidden = false
                level14 = false
                level15 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "twoSpades.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "jackDiamonds.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "twoDiamonds.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "aceDiamonds.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }else if level15{
            if highCardOne.text == "Jack Of Diamonds." && highCardTwo.text == "Ace Of Diamonds." || highCardOne.text == "Ace Of Diamonds." && highCardTwo.text == "Jack Of Diamonds." {
                cardFour.isHidden = false
                cardSeven.isHidden = false
                level15 = false
                level16 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "aceHearts.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "sixSpades.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "nineClubs.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "jackClubs.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }
        else if level16{
            if highCardOne.text == "King Of Diamonds." && highCardTwo.text == "Jack Of Clubs." || highCardOne.text == "Jack Of Clubs." && highCardTwo.text == "King Of Diamonds." {
                cardFive.isHidden = false
                cardSix.isHidden = false
                level16 = false
                level17 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                aceHighLabel.isHidden = false
                cardOne.setBackgroundImage(UIImage(named: "kingHearts.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "eightHearts.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "eightDiamonds.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "twoClubs.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "kingDiamonds.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "threeClubs.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }
        else if level17{
            if highCardOne.text == "Eight Of Hearts." && highCardTwo.text == "Eight Of Diamonds." || highCardOne.text == "Eight Of Diamonds." && highCardTwo.text == "Eight Of Hearts." {
                cardTwo.isHidden = false
                cardFour.isHidden = false
                level17 = false
                level18 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "sevenHearts.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "twoSpades.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "eightClubs.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }
        else if level18{
            if highCardOne.text == "King Of Clubs." && highCardTwo.text == "Eight Of Clubs." || highCardOne.text == "Eight Of Clubs." && highCardTwo.text == "King Of Clubs." {
                cardSix.isHidden = false
                cardSeven.isHidden = false
                level18 = false
                level19 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "tenSpades.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "tenHearts.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "fourHearts.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "sevenClubs.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "aceClubs.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "kingClubs.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }else if level19{
            if highCardOne.text == "Ten Of Spades." && highCardTwo.text == "Ten Of Hearts." || highCardOne.text == "Ten Of Hearts." && highCardTwo.text == "Ten Of Spades." {
                cardTwo.isHidden = false
                cardThree.isHidden = false
                level19 = false
                level20 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.setBackgroundImage(UIImage(named: "aceSpades.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "jackSpades.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "kingSpades.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "sevenDiamonds.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "tenSpades.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "queenSpades.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "twoHearts.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                correct.isHidden = false
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }else if level20{
            if highCardOne.text == "Seven Of Diamonds." && highCardTwo.text == "Two Of Hearts." || highCardOne.text == "Two Of Hearts." && highCardTwo.text == "Seven Of Diamonds." {
                cardFour.isHidden = false
                cardSeven.isHidden = false
                firstChoice.isHidden = true
                secondChoice.isHidden = true
                dogNormal.isHidden = false
                level19 = false
                level20 = true
                highCardOne.text = ""
                highCardTwo.text = ""
                /*cardOne.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                cardTwo.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                cardThree.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                cardFour.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                cardFive.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                cardSix.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                cardSeven.setBackgroundImage(UIImage(named: "joker.png"), for: .normal)
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)*/
                cardOne.isHidden = true
                cardTwo.isHidden = true
                cardThree.isHidden = true
                cardFour.isHidden = true
                cardFive.isHidden = true
                cardSix.isHidden = true
                cardSeven.isHidden = true
                practice.isHidden = false
                correct.isHidden = true
                incorrect.isHidden = true
                instructionsLB.isHidden = true
            }else{
                firstChoice.setBackgroundImage(nil, for: .normal)
                secondChoice.setBackgroundImage(nil, for: .normal)
                highCardOne.text = ""
                highCardTwo.text = ""
                cardOne.isHidden = false
                cardTwo.isHidden = false
                cardThree.isHidden = false
                cardFour.isHidden = false
                cardFive.isHidden = false
                cardSix.isHidden = false
                cardSeven.isHidden = false
                firstChoice.setImage(nil, for: .normal)
                secondChoice.setImage(nil, for: .normal)
                incorrect.isHidden = false
                correct.isHidden = true
                instructionsLB.isHidden = true
            }
        }
    }
}


