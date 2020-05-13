//
//  ProfileCont.swift
//  Arcelik_App
//
//  Created by AlpKumbasar on 3.05.2020.
//  Copyright © 2020 AlpKumbasar. All rights reserved.
//

import UIKit
import Firebase

class ProfileCont: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logOutClicked(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "LogOutClick", sender: nil)
        }catch{
            self.makeAlert(titleInp: "Error", messageInp: "Cannot logout. Please try again later making sure you have internet...")
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
