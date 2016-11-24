//
//  ViewController.swift
//  boundingrectwithsizeDemo
//
//  Created by xiaopi on 2016/11/23.
//  Copyright © 2016年 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let testString = "Attributed strings可以为文本指定不同的属性样式，字符串的不同部分可以使用不同的风格。"

        self.label.text = testString
        
        let height = testString.heightWithConstrainedWidth(width: self.view.frame.width, font: UIFont.systemFont(ofSize: 20.0))
        print("\(height)"+"and"+"so on")
        labelHeightConstraint.constant = height
        self.view.updateConstraintsIfNeeded()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//    不准确
    func attributedTextTest(testString: String) {
        
        
        let attributes = [
            NSFontAttributeName : UIFont.systemFont(ofSize: 20.0),
            NSUnderlineStyleAttributeName : 1,
            NSForegroundColorAttributeName : UIColor.blue,
            NSTextEffectAttributeName : NSTextEffectLetterpressStyle,
            NSStrokeWidthAttributeName : 3.0] as [String : Any]
        
        let testAttString: NSAttributedString = NSAttributedString(string: testString, attributes:attributes)
        
        self.label.attributedText = testAttString
        
        
        let height = testAttString.heightWithConstrainedWidth(width: self.view.frame.width)
//        let width = testAttString.widthWithConstrainedHeight(height: height)
        
        
        labelHeightConstraint.constant = height
        self.view.updateConstraintsIfNeeded()
    }
    

}


extension String {
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin,.truncatesLastVisibleLine], attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
    
}

extension NSAttributedString {
    func heightWithConstrainedWidth(width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return boundingBox.height
    }
    
    func widthWithConstrainedHeight(height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return boundingBox.width
    }
}
