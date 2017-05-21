//
//  HomeViewController.swift
//  DioGhvKeyboard
//
//  Created by silly on 19/03/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    var tableView: UITableView = UITableView()
    var guideCell: UITableViewCell = UITableViewCell()
    var basicSettingCell: UITableViewCell = UITableViewCell()
    var uiSettingCell: UITableViewCell = UITableViewCell()
    var proSettingCell: UITableViewCell = UITableViewCell()
    var praticeCell: UITableViewCell = UITableViewCell()
    var courseCell: UITableViewCell = UITableViewCell()
    var aboutUsCell: UITableViewCell = UITableViewCell()
    var thanksCell: UITableViewCell = UITableViewCell()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "潮语"
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        tableView = UITableView(frame: self.view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(red: 0.6, green: 0.9, blue: 0.9, alpha: 1)
        self.view.addSubview(tableView)
        
        guideCell.accessoryType = .disclosureIndicator
        basicSettingCell.accessoryType = .disclosureIndicator
        uiSettingCell.accessoryType = .disclosureIndicator
        proSettingCell.accessoryType = .disclosureIndicator
        praticeCell.accessoryType = .disclosureIndicator
        courseCell.accessoryType = .disclosureIndicator
        aboutUsCell.accessoryType = .disclosureIndicator
        thanksCell.accessoryType = .disclosureIndicator
        
        guideCell.textLabel?.text = "使用向导"
        basicSettingCell.textLabel?.text = "基础设置"
        uiSettingCell.textLabel?.text = "界面设置"
        proSettingCell.textLabel?.text = "高级设置"
        praticeCell.textLabel?.text = "练习"
        courseCell.textLabel?.text = "教程"
        thanksCell.textLabel?.text = "感谢"
        aboutUsCell.textLabel?.text = "关于"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 2
        case 3:
            return 2
        default:
            fatalError("Unknow Sections")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        // Hack ?
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return self.guideCell
            default:
                fatalError("Unknow Cell At Section 0")
            }
        case 1:
            switch indexPath.row {
            case 0:
                return self.courseCell
            case 1:
                return self.praticeCell
            default:
                fatalError("Unknow Cell At Section 1")
            }
        case 2:
            switch indexPath.row {
            case 0:
                return self.basicSettingCell
            case 1:
                return self.proSettingCell
            case 2:
                return self.uiSettingCell
            default:
                fatalError("Unknow Cell At Section 2")
            }
        case 3:
            switch indexPath.row {
            case 0:
                return self.thanksCell
            case 1:
                return self.aboutUsCell
            default:
                fatalError("Unknow Cell At Section 3")
            }
        default:
            fatalError("Unknow Section")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            let guideSB = UIStoryboard(name: "Guide", bundle: nil)
            let guideVC = guideSB.instantiateViewController(withIdentifier: "GuideView")
            self.show(guideVC, sender: self)
        case 1:
            switch indexPath.row {
            case 1:
                let praticeVC = PraticeViewController()
                self.show(praticeVC, sender: self)
            case 0:
                let courseVC = CourseViewController()
                self.show(courseVC, sender: self)
            default:
                fatalError("Unknow Cell At Section 1")
            }
        case 2:
            switch indexPath.row {
            case 0:
                let basicSettingVC = BasicSettingViewController()
                self.show(basicSettingVC, sender: self)
            case 1:
                let advanceSettingVC = AdvanceSettingViewController()
                self.show(advanceSettingVC, sender: self)
            case 2:
                let _ = "Donothing"
            default:
                fatalError("Unoknow Row At Section 2")
            }
        case 3:
            switch indexPath.row {
            case 0:
                let thanksSB = UIStoryboard(name: "Thanks", bundle: nil)
                let thanksVC = thanksSB.instantiateViewController(withIdentifier: "ThanksView")
                self.show(thanksVC, sender: self)
            case 1:
                let aboutUsSB = UIStoryboard(name: "AboutUs", bundle: nil)
                let aboutUsVC = aboutUsSB.instantiateViewController(withIdentifier: "AboutUsView")
                self.show(aboutUsVC, sender: self)
            default:
                fatalError("Unknow Cell At Section 3")
            }
        default:
            fatalError("Unknow Section")
        }
        
    }
    
}
