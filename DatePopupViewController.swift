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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
