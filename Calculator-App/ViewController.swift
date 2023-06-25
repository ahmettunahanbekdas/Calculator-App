//
//  ViewController.swift
//  Calculator-App
//
//  Created by Ahmet Tunahan Bekdaş on 24.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings:String = ""
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        clearAll()
        
    }
    
    /*
     Bu kod parçası, "clearAll" fonksiyonu çağrıldığında, "workings", "calculatorWorkings.text" ve "calculatorResults.text" değerlerini sıfırlayarak hesap makinesinin işlem geçmişini ve
     sonuçlarını temizler
     */
    func clearAll()
    {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
    /*
     Bu kod parçası, "equalsTap" fonksiyonu bir düğmeye tıklandığında çağrıldığında, "workings" ifadesini bir NSExpression nesnesine dönüştürür, ifadeyi değerlendirir ve sonucunu bir Double olarak alır. Bu, hesap makinesinin işlem geçmişindeki matematiksel ifadeyi hesaplayıp sonucunu elde etmek için kullanılır.
     */
    @IBAction func equalsTap(_ sender: Any)
    {
        if (validInput())
        {
            let checkedWorkingsForPerecent = workings.replacingOccurrences(of: "%", with: "*.0.01")
            let expression = NSExpression(format: checkedWorkingsForPerecent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        }
        else
        {
            let alert = UIAlertController(title: "Invaled Input",
            message: "Calculator unable to do math based on input",
            preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil )
        }
    }
    
    func validInput() -> Bool
    {
        
        return true
    }
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format:"%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func backTap(_ sender: Any) {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    
    /*
     Bu kod parçası, "addToWorkings" fonksiyonu çağrıldığında, "value" parametresini "workings" değişkenine ekleyerek hesap makinesinin işlem geçmişini günceller ve ardından bu güncellenmiş değeri "calculatorWorkings.text" metin öğesine atar. Bu şekilde, kullanıcının girdiği değerlerin hesap makinesinde görüntülenmesi sağlanır.
     */
    func addToWorkings(value: String)
    {
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    
    @IBAction func percentTap(_ sender: Any) {
        addToWorkings(value: "%")

    }
    
    @IBAction func divideTap(_ sender: Any) {
        addToWorkings(value: "/")

    }
    
    @IBAction func timesTap(_ sender: Any) {
        addToWorkings(value: "*")

    }
    
    @IBAction func minusTap(_ sender: Any) {
        addToWorkings(value: "-")

    }
    
    @IBAction func plusTap(_ sender: Any) {
        addToWorkings(value: "+")

    }
    
    @IBAction func decimalTap(_ sender: Any) {
        addToWorkings(value: ".")

    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorkings(value: "0")

    }
    
    @IBAction func oneTap(_ sender: Any) {
        addToWorkings(value: "1")

    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToWorkings(value: "2")

    }
    
    @IBAction func threeTap(_ sender: Any) {
        addToWorkings(value: "3")

    }
    
   
    @IBAction func fourTap(_ sender: Any) {
        addToWorkings(value: "4")

    }
    
    
    @IBAction func fiveTap(_ sender: Any) {
        addToWorkings(value: "5")

    }
    
    
    @IBAction func sixTap(_ sender: Any) {
        addToWorkings(value: "6")

    }
    
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorkings(value: "7")

    }
    
    
    @IBAction func eightTap(_ sender: Any) {
        addToWorkings(value: "8")

    }
    
    
    @IBAction func nineTap(_ sender: Any) {
        addToWorkings(value: "9")

    }
    
    
    
}

