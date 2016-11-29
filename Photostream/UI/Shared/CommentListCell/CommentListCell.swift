//
//  CommentListCell.swift
//  Photostream
//
//  Created by Mounir Ybanez on 29/11/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit
import Kingfisher

class CommentListCell: UITableViewCell {

    var authorPhoto: UIImageView!
    var authorLabel: UILabel!
    var contentLabel: UILabel!
    var timeLabel: UILabel!
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: "CommentListCell")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CommentListCell.reuseId)
        initSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSetup()
    }
    
    func initSetup() {
        authorPhoto = UIImageView()
        authorLabel = UILabel()
        contentLabel = UILabel()
        timeLabel = UILabel()
        
        contentView.addSubview(authorPhoto)
        contentView.addSubview(authorLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(timeLabel)
    }
    
    override func layoutSubviews() {
        var frame = CGRect(x: spacing, y: spacing, width: photoLength, height: photoLength)
        authorPhoto.frame = frame
        
        frame.origin.x = photoLength + (spacing * 2)
        frame.origin.y = spacing
        frame.size.width = contentSize.width - frame.origin.x - spacing
        frame.size.height = labelHeight
        authorLabel.frame = frame
        
        frame.origin.y = labelHeight + (spacing * 2)
        contentLabel.frame = frame
        
        frame.origin.y = (labelHeight * 2) + (spacing * 3)
        timeLabel.frame = frame
    }
}

extension CommentListCell {
    
    static var reuseId: String {
        return "CommentListCell"
    }
    
    var spacing: CGFloat {
        return 4
    }
    
    var photoLength: CGFloat {
        return 32
    }
    
    var contentSize: CGSize {
        return contentView.bounds.size
    }
    
    var labelHeight: CGFloat {
        return 32
    }
}

extension CommentListCell {
    
    class func dequeue(from view: UITableView) -> CommentListCell? {
        return view.dequeueReusableCell(withIdentifier: CommentListCell.reuseId) as? CommentListCell
    }
    
    class func register(in view: UITableView) {
        view.register(CommentListCell.self, forCellReuseIdentifier: CommentListCell.reuseId)
    }
}