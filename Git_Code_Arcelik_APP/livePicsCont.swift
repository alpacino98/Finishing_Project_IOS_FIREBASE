//
//  livePicsCont.swift
//  Arcelik_App
//
//  Created by AlpKumbasar on 3.05.2020.
//  Copyright © 2020 AlpKumbasar. All rights reserved.
//

import UIKit
import Firebase

class livePicsCont: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var fridge_img: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    let segment_arr = ["1st Shelf", "2nd Shelf", "3rd Shelf"]
    var segment_selected = "1st Shelf"
    var dir = "left"
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    //var images = [UIImage]()
    let storage = Storage.storage()
    let picLabels = ["asagi_sag.jpg", "asagi_sol.jpg", "cover_alt.jpg", "cover_orta.jpg", "cover_ust.jpg", "orta_sag.jpg", "orta_sol.jpg", "yukari_sag.jpg", "yukari_sol.jpg"]
    var path = ""
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return segment_arr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return segment_arr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        segment_selected = segment_arr[row]
    }
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
        label.text = "Please Select a Shelf to View"
        //fridge_img.image = UIImage(named: "ArcelikLogo")
        
    
        
        /*
        for x in picLabels{
           
        }
        
        print(images.count)
        */
       }
    
    @IBAction func lefClicked(_ sender: Any) {
        dir = "left"
        showImg()
    }
    
    @IBAction func libClicked(_ sender: Any) {
        dir = "cover"
        showImg()
    }
    
    @IBAction func rightClicked(_ sender: Any) {
        dir = "right"
        showImg()
    }
    
    @IBAction func segment_clicked(_ sender: Any) {
        picker = UIPickerView.init()
        picker.delegate = self
        picker.backgroundColor = UIColor.white
        picker.setValue(UIColor.black, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)

        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .black
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
    }
    
    @objc func onDoneButtonTapped() {
        var row = 0
        row = picker.selectedRow(inComponent: 0)
        segment_selected = segment_arr[row]
        dir = "left"
        label.text = segment_selected + "/Left is selected..."
        showImg()
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    
    func showImg(){
        if segment_selected == "1st Shelf"{
            if dir == "left"{
                let storageRef = storage.reference()
                path = "images/" + picLabels[8]
                let picRef = storageRef.child(path)
                 picRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                     if error != nil{
                         self.makeAlert(titleInp: "Error", messageInp: "Check yur internet connection and try again...")
                     }
                     else{
                         self.fridge_img.image = ((UIImage(data:data!) ?? UIImage(named: "ArcelikLogo.jpg"))!)
                     }
                 }
                label.text = segment_selected + "/Left is selected..."
            }
            else if dir == "right"{
                let storageRef = storage.reference()
                path = "images/" + picLabels[7]
                let picRef = storageRef.child(path)
                 picRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                     if error != nil{
                         self.makeAlert(titleInp: "Error", messageInp: "Check yur internet connection and try again...")
                     }
                     else{
                         self.fridge_img.image = ((UIImage(data:data!) ?? UIImage(named: "ArcelikLogo.jpg"))!)
                     }
                 }
                label.text = segment_selected + "/Right is selected..."
            }
            else{
                let storageRef = storage.reference()
                path = "images/" + picLabels[4]
                let picRef = storageRef.child(path)
                 picRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                     if error != nil{
                         self.makeAlert(titleInp: "Error", messageInp: "Check yur internet connection and try again...")
                     }
                     else{
                         self.fridge_img.image = ((UIImage(data:data!) ?? UIImage(named: "ArcelikLogo.jpg"))!)
                     }
                 }
                label.text = segment_selected + "/Lid is selected..."
            }
        }
        else if segment_selected == "2nd Shelf"{
            if dir == "left"{
                let storageRef = storage.reference()
                path = "images/" + picLabels[6]
                let picRef = storageRef.child(path)
                 picRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                     if error != nil{
                         self.makeAlert(titleInp: "Error", messageInp: "Check yur internet connection and try again...")
                     }
                     else{
                         self.fridge_img.image = ((UIImage(data:data!) ?? UIImage(named: "ArcelikLogo.jpg"))!)
                     }
                 }
                label.text = segment_selected + "/Left is selected..."
            }
            else if dir == "right"{
                let storageRef = storage.reference()
                path = "images/" + picLabels[5]
                let picRef = storageRef.child(path)
                 picRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                     if error != nil{
                         self.makeAlert(titleInp: "Error", messageInp: "Check yur internet connection and try again...")
                     }
                     else{
                         self.fridge_img.image = ((UIImage(data:data!) ?? UIImage(named: "ArcelikLogo.jpg"))!)
                     }
                 }
                label.text = segment_selected + "/Right is selected..."
            }
            else{
                let storageRef = storage.reference()
                path = "images/" + picLabels[3]
                let picRef = storageRef.child(path)
                 picRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                     if error != nil{
                         self.makeAlert(titleInp: "Error", messageInp: "Check yur internet connection and try again...")
                     }
                     else{
                         self.fridge_img.image = ((UIImage(data:data!) ?? UIImage(named: "ArcelikLogo.jpg"))!)
                     }
                 }
                label.text = segment_selected + "/Lid is selected..."
            }
        }
        else{
            if dir == "left"{
                let storageRef = storage.reference()
                path = "images/" + picLabels[1]
                let picRef = storageRef.child(path)
                 picRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                     if error != nil{
                         self.makeAlert(titleInp: "Error", messageInp: "Check yur internet connection and try again...")
                     }
                     else{
                         self.fridge_img.image = ((UIImage(data:data!) ?? UIImage(named: "ArcelikLogo.jpg"))!)
                     }
                 }
                label.text = segment_selected + "/Left is selected..."
            }
            else if dir == "right"{
                let storageRef = storage.reference()
                path = "images/" + picLabels[0]
                let picRef = storageRef.child(path)
                 picRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                     if error != nil{
                         self.makeAlert(titleInp: "Error", messageInp: "Check yur internet connection and try again...")
                     }
                     else{
                         self.fridge_img.image = ((UIImage(data:data!) ?? UIImage(named: "ArcelikLogo.jpg"))!)
                     }
                 }
                label.text = segment_selected + "/Right is selected..."
            }
            else{
                let storageRef = storage.reference()
                path = "images/" + picLabels[2]
                let picRef = storageRef.child(path)
                 picRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                     if error != nil{
                         self.makeAlert(titleInp: "Error", messageInp: "Check yur internet connection and try again...")
                     }
                     else{
                         self.fridge_img.image = ((UIImage(data:data!) ?? UIImage(named: "ArcelikLogo.jpg"))!)
                     }
                 }
                label.text = segment_selected + "/Lid is selected..."
            }
        }
    }
    
    func makeAlert(titleInp: String, messageInp: String )
    {
                let alert = UIAlertController(title: titleInp, message: messageInp, preferredStyle: UIAlertController.Style.alert)
                let ok_but = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(ok_but)
                self.present(alert, animated: true, completion: nil)
    }
    
    func getPic(dir : String, segment: String) -> UIImage{
        return UIImage(named: "ArcelikLogo.jpg")!
    }
    
}
