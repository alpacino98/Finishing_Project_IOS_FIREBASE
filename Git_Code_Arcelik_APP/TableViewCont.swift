//
//  TableViewCont.swift
//  Arcelik_App
//
//  Created by AlpKumbasar on 3.05.2020.
//  Copyright © 2020 AlpKumbasar. All rights reserved.
//

import UIKit
import Firebase

class TableViewCont: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var foodTable: UITableView!
    var foodList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodTable.delegate = self
        foodTable.dataSource = self
        
        getDataFromFireStorm()
        
    }
    
    func getDataFromFireStorm(){
        let db = Firestore.firestore()
        
        let dataRef = db.collection("data").document("list")
        
        dataRef.getDocument { (doc, error) in
            if let document = doc, doc!.exists{
                if let hold = document.get("listArray"){
                    
                    for x in hold as! [String]{
                        self.foodList.append(x)
                    }
                    
                    self.foodTable.reloadData()
                }
                else{
                    self.makeAlert(titleInp: "Sorry!", messageInp: "No food list found!!!")
                }
            }
            

            else{
                self.makeAlert(titleInp: "Error!", messageInp: error?.localizedDescription ?? "Something went wrong. Check your internet connection and try again...")
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = foodList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(foodList.count)
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
     func makeAlert(titleInp: String, messageInp: String )
       {
                   let alert = UIAlertController(title: titleInp, message: messageInp, preferredStyle: UIAlertController.Style.alert)
                   let ok_but = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                   alert.addAction(ok_but)
                   self.present(alert, animated: true, completion: nil)
       }

}
