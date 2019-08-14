//
//  BaseTableView.swift
//  POPTalk
//
//  Created by Maher Santina on 8/8/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

protocol BaseTableViewDataSource: AnyObject {
    
    func baseTableView(_ baseTableView: BaseTableView, numberOfRowsInSection section: Int) -> Int
    
    func baseTableViewCellTypeToRegister(_ baseTableView: BaseTableView) -> UITableViewCell.Type
    
    func baseTableView(_ baseTableView: BaseTableView, configureCell cell: UITableViewCell, at indexPath: IndexPath)

    func numberOfSections(in baseTableView: BaseTableView) -> Int
    
}

extension BaseTableViewDataSource {
    
    func numberOfSections(in baseTableView: BaseTableView) -> Int {
        return 1
    }
    
}

protocol BaseTableViewDelegate: AnyObject {
    func baseTableView(_ baseTableView: BaseTableView, didSelectRowAt indexPath: IndexPath)
}

class BaseTableView: MSAutoView {
    @IBOutlet weak var mainTableView: UITableView!
    
    weak var dataSource: BaseTableViewDataSource?
    weak var delegate: BaseTableViewDelegate?
    
    
    override func initView() {
        super.initView()
        mainTableView.estimatedRowHeight = 50
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }
    
    func reloadData() {
        if let cellType = dataSource?.baseTableViewCellTypeToRegister(self) {
            mainTableView.register(cellType, forCellReuseIdentifier: "Cell")
        }
        mainTableView.reloadData()
    }
}

extension BaseTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.numberOfSections(in: self) ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.baseTableView(self, numberOfRowsInSection: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        if let indexSettableCell = cell as? IndexSettable {
            indexSettableCell.indexPath = indexPath
        }
        dataSource?.baseTableView(self, configureCell: cell, at: indexPath)
        return cell
    }
}

extension BaseTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.baseTableView(self, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
