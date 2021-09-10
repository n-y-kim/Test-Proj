//
//  CBViewController.swift
//  BottomSheetTest
//
//  Created by Nayeon Kim on 2021/08/19.
//

import UIKit
import MaterialComponents.MaterialBottomSheet

class CBViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        // 바텀 시트로 쓰일 뷰컨트롤러 생성
        let vc = storyboard?.instantiateViewController(withIdentifier: "BottomVC") as! CBTableViewController
        
        // MDC 바텀 시트로 설정
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        
        //높이
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 200
        
        //못 내려가게 막기
        bottomSheet.dismissOnDraggingDownSheet = false
        
        bottomSheet.adjustHeightForSafeAreaInsets = true
        // 보여주기
        present(bottomSheet, animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
