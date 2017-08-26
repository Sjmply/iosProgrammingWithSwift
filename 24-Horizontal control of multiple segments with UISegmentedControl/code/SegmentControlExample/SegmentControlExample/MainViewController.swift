//
//  MainViewController.swift
//  SegmentControlExample
//
//  Created by Nguyen Duc Hoang on 8/26/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var lblState: UILabel?
    @IBOutlet weak var segment: UISegmentedControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        segment?.isMomentary = true
        segment?.setDividerImage(#imageLiteral(resourceName: "icon-divider-red"), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
        segment?.setDividerImage(#imageLiteral(resourceName: "icon-divider-yellow"), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        segment?.setDividerImage(#imageLiteral(resourceName: "icon-divider-blue"), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    @IBAction func segmentedValueChanged(sender: UISegmentedControl) {
        lblState?.text = "You selected: \(sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "")"
    }
    
}
