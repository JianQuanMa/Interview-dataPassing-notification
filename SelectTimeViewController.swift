//
//  SelectTimeViewController.swift
//  Interview-dataPassing-Notification
//
//  Created by Jian Ma on 10/8/20.
//

import UIKit


class SelectTimeViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func selectTimeButtonTapped(_ sender: UIButton) {
    let sb = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        let popup = (sb.instantiateInitialViewController()! as! DatePopupViewController)
        popup.shouldShowTimePicker = true
        self.present(popup, animated: true)
    }
}
