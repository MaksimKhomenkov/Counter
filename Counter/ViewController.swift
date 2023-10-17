//
//  ViewController.swift
//  Counter
//
//  Created by Максим Хоменков on 15.10.2023.
//

import UIKit

var dateString:  String!
func getDate(){
    let dateFormatter = DateFormatter()

    dateFormatter.dateFormat = "dd-MM-YYY hh:mm:ss"
    return dateString = dateFormatter.string(from: Date())
}

class ViewController: UIViewController {
    public var labelCount : Int = 0
    public func newString(){
        changeHistory.scrollRangeToVisible(NSMakeRange(changeHistory.text.count - 1, 0))
    }
    
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var buttonPlus: UIButton!
    
    @IBOutlet weak var buttonMinus: UIButton!
    
    @IBOutlet weak var clearAll: UIButton!
    
    @IBOutlet weak var changeHistory: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelText.text = "Значение счетчика: 0"
        changeHistory.text = "История изменений: "
    }

    @IBAction func pressClearAll(_ sender: Any) {
        labelCount = 0
        labelText.text = "Значение счетчика: \(labelCount)"
        getDate()
        changeHistory.text.append("\n[\(dateString!)]: \nзначение сброшено")
        newString()
    }
    
    @IBAction func pressButtonPlus(_ sender: Any) {
        labelCount += 1
        labelText.text = "Значение счетчика: \(labelCount)"
        getDate()
        changeHistory.text.append("\n[\(dateString!)]: \nзначение изменено  на +1")
        newString()
    }
    
    @IBAction func pressButtonMinus(_ sender: Any) {
        getDate()
        if labelCount > 0 {
            labelCount -= 1
            changeHistory.text.append("\n[\(dateString!)]: \nзначение изменено на -1")
            labelText.text = "Значение счетчика: \(labelCount)"
        } else {
            changeHistory.text.append("\n[\(dateString!)]: \nпопытка уменьшить значение счётчика ниже 0")
        }
        newString()
    }
}

