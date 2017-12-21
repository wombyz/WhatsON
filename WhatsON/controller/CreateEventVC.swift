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

class CreateEventVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var buttonPressed = false
    var imagePicker = UIImagePickerController()
    var myEvent: Event!

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typePicker.dataSource = self
        typePicker.delegate = self
        
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
        
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(image, animated: true, completion: nil)
        
        thumbImg.isHidden = false
        selectImgBtn.isHidden = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let theInfo: NSDictionary = info as NSDictionary
        let img: UIImage = theInfo.object(forKey: UIImagePickerControllerOriginalImage) as! UIImage
        
        thumbImg.image = img
        
        self .dismiss(animated: true, completion: nil)
    }
    
    func generateEventID() {
        let uuid = UUID().uuidString
        print(uuid)
        myEvent._eventId = uuid 
    }
    
    @IBAction func createBtnPressed(_ sender: UIButton) {
        generateEventID()
        print(myEvent._eventId)
    }
    
}

