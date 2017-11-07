//
//  DISEntryTabbarController.swift
//  DISRailWay
//
//  Created by dis on 2017/10/23.
//  Copyright © 2017年 jp.co.disol. All rights reserved.
//

import UIKit

class DISEntryTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DISLog(NSStringFromClass(DISEntryTabbarController.self))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DISEntryTabbarController : UITabBarControllerDelegate {
    
}
