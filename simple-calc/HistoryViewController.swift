//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by Daniel Gil Chávez on 12/9/16.
//  Copyright © 2016 Daniel Gil Chavez. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController : UIViewController {
    var history = [String]()
    @IBOutlet weak var historyList: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("It got here")
        print(history)
        var y = 0
        for calculation in history {
            let label = UILabel()
            label.frame = CGRect(x: 20, y: y, width: 200, height: 50)
            label.text = calculation
            label.textAlignment = NSTextAlignment.center
            label.numberOfLines = 0
            label.backgroundColor = UIColor.cyan
            print(label.text!)
            historyList.addSubview(label)
            y += 60
        }
        self.historyList.contentSize = CGSize(width: 240, height: 1000)
        self.historyList.backgroundColor = UIColor.black
    }
}
