import Foundation
import UIKit

class CashFieldDelegate: NSObject, UITextFieldDelegate {
    
    var numbers = [String]()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        // deleting numbers
        if newText.length < oldText.length {
            numbers.remove(at: numbers.count - 1)
            textField.text = formattedCashStringFromNumArray(numbers)
        }
        // adding numbers
        else {
            numbers.append(string)
            textField.text = formattedCashStringFromNumArray(numbers)
        }
        
        return false
    }
    

    func formattedCashStringFromNumArray(_ arr: [String]) -> String {
        
        print(arr)
        var numString: String
        
        if arr.count < 3 {
            numString = String.init(repeating: "0", count: 3 - arr.count) + arr.joined()
        }
        else {
            numString = arr.joined()
        }
        
        numString.insert("$", at: numString.startIndex)
        numString.insert(".", at: numString.index(numString.endIndex, offsetBy: -2))
        
        print(numString)
        
        return numString
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}



