//
//  ViewController.swift
//  Interview-dataPassing-Notification
//
//  Created by Jian Ma on 10/7/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    //first option to break retain cycle, just add weak to observer
    var observer: NSObjectProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        //old way
        //the commented method is the first notification observer method completed by a selector method, as supposed what we have now, the completion handler style
        //set up the notification lstiener
     //   NotificationCenter.default.addObserver(self, selector: #selector(handlePopupClosing), name: .saveDateTime, object: nil)
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //new way
        // second option to break retain cycle: making observer's closure 's refernece to self weak
        observer = NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { [weak self]  (notification) in
            let dateVC = notification.object as! DatePopupViewController
            self!.dateLabel.text = dateVC.formattedDate
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }

    }
    
    @IBAction func programaticWayToPupOp(_ sender: UIButton) {
        let sb = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        let popup = sb.instantiateInitialViewController()! as! DatePopupViewController
        self.present(popup, animated: true)
    }

    //Mark: helper
//    @objc func handlePopupClosing(_ notification: Notification){
//        let dateVC = notification.object as! DatePopupViewController
//        dateLabel.text = dateVC.formattedDate
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDatePopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.shouldShowTimePicker = false
        }
    }
    
    deinit{
            print("NotificationViewController is being deinited")
    }

}






