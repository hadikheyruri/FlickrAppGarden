//
//  ImageTableViewContainer.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import UIKit

final class ImageTableViewContainer: UIView {
    
    var tableView: PullableTableView = PullableTableView()
    
    init() {
        
        super.init(frame: .zero)
        self.configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        
        self.addSubview(self.tableView)
        
        self.tableView.register(ImageTableCell.self, forCellReuseIdentifier: ImageTableCell.reuseIdentifier)
        self.tableView.backgroundColor = .clear
        self.tableView.rowHeight = 280
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
