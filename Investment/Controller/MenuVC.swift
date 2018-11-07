//
//  MenuVC.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 02/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class MenuVC: BaseViewController {

    @IBOutlet weak var tblMenu: UITableView!
    fileprivate var dataModel: MenuViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.build()
          cellConfiguration()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func setupUI() {
        
    }
    override func build() {
      dataModel =  MenuViewModel()
    }
}

extension MenuVC {
  
    private func cellConfiguration() {
        tblMenu.register(UINib.init(nibName: "MenuListCell", bundle: nil), forCellReuseIdentifier: "MenuListCell")
    }
}



// MARK:- TableView Delegte and DataScource
extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataModel.numberOfItems.count
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuListCell") as! MenuListCell
         cell.lblTitle.text = dataModel.numberOfItems[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.panel?.openCenter(animated: false)
        self.panel?.closeLeft()
    }
}
