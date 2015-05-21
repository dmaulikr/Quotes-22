//
//  QuotesTableViewController.swift
//  Quotes
//
//  Created by Julian Grosshauser on 11/05/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit
import QuotesKit
import RealmSwift

class QuotesTableViewController: UITableViewController {

    //MARK: Properties

    private let realm: Realm
    private var quotes: Results<Quote>
    private let cellIdentifier = "quoteCell"

    //MARK: Initialization

    init(realm: Realm) {
        self.realm = realm
        quotes = realm.objects(Quote)

        super.init(nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder!) {
        realm = Realm()
        quotes = realm.objects(Quote)

        super.init(coder: aDecoder)
    }

    //MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(QuotesTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

//MARK: UITableViewDataSource

extension QuotesTableViewController: UITableViewDataSource {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
}
