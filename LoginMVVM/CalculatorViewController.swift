//
//  CalculatorViewController.swift
//  LoginMVVM
//
//  Created by Anuradha Sharma on 5/18/18.
//  Copyright © 2018 Anuradha Sharma. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var tfNumber1: UITextField!
    @IBOutlet weak var tfNumber2: UITextField!
    @IBOutlet weak var lblOperator: UILabel!
    @IBOutlet weak var lblSum: UILabel!
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnSubstract: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnDivide: UIButton!
    

    var calculatorViewModel = CalculatorViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = tfNumber1.rx.text.map{ Double($0!) ?? 0.0 }.bind(to: calculatorViewModel.number1)
        _ = tfNumber2.rx.text.map{ Double($0!) ?? 0.0 }.bind(to: calculatorViewModel.number2)
        
        _ = calculatorViewModel.changeOperator.bind(to: lblOperator.rx.text)
        _ = calculatorViewModel.calcAnswer.map{ "\($0)" }.bind(to: lblSum.rx.text)
        
        _ = btnAdd.rx.tap.subscribe( onNext:{ self.calculatorViewModel.changeOperator(buttonId: self.btnAdd.tag) })
        _ = btnSubstract.rx.tap.subscribe( onNext:{ self.calculatorViewModel.changeOperator(buttonId: self.btnSubstract.tag) })
        _ = btnMultiply.rx.tap.subscribe( onNext:{ self.calculatorViewModel.changeOperator(buttonId: self.btnMultiply.tag) })
        _ = btnDivide.rx.tap.subscribe( onNext:{ self.calculatorViewModel.changeOperator(buttonId: self.btnDivide.tag) })
    }
}
