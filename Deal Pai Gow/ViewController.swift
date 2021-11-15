//
//  ViewController.swift
//  Ultimate Texas Holdem
//
//  Created by Aaron Fleming on 1/16/21.
//

import UIKit
import FirebaseFirestore
class ViewController: UIViewController {

 
    @IBOutlet weak var tap: UIImageView!
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var textFieldInput: UITextField!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var com: UIButton!
    
    var isSlideMenuHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldInput.returnKeyType = UIReturnKeyType.done
        textFieldInput.delegate = self
        
        tap.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        tap.addGestureRecognizer(tapGesture)
        
        sideMenuConstraint.constant = -250
    
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
      /*@IBAction func comButton(_ sender: Any) {
            if let url = NSURL(string: "http://dealtablegames.com"){
                UIApplication.shared.openURL(url as URL)
        }
    }*/
    
    @objc func tapGesture() {
        self.hideMenu()
    }
    
    @IBAction func actionSubmitInput(_ sender: UIButton) {
        schoolLabel.isHidden = true
        textFieldInput.isHidden = true
        submitButton.isHidden = true
        guard let userInput = self.textFieldInput.text?.trimmingCharacters(in: .whitespacesAndNewlines), userInput.count > 0 else {return}
 
        self.textFieldInput.resignFirstResponder()

      Firestore.firestore().collection("Pai Gow").addDocument(data: [

        "input":userInput,
        "date":Date()

      ]) {(error) in

            guard let error = error else {
                
                return
            }
        
            print("Error: \(error.localizedDescription)")
        }
         
        
    }
    
    @IBAction func actionHome(_ sender: UIButton) {
        
        self.menuButtonPressed(nil)
    }
    
    @IBAction func menuButtonPressed(_ sender: Any?) {
        
        if isSlideMenuHidden {
            
            self.showMenu()
        } else {
          
            self.hideMenu()
        }
 
        
    }
    
    private func showMenu(){
        
        isSlideMenuHidden = false
        sideMenuConstraint.constant = 0
        
        
        UIView.animate(withDuration: 0.4, animations: {
           
            self.view.layoutIfNeeded()
        })
        
    }
    private func hideMenu(){
        
        isSlideMenuHidden = true
        sideMenuConstraint.constant = -250
        
        UIView.animate(withDuration: 0.4) {
            
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.2)

        } completion: { (_) in
        
        }

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        self.hideMenu()
    }
    
}

extension UIViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
