//
//  QuotesServer.swift
//  QuotesKit
//
//  Created by Julian Grosshauser on 09/06/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

public struct QuotesServer {

    //MARK: Properties

    public let serverURL: NSURL
    public let quotesEndpoint = "quotes"

    //MARK: Initialization

    public init(serverURL: NSURL) {
        self.serverURL = serverURL
    }
}

public func + (lhs: NSURL, rhs: String) -> NSURL {
    return lhs.URLByAppendingPathComponent(rhs)
}
