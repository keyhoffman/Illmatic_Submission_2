//
//  BaseTableViewController.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit

class DynamicTableViewController<Cell: UITableViewCell where Cell: Configurable>: UITableViewController {
    typealias DataType = Cell.DataType
    
    // MARK: - Cell Identifier Declaration
    
    private let cellIdentifier = String(Cell)
    
    // MARK: - Data Declaration
    
    var data: [DataType] = [] { didSet { tableView.reloadData() } }
    
    // MARK: - TableViewController Initializer
    
    init() { super.init(nibName: nil, bundle: nil) }
    
    // MARK: - TableViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(Cell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    // MARK: - TableViewDataSource Required Methods
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! Cell
        cell.configure(withItem: data[indexPath.row])
        return cell
    }
}
