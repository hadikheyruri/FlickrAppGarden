//
//  PullableTableView.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-28.
//

import UIKit

protocol PullableTableViewDelegate: UITableViewDelegate {
    func pullToRefreshDataSource()
}

final class PullableTableView: UITableView {
    
    // MARK: - Properties

    private var decelFlag: Bool = false
    private let notificationFeedbackGenerator = UIImpactFeedbackGenerator()
    
    private var trigger: CGFloat {
        return (self.bounds.height / 4) + 30
    }
    
    // MARK: - Override

    public override var contentOffset: CGPoint {
        
        didSet {
            if -1 * self.contentOffset.y > self.trigger {
                if self.decelFlag == false && self.isDecelerating == true {
                    self.notificationFeedbackGenerator.impactOccurred(intensity: 0.9)
                    (self.delegate as? PullableTableViewDelegate)?.pullToRefreshDataSource()
                }
            }
            self.decelFlag = self.isDecelerating
        }
    }
}

