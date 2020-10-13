//
//  SecondViewController.swift
//  Interview-dataPassing-Notification
//
//  Created by Jian Ma on 10/13/20.
//

import UIKit

class SecondViewController: UIViewController{
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
            let dateVC = notification.object as! DatePopupViewController
            self.dateLabel.text = dateVC.formattedDate
        }
    }
    
}
