//
//  SecondViewController.swift
//  Interview-dataPassing-Notification
//
//  Created by Jian Ma on 10/13/20.
//

import UIKit

class SecondViewController: UIViewController{
    @IBOutlet weak var dateLabel: UILabel!
    var observer: NSObjectProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
//        NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
//            let dateVC = notification.object as! DatePopupViewController
//            self.dateLabel.text = dateVC.formattedDate
//        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //new way
        observer = NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
            let dateVC = notification.object as! DatePopupViewController
            self.dateLabel.text = dateVC.formattedDate
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
        
    }
    
}
