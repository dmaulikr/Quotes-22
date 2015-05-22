//
//  QuotesTableViewController.swift
//  Quotes
//
//  Created by Julian Grosshauser on 11/05/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit
import QuotesKit

class QuotesTableViewController: UITableViewController {

    //MARK: Properties

    private let viewModel = QuotesTableViewModel()
    private let cellIdentifier = "quoteCell"

    //MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(QuotesTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

//MARK: UITableViewDataSource

extension QuotesTableViewController: UITableViewDataSource {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.quotes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! QuotesTableViewCell

        let quote = viewModel.quotes[indexPath.row]
        cell.textLabel?.text = quote.quote
        cell.detailTextLabel?.text = quote.author

        return cell
    }
}
