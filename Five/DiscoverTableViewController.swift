//
//  DiscoverTableViewController.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

final class DiscoverTableViewController: DynamicTableViewController<EventTableViewCell>, DiscoverViewModelViewDelegate {
    
    private var hosts: [User] = []
    private var hostProfilePicImageData: [NSData] = []
    
    private let cellIdentifier = String(EventTableViewCell)
    
    var viewModel: DiscoverViewModelType? {
        didSet { viewModel?.viewDelegate = self }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DiscoverTableViewControllerStyleSheet.Prepare(self)
    }
    
    func appendEvent(event: Event) {
        data.append(event)
    }
    
    func appendHost(user: User) {
        hosts.append(user)
    }
    
    func appendHostProfileImageData(data: NSData) {
        hostProfilePicImageData.append(data)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventTableViewCell
        
        let row = indexPath.row
        
        cell.configure(withItem: data[row])
        cell.host = hosts[row]
        cell.hostProfileImageData = hostProfilePicImageData[row]
        return cell
    }
}