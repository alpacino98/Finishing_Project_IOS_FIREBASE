//
//  ViewController.swift
//  Arcelik_App
//
//  Created by AlpKumbasar on 2.05.2020.
//  Copyright © 2020 AlpKumbasar. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var email_text: UITextField!
    @IBOutlet weak var password_text: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        email_text.delegate = self
        password_text.delegate = self
    }

    @IBAction func signin_but(_ sender: Any) {
        if email_text.text != "" && password_text.text != ""{
            Auth.auth().signIn(withEmail: email_text.text!, password: password_text.text!) { (signData, error) in
                if error != nil{
                    self.makeAlert(titleInp: "Error!", messageInp: error?.localizedDescription ?? "Error!")
                }
                else{
                    self.performSegue(withIdentifier: "toHomePage", sender: nil)
                    
                }
            }
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn( _ textField : UITextField) -> Bool{
        textField.resignFirstResponder()
        return (true)
    }
    
    @IBAction func signup_but(_ sender: Any) {
        if email_text.text != "" && password_text.text != ""
        {
            Auth.auth().createUser(withEmail: email_text.text!, password: password_text.text!) { (authdata , error) in
                if error != nil{
                    self.makeAlert(titleInp: "Error!", messageInp: error?.localizedDescription ?? "Error!")
                }
                else{
                    //self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else{
            self.makeAlert(titleInp: "Error!!", messageInp: "You have entered password or e-mail empty, try again!")
             
        }
    }
    
    func makeAlert(titleInp: String, messageInp: String )
    {
                let alert = UIAlertController(title: titleInp, message: messageInp, preferredStyle: UIAlertController.Style.alert)
                let ok_but = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(ok_but)
                self.present(alert, animated: true, completion: nil)
    }

}

