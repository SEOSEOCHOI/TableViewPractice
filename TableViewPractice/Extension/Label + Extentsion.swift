import UIKit

extension UILabel {
    func setExplainLabelDesign() {
        self.textColor = .lightGray
        self.font = .systemFont(ofSize: 13)
    }
    
    func setDecimalNumber(requestIntValue: Int) -> String{
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let result: String = numberFormatter.string(for: requestIntValue)!
        
        return result
    }
}
