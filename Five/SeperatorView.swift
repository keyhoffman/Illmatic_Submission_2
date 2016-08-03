//
//  SeperatorView.swift
//  Five
//
//  Created by Key Hoffman on 7/30/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit

final class SeperatorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Color.FiveGray.color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has nt been implemented")
    }
}
