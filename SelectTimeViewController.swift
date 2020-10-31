//
//  SelectTimeViewController.swift
//  Interview-dataPassing-Notification
//
//  Created by Jian Ma on 10/8/20.
//

import UIKit


class SelectTimeViewController: UIViewController{
    
    @IBOutlet weak var timeLabel: UILabel!
    var popup: DatePopupViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func selectTimeButtonTapped(_ sender: UIButton) {
    let sb = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        popup = (sb.instantiateInitialViewController()! as! DatePopupViewController)
        popup?.shouldShowTimePicker = true
        popup?.delegate = self
        self.present(popup!, animated: true)
    }
    deinit {
        print("select time viewController is being unloaded!")
    }
}

extension SelectTimeViewController: PopupDelegate{
    func popupValueSelected(_ value: String) {
        timeLabel.text = value
    }
}
