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
        //method 1: notification normal observer
//        NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
//            let dateVC = notification.object as! DatePopupViewController
//            self.dateLabel.text = dateVC.formattedDate
//        }
    }
    //method2: notification observer completion handler style
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        //new way
//        observer = NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
//            let dateVC = notification.object as! DatePopupViewController
//            self.dateLabel.text = dateVC.formattedDate
//        }
//    }
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        if let observer = observer {
//            NotificationCenter.default.removeObserver(observer)
//        }
//
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDatePopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.shouldShowTimePicker = false
            //assign to a func
            popup.onSave = onSave
        }
    }
    
    func onSave(_ data: String) -> (){
        dateLabel.text = data
    }
    
}
