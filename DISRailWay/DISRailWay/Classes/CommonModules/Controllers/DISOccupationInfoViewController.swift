//
//  DISOccupationInfoViewController.swift
//  DISRailWay
//
//  Created by dis on 2017/10/30.
//  Copyright © 2017年 jp.co.disol. All rights reserved.
//

import UIKit

/// 作業責任者選択肢の内容
/// 検査日 -> 0
/// 天候 -> 1
/// 気温 -> 2
/// 湿度 -> 3
/// 作業責任者 -> 4
enum OccupationInfoViewNameLocation: Int {
    case date = 0
    case weather = 1
    case temperature = 2
    case humidity = 3
    case employee = 4
}

// MARK: - global variables
let DISOccupationInfoNameArray = ["検査日", "天候", "気温", "湿度", "作業責任者"]
let DISOccupationWeatherArr = ["晴", "雲", "雨", "雪"]
let DISOccupationTemperatureArrange = 101
let DISOccupationHumidityArrange = 101
let DISOccupationEmployeeArray = ["DIS作業者01", "DIS作業者02", "DIS作業者03"]

class DISOccupationInfoViewController: UIViewController {
    
    @IBOutlet weak var occupationTableView: UITableView!

    @IBOutlet weak var pickerBackgroundView: UIView!
    
    weak var occupationPickerView: DISOccupationPickerView?
    
    var resultData: [String]?
    
    // MARK: - lazy loading
    lazy private var tempStrArr: [String] = {
        var StrArr = [String]()
        var index = -50
        while index < DISOccupationTemperatureArrange - 50 {
            StrArr.append("\(index)")
            index += 1
        }
        return StrArr
    }()
    
    lazy private var humStrArr: [String] = {
        var StrArr = [String]()
        var index = 0
        while index < DISOccupationTemperatureArrange {
            StrArr.append("\(index)")
            index += 1
        }
        return StrArr
    }()
    
    // MARK: - life time method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "DISOccupationInfoCell", bundle: nil)
        occupationTableView.register(nib, forCellReuseIdentifier: "DISOccupationInfoCell")
        
        occupationTableView.dataSource = self
        occupationTableView.delegate = self
        
        occupationPickerView = pickerBackgroundView.subviews.first as? DISOccupationPickerView
        occupationPickerView?.delegate = self
        
        occupationTableView.bounces = false
        occupationTableView.separatorStyle = .none
        
        
        occupationTableView.estimatedRowHeight = 44
        
        let pickerBackgroundTG = UITapGestureRecognizer(target: self, action: #selector(pickerBackgroundTapAction))
        pickerBackgroundView.addGestureRecognizer(pickerBackgroundTG)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pickerBackgroundView.isHidden = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OccupationInfoAction(_ sender: UIButton) {
        let mainStr = "OccupationMain"
        let mainSB = UIStoryboard(name: mainStr, bundle: nil)
        let mainVC = mainSB.instantiateInitialViewController()!
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
    
    @objc private func pickerBackgroundTapAction() {
        DISLog("tap action")
        
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

// MARK: - Table view data source
extension DISOccupationInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DISOccupationInfoNameArray.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DISOccupationInfoCell", for: indexPath) as! DISOccupationInfoCell
        cell.infoNameLabel.text = DISOccupationInfoNameArray[indexPath.row]
        switch indexPath.row {
        case 0:
            fallthrough
        case 4:
            cell.status = DISOccupationInfoCellStatus.required
            cell.resultLabel.text = DISOccupationInfoRequiredSelectedStr
            break
        case 1:
            fallthrough
        case 2:
            fallthrough
        case 3:
            cell.status = DISOccupationInfoCellStatus.none
            cell.resultLabel.text = DISOccupationInfoWaitedSelectedStr
            break
        default:
            break
        }
        guard let data = resultData else {
            return cell
        }
        cell.setResultLabel(with: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

// MARK: - Table view delegate
extension DISOccupationInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pickerBackgroundView.isHidden = false
        switch indexPath.row {
        case OccupationInfoViewNameLocation.date.rawValue:
            handlingDataForm(with: OccupationInfoViewNameLocation.date)
            break
        case OccupationInfoViewNameLocation.weather.rawValue:
            handlingDataForm(with: OccupationInfoViewNameLocation.weather)
            break
        case OccupationInfoViewNameLocation.temperature.rawValue:
            handlingDataForm(with: OccupationInfoViewNameLocation.temperature)
            break
        case OccupationInfoViewNameLocation.humidity.rawValue:
            handlingDataForm(with: OccupationInfoViewNameLocation.humidity)
            break
        case OccupationInfoViewNameLocation.employee.rawValue:
            handlingDataForm(with: OccupationInfoViewNameLocation.employee)
            break
        default:
            break
        }
    }
    
    private func handlingDataForm(with location:OccupationInfoViewNameLocation) {
        occupationPickerView?.pickerLocation = location
        switch location.rawValue {
        case 0:
            occupationPickerView?.datePicker.isHidden = false
            occupationPickerView?.picker.isHidden = true
            break
        case 1,2,3,4:
            occupationPickerView?.datePicker.isHidden = true
            occupationPickerView?.picker.isHidden = false
            break
        default:
            break
        }
        
        if location.rawValue == 1 {
            // 天候
            occupationPickerView?.dataSource = DISOccupationWeatherArr
            occupationPickerView?.picker.reloadAllComponents()
        }
        
        if location.rawValue == 2 {
            // 気温
            occupationPickerView?.dataSource = tempStrArr
            occupationPickerView?.picker.reloadAllComponents()
        }
        
        if location.rawValue == 3 {
            // 湿度
            occupationPickerView?.dataSource = humStrArr
            occupationPickerView?.picker.reloadAllComponents()
        }
        
        if location.rawValue == 4 {
            // 作業責任者
            occupationPickerView?.dataSource = DISOccupationEmployeeArray
            occupationPickerView?.picker.reloadAllComponents()
        }
        
    }
}

// MARK: - occupation picker view delegate
extension DISOccupationInfoViewController: DISOccupationPickerViewDelegate {
    func pickerViewDidClick(inputButton: UIButton, getSelectedData data: [String]) {
        DISLog("picker view click inputButton \(data.description)")
        resultData = data
        occupationTableView.reloadData()
        pickerBackgroundView.isHidden = true
    }
    
    func pickerViewDidClick(cancelButton: UIButton) {
        DISLog("picker view click cancelButton")
        pickerBackgroundView.isHidden = true
    }
}


