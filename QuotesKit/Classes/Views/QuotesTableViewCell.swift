//
//  QuotesTableViewCell.swift
//  QuotesKit
//
//  Created by Julian Grosshauser on 18/05/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

public class QuotesTableViewCell: UITableViewCell {

    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
    }

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
