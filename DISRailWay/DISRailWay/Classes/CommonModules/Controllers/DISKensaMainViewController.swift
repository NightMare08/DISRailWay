//
//  DISKensaMainViewController.swift
//  DISRailWay
//
//  Created by dis on 2017/10/23.
//  Copyright © 2017年 jp.co.disol. All rights reserved.
//

import UIKit

class DISKensaMainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Table view delegate
extension DISKensaMainViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DISLog(indexPath.row)
        switch indexPath.row {
        case 0:
            pushViewController(with: "DISDenshasenMainController")
        case 1:
            pushViewController(with: "DISDentoudenryokuMainController")
        case 2:
            pushViewController(with: "DISHendenMainController")
        case 3:
            pushViewController(with: "DISKakuusoudenMainController")
        case 4:
            pushViewController(with: "DISChichuusoudenMainController")
        case 5:
            pushViewController(with: "DISHendenKyuuMainController")
        case 6:
            pushViewController(with: "DISKakuusoudenMainController")
        case 7:
            pushViewController(with: "DISSuiryokuhatsudenMainController")
        default:
            break
        }
    }
    
    private func pushViewController(with nameOfStoryboard:String) {
        let sb = UIStoryboard(name: nameOfStoryboard, bundle: nil)
        let vc = sb.instantiateInitialViewController()!
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Table view data source
extension DISKensaMainViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DISSystemTitleArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DISKensaMainViewControllerCellName, for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = DISSystemTitleArray[indexPath.row]
        
        return cell
    }
    
    
}
