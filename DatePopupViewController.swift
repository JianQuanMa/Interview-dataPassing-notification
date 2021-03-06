//
//  DatePopupViewController.swift
//  Interview-dataPassing-Notification
//
//  Created by Jian Ma on 10/7/20.
//

import UIKit

class DatePopupViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    var shouldShowTimePicker = false
    weak var delegate: PopupDelegate?
    
    var onSave: ((_ data: String) -> ())?
    var formattedDate: String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: datePicker.date)
    }
    var formattedTime: String{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: datePicker.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("datePopupViewController being inited")
        if shouldShowTimePicker {
            titleLabel.text = "Select time"
            datePicker.datePickerMode = .time
            saveButton.setTitle("save time", for: .normal)
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: .saveDateTime, object: self)
        if shouldShowTimePicker{
            onSave?(formattedTime)
            delegate?.popupValueSelected(formattedTime)
        }else{
            onSave?(formattedDate)
            delegate?.popupValueSelected(formattedDate)
        }
        
        dismiss(animated: true) 
    }
    
    deinit{
        print("datePopupViewController being deinited")
    }
    
}
