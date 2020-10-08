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
        guard let popup = sb.instantiateInitialViewController() else {return}
        self.present(popup, animated: true)
    
    }
    
}
