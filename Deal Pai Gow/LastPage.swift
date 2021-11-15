//
//  ViewController.swift
//  Ultimate Texas Holdem
//
//  Created by Aaron Fleming on 1/16/21.
//

import UIKit
import FirebaseFirestore
class LastPage: UIViewController {

 
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
        Constant.storyboardName = "LastPage"
        
        textFieldInput.returnKeyType = UIReturnKeyType.done
        textFieldInput.delegate = self
    
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    @IBAction func actionSubmitInput(_ sender: UIButton) {
        schoolLabel.isHidden = true
        textFieldInput.isHidden = true
        submitButton.isHidden = true
        guard let userInput = self.textFieldInput.text?.trimmingCharacters(in: .whitespacesAndNewlines), userInput.count > 0 else {return}
 
        self.textFieldInput.resignFirstResponder()

      Firestore.firestore().collection("Pai Gow").addDocument(data: [

        "email":userInput,
        "date":Date()

      ]) {(error) in

            guard let error = error else {
                
                return
            }
        
            print("Error: \(error.localizedDescription)")
        }
         
        
    }
    
}

/*extension UIViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}*/
