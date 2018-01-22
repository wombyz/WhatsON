//
//  CreateEventVC.swift
//  WhatsON
//
//  Created by Liam Ottley on 15/12/17.
//  Copyright © 2017 Liam Ottley. All rights reserved.
//

import UIKit
import PhotosUI
import Photos
import NotificationCenter

class CreateEventVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate, UITextFieldDelegate {

    var Events = [Event]()
    var buttonPressed = false
    var imagePicker = UIImagePickerController()
    var myEvent: Event!
    var eID = 0

    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var eventNameLbl: UITextView!
    @IBOutlet weak var descLbl: UITextView!
    @IBOutlet weak var ageRangeLbl: UITextField!
    @IBOutlet weak var suburbLbl: UITextField!
    @IBOutlet weak var eventTypeBtn: UIButton!
    @IBOutlet weak var genderBtn: UIButton!
    @IBOutlet weak var ageRange: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var suburb: UILabel!
    @IBOutlet weak var eventType: UILabel!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var selectImgBtn: UIButton!
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var addressLbl: UITextField!
    @IBOutlet weak var address: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typePicker.dataSource = self
        typePicker.delegate = self
        thumbImg.layer.cornerRadius = thumbImg.frame.size.width/2
        thumbImg.clipsToBounds = true
        descLbl.delegate = self
        ageRangeLbl.delegate = self
        suburbLbl.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(CreateEventVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CreateEventVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func hideOrRemoveFieldsForPickerView() {
        // if the picker view is there, hide all others
        if typePicker.isHidden == false {
            eventTypeBtn.isHidden = true
            genderBtn.isHidden = true
            suburbLbl.isHidden = true
            ageRangeLbl.isHidden = true
            ageRange.isHidden = true
            gender.isHidden = true
            suburb.isHidden = true
            eventType.isHidden = true
            createBtn.isHidden = true
            cancelBtn.isHidden = true
            addressLbl.isHidden = true
            address.isHidden = true
        } else {
            eventTypeBtn.isHidden = false
            genderBtn.isHidden = false
            suburbLbl.isHidden = false
            ageRangeLbl.isHidden = false
            ageRange.isHidden = false
            gender.isHidden = false
            suburb.isHidden = false
            eventType.isHidden = false
            createBtn.isHidden = false
            cancelBtn.isHidden = false
            addressLbl.isHidden = false
            address.isHidden = false

        }
        
    }
    
    @IBAction func genTypePickerBtnPressed(sender: AnyObject) {
        typePicker.isHidden = false
        hideOrRemoveFieldsForPickerView()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) ->Int{
        
        if buttonPressed == true {
            return genders.count
        } else if buttonPressed == false {
            return eventTypes.count
        } else {
            return 1
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if buttonPressed == true {
            return genders[row]
        } else if buttonPressed == false {
            return eventTypes[row]
        } else {
            return "nil"
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if buttonPressed == true {
            genderBtn.isHidden = false
            genderBtn.setTitle("\(genders[row])", for: .normal)
            typePicker.isHidden = true
            
        } else if buttonPressed == false {
            eventTypeBtn.isHidden = false
            eventTypeBtn.setTitle("\(eventTypes[row])", for: .normal)
            typePicker.isHidden = true
        }
        hideOrRemoveFieldsForPickerView()
        print(buttonPressed)
    }


    @IBAction func genderButtonPressed(_ sender: UIButton) {
        typePicker.isHidden = false
        buttonPressed = true
        hideOrRemoveFieldsForPickerView()
        print(buttonPressed)
    }
    
    @IBAction func eventTypeButtonPressed(_ sender: UIButton) {
        typePicker.isHidden = false
        buttonPressed = false
        hideOrRemoveFieldsForPickerView()
        print(buttonPressed)
    }
    

    @IBAction func selectImagePressed(_ sender: UIButton) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(image, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let theInfo: NSDictionary = info as NSDictionary
        let img: UIImage = theInfo.object(forKey: UIImagePickerControllerOriginalImage) as! UIImage
        
        thumbImg.image = img
        
        self .dismiss(animated: true, completion: nil)
        thumbImg.isHidden = false
        selectImgBtn.isHidden = true
//        selectImgBtn.alpha = 0.0
    }
    
    func generateEventID() {
//        let newEID = eID += 1
//        print(newEID)
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        ageRangeLbl.resignFirstResponder()
        suburbLbl.resignFirstResponder()
        addressLbl.resignFirstResponder()
        return true
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
        self.view.frame.origin.y = 0
    }
    
    @IBAction func createBtnPressed(_ sender: UIButton){
    //Events.append(myEvent)
//        myEvent._title = eventNameLbl.text
//        myEvent._description = descLbl.text
//        myEvent._ageRange = ageRangeLbl.text
//        myEvent._suburb = suburbLbl.text
//        myEvent._eventType = eventTypeBtn.title(for: .normal)
//        myEvent._gender = genderBtn.title(for: .normal)
//        myEvent._thumb = thumbImg.image
//
//        print(myEvent._title)
//        print(myEvent._description)
//        print(myEvent._ageRange)
//        print(myEvent._suburb)
//        print(myEvent._eventType)
//        print(myEvent._gender)
    }
} 
    


