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

        if quotes.count == 0 {
            fetchQuotes()
        }
    }

    convenience public init() {
        self.init(realm: Realm(), server: QuotesServer(serverURL: NSURL(string: "http://localhost:9393")!))
    }

    //MARK: Fetch Quotes

    private func fetchQuotes() {
        let session = NSURLSession.sharedSession()

        session.dataTaskWithURL(server.serverURL + server.quotesEndpoint) { data, response, error in
            if let error = error {
                println("Error - \(error.localizedDescription)")
            } else {
                let httpResponse = response as! NSHTTPURLResponse

                if httpResponse.statusCode == 200 {
                    var jsonError: NSError?

                    let quotesJSON: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: &jsonError)

                    if let quotesJSON = quotesJSON as? [[String: String]] {
                        var quotes = [Quote]()

                        for quoteJSON in quotesJSON {
                            if let quote = quoteJSON["quote"], let author = quoteJSON["author"] {
                                quotes.append(Quote(quote: quote, author: author))
                            }
                        }

                        dispatch_async(dispatch_get_main_queue()) {
                            self.realm.write {
                                self.realm.add(quotes)
                            }
                        }
                    }
                } else {
                    println("Error - HTTP Status Code \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
}
