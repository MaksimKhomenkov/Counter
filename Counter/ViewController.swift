//
//  ViewController.swift
//  Counter
//
//  Created by Максим Хоменков on 15.10.2023.
//

import UIKit




class ViewController: UIViewController {
    
    @IBOutlet private var labelText: UILabel!
    
    @IBOutlet private var buttonPlus: UIButton!
    
    @IBOutlet private var buttonMinus: UIButton!
    
    @IBOutlet private var clearAllButton: UIButton!
    
    @IBOutlet private var changeHistoryTextView: UITextView!
    
    private var labelCount : Int = 0
    private var dateString = ""
    
    private func getDate(){
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd-MM-YYY hh:mm:ss"
        return dateString = dateFormatter.string(from: Date())
    }
    private func newString(){
        changeHistoryTextView.scrollRangeToVisible(NSMakeRange(changeHistoryTextView.text.count - 1, 0))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        labelText.text = "Значение счетчика: 0"
        changeHistoryTextView.text = "История изменений: "
    }

    @IBAction private func pressClearAllButton(_ sender: Any) {
        labelCount = 0
        labelText.text = "Значение счетчика: \(labelCount)"
        getDate()
        changeHistoryTextView.text.append("\n[\(dateString)]: \nзначение сброшено")
        newString()
    }
    @IBAction private func pressButtonPlus(_ sender: Any) {
        labelCount += 1
        labelText.text = "Значение счетчика: \(labelCount)"
        getDate()
        changeHistoryTextView.text.append("\n[\(dateString)]: \nзначение изменено  на +1")
        newString()
    }
    @IBAction private func pressButtonMinus(_ sender: Any) {
        getDate()
        if labelCount > 0 {
            labelCount -= 1
            changeHistoryTextView.text.append("\n[\(dateString)]: \nзначение изменено на -1")
            labelText.text = "Значение счетчика: \(labelCount)"
        } else {
            changeHistoryTextView.text.append("\n[\(dateString)]: \nпопытка уменьшить значение счётчика ниже 0")
        }
        newString()
    }
}

