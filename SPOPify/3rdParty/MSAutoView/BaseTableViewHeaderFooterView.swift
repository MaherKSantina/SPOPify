//
//  BaseTableViewHeaderFooterView.swift
//  Volt Labs
//
//  Created by Maher Santina on 31/7/19.
//  Copyright © 2019 Frollo. All rights reserved.
//

import UIKit

class BaseTableViewHeaderFooterView<SubView: UIView>: UITableViewHeaderFooterView {
    var mainView: SubView? {
        didSet {
            guard let mainView = mainView else {
                return
            }
            addSubviewWithConstraints(mainView)
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addMainView()
    }
    
    func addMainView(_ mainView: SubView? = nil) {
        self.mainView?.removeFromSuperview()
        self.mainView = mainView ?? SubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addMainView()
    }
    
}
