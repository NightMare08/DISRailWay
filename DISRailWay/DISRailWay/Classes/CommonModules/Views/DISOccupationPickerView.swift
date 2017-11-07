//
//  DISOccupationPickerView.swift
//  DISRailWay
//
//  Created by dis on 2017/11/01.
//  Copyright © 2017年 jp.co.disol. All rights reserved.
//

import UIKit

@objc protocol DISOccupationPickerViewDelegate: NSObjectProtocol {
    @objc optional func pickerViewDidClick(inputButton: UIButton, getSelectedData data:[String])
    @objc optional func pickerViewDidClick(cancelButton: UIButton)
}



class DISOccupationPickerView: UIView {

    var pickerLocation: OccupationInfoViewNameLocation?
    
    var dataSource: [String]?
    
    var resultData: [String] = [DISOccupationInfoRequiredSelectedStr, DISOccupationInfoWaitedSelectedStr, DISOccupationInfoWaitedSelectedStr, DISOccupationInfoWaitedSelectedStr, DISOccupationInfoRequiredSelectedStr]
    
    weak var delegate: DISOccupationPickerViewDelegate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBAction func inputButtonClick(_ inputButton: UIButton) {
        guard let _ = delegate else {
            return
        }
        
        if pickerLocation?.rawValue == 0 {
            resultData[pickerLocation!.rawValue] = String.string(with: datePicker.date, using: DISOccupationDateFormatter)
        }
        
        if delegate!.responds(to: #selector(DISOccupationPickerViewDelegate.pickerViewDidClick(inputButton:getSelectedData:))) {
            delegate?.pickerViewDidClick!(inputButton: inputButton, getSelectedData: resultData)
        }
    }
    
    @IBAction func cancelButtonClick(_ cancelButton: UIButton) {
        guard let _ = delegate else {
            return
        }
        
        if delegate!.responds(to: #selector(DISOccupationPickerViewDelegate.pickerViewDidClick(cancelButton:))) {
            delegate?.pickerViewDidClick!(cancelButton: cancelButton)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializePicker()
        initializeDatePicker()
        layer.cornerRadius = 5
    }
    
    private func initializePicker() {
        picker.delegate = self
        picker.dataSource = self
        picker.reloadAllComponents()
    }
    
    private func initializeDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date.date(with: 1900, 1, 1, 0, 0, 0)
        datePicker.maximumDate = Date.date(with: 2099, 12, 31, 23, 59, 59)
        datePicker.locale = Locale.current
        datePicker.setDate(Date(), animated: true)
        
    }
}

// MARK: - picker view delegate
extension DISOccupationPickerView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let source = dataSource else {
            return
        }
        resultData[pickerLocation!.rawValue] = source[row]
    }
    
}
// MARK: - picker view datasource
extension DISOccupationPickerView: UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let source = dataSource else {
            return 0
        }
        return source.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let source = dataSource else {
            return nil
        }
        return source[row]
    }
}
