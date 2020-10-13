//
//  ViewController.swift
//  Interview-dataPassing-Notification
//
//  Created by Jian Ma on 10/7/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //set up the notification lstiener
        NotificationCenter.default.addObserver(self, selector: #selector(handlePopupClosing), name: .saveDateTime, object: nil)
    }

    //Mark: helper
    @objc func handlePopupClosing(_ notification: Notification){
        let dateVC = notification.object as! DatePopupViewController
        dateLabel.text = dateVC.formattedDate
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDatePopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.shouldShowTimePicker = false
        }
    }

}






