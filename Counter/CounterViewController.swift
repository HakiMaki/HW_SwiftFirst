//
//  ViewController.swift
//  Counter
//
//  Created by Alexandr on 23.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var errorLogger: UITextView!
    
    private var count: Int = 0 {
        didSet {
            updateUserScoreLabel()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        errorLogger.text += "\n\n"
    }
    
    
    @IBAction func addButton(_ sender: UIButton) {
        updateLogger(fromButton: .add)
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        updateLogger(fromButton: .reduce)
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        updateLogger(fromButton: .reset)
    }
    
    private func updateUserScoreLabel() {
        counterLabel.text = "\(count)"
    }
    
    private func updateLogger(fromButton button: ButtonType) {
        let formattedDate = Date().digitFormat()
        
        switch button {
            case .add:
                count += 1
                errorLogger.text += "[\(formattedDate)]: значение изменено на +1\n"
            case .reduce:
                if count > 0 {
                    count -= 1
                    errorLogger.text += "[\(formattedDate)]: значение изменено на -1\n"
                } else {
                    errorLogger.text += "[\(formattedDate)]: попытка уменьшить значение счётчика ниже 0\n"
                }
            case .reset:
                count = 0
                errorLogger.text += "[\(formattedDate)]: значение сброшено\n"
        }
    }

}

enum ButtonType {
    case add
    case reduce
    case reset
}
