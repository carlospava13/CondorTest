//
//  Source.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import UIKit

class Source<Cell: BaseTableViewCell>: NSObject, UITableViewDataSource, UITableViewDelegate {

    var identifier:String?
    var delegate: BaseProtocol?
    var items:[Any]?
    init(identifier:String) {
        self.identifier = identifier
    }

    func setData(data:[Any], delegate:BaseProtocol) {
        self.items = data
        self.delegate = delegate
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier!, for: indexPath) as! Cell
        cell.setData(data: self.items![indexPath.row], delegate: self.delegate!)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

