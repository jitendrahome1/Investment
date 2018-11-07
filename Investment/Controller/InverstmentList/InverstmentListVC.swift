//
//  InverstmentListVC.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 02/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class InverstmentListVC: BaseViewController {
    
    @IBOutlet weak var tblInverstment: UITableView!
    private var dataModel: InverstmentViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.cellConfiguration()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.build()
    }
    override func setupUI() {
        navTitles = INVESTMENT_TITLE
        self.dataModel = InverstmentViewModel()
        self.hideNavigationBar(false)
    }
    override func build() {
      self.isMenuIcone = true
    }
}

extension InverstmentListVC {

    private func cellConfiguration() {
        tblInverstment.register(UINib.init(nibName: "InvestmentCell", bundle: nil), forCellReuseIdentifier: "InvestmentCell")
    }
}

// MARK:- TableView Delegte and DataScource
extension InverstmentListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataModel!.numberOfItems.count
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvestmentCell") as! InvestmentCell
        
        cell.lblFolderTitle.text = dataModel!.numberOfItems[indexPath.item]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return CGFloat(dataModel!.cellHieght)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(storyboard: .main).instantiateViewController(withIdentifier: "InvestmentDetailsVC") as! InvestmentDetailsVC
        let title = dataModel!.numberOfItems[indexPath.row]
        vc._title =  title
        NavigationHelper.helper.navController.pushViewController(vc, animated: true)
    }
}


