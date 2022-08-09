//
//  ViewController.swift
//  HomeWork20
//
//  Created by Dato on 09.08.22.
//

import UIKit

class ViewController: UIViewController {

    
    let dataPicker : UIDatePicker = {
       let dataPicker =  UIDatePicker()
        dataPicker.locale = .current
        dataPicker.datePickerMode = .date
        dataPicker.preferredDatePickerStyle = .wheels
        return dataPicker
    }()
    
    
    let primeNumberCalculateBtn : UIButton = {
        let button =  UIButton()
        button.backgroundColor = .white
        button.setTitle("Calculate Prime Number", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(dataPicker)
        view.addSubview(primeNumberCalculateBtn)
        primeNumberCalculateBtn.addTarget(self, action: #selector(calculatePrimeNumber), for: .touchUpInside)
        
    }

    @objc func calculatePrimeNumber () {
        primeNumberCalculateBtn.setTitle("Calculating...", for: .normal)
        primeNumberCalculateBtn.alpha = 0.3
        primeNumberCalculateBtn.isUserInteractionEnabled = false
        
        
        print("hello")
        DispatchQueue.global().async{
            var numArr = [Int]()
            var primeNumArr = [Int]()
            var currentNum = 0

            for i in 0...10000{
                currentNum = i

                var counter = 0

                if currentNum > 1{
                    numArr.append(currentNum)
                    for j in numArr{
                        if currentNum % j == 0{
                            counter += 1
                        }
                    }
                    if counter == 1{
                        primeNumArr.append(currentNum)
                    }

                }
            }
            print(primeNumArr)
            DispatchQueue.main.async {
                self.primeNumberCalculateBtn.alpha = 1.0
                self.primeNumberCalculateBtn.isUserInteractionEnabled = true
                self.primeNumberCalculateBtn.setTitle("Calculate Prime Number", for: .normal)
            }
           
        }
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        dataPicker.frame = CGRect(x: 30, y: 30, width: view.width-60, height: 300)
        primeNumberCalculateBtn.frame = CGRect(x: 50, y: dataPicker.bottom+50 , width: view.width-100, height: 45)
        
    }

}



extension UIView {
        var width: CGFloat{
            return frame.size.width
        }
        var height: CGFloat{
            return frame.size.height
        }
        var left: CGFloat{
            return frame.origin.x
        }
        var right: CGFloat{
            return left + width
        }
        var top: CGFloat{
            return frame.origin.y
        }
        var bottom: CGFloat{
            return top + height
        }
}
