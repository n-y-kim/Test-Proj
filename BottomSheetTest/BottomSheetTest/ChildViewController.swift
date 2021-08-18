//
//  ChildViewController.swift
//  BottomSheetTest
//
//  Created by Nayeon Kim on 2021/08/18.
//

import UIKit

class ChildViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    weak var swipeView:SwipeableView?
    
    @IBOutlet weak var selectControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.reloadData()
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
