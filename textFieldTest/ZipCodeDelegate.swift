import Foundation
import UIKit

class ZipCodeDelegate: NSObject, UITextFieldDelegate {
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
    
        // Checks if deleting text
        if newText.length < oldText.length {
            return true
        }
        
        if let text = textField.text {
            if text.characters.count == 5 {
                return false
            }
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
