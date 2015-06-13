//
//  QuotesTableViewModel.swift
//  Quotes
//
//  Created by Julian Grosshauser on 22/05/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import RealmSwift

public class QuotesTableViewModel {

    //MARK: Properties

    private let realm: Realm
    private let server: QuotesServer
    private(set) public var quotes: Results<Quote>

    //MARK: Initialization

    public init(realm: Realm, server: QuotesServer) {
        self.realm = realm
        self.server = server
        quotes = realm.objects(Quote)
    }

    convenience public init() {
        self.init(realm: Realm(), server: QuotesServer(serverURL: NSURL(string: "http://localhost:9393")!))
    }
}
