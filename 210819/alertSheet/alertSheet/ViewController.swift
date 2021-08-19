//
//  ViewController.swift
//  alertSheet
//
//  Created by Nayeon Kim on 2021/08/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func changeLabel() {
        self.resultLabel.text = "선택1"
        self.reloadInputViews()
    }

    @IBAction func buttonPressed(_ sender: Any) {
        let alert =  UIAlertController(title: "원하는 타이틀", message: "원하는 메세지", preferredStyle: .actionSheet)
        
        let select1 = UIAlertAction(title: "선택1", style: .default) {
            (ACTION) in self.changeLabel()
        }
        
        let select2 = UIAlertAction(title: "선택2", style: .default, handler: nil)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        alert.addAction(cancel)
        alert.addAction(select1)
        alert.addAction(select2)

        present(alert, animated: true, completion: nil)
    }
    
}

