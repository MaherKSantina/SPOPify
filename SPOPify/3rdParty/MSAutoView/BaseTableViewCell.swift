//
//  BaseTableViewCell.swift
//  Volt Labs
//
//  Created by Maher Santina on 31/7/19.
//  Copyright © 2019 Frollo. All rights reserved.
//

import UIKit

protocol IndexSettable: AnyObject {
    var indexPath: IndexPath? { set get }
}

class BaseTableViewCell<SubView: MSAutoView>: UITableViewCell, IndexSettable {
    
    var indexPath: IndexPath?
    
    var mainView: SubView? {
        didSet {
            guard let mainView = mainView else {
                return
            }
            addSubviewWithConstraints(mainView)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addMainView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addMainView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mainView?.prepareForReuse()
    }
    
    func addMainView(_ mainView: SubView? = nil) {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        self.mainView?.removeFromSuperview()
        self.mainView = mainView ?? SubView()
        self.mainView?.tableViewCell = self
    }
    
}
