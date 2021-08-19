//
//  ViewController.swift
//  BottomSheetTest
//
//  Created by Nayeon Kim on 2021/08/18.
//

import UIKit

class ViewController: UIViewController, SwipeableViewProtocol {
    func swipeableViewDidExpand(swipeableView: SwipeableView, previousState: Bool) {
        print(2)
    }
    
    func swipeableViewDidCollapse(swipeableView: SwipeableView, previousState: Bool) {
       print(3)
    }
    
    func swipeableViewDidPan(swipeableView: SwipeableView, percentage: CGFloat) {
        print(1)
    }
    

    @IBOutlet weak var flexLayout: NSLayoutConstraint!
    
    @IBOutlet weak var pickerFlexLayout: NSLayoutConstraint!
    
    @IBOutlet weak var picker: UIButton!
    @IBOutlet weak var swipeView: SwipeableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.swipeView.isHidden = true
        self.swipeView.isUserInteractionEnabled = false
        self.swipeView.delegate = self
        
        //addAnimateableItem에 layout을 넣고 end 값을 조정하면서 움직이는거 확인
        self.swipeView.addAnimatableItem(SwipeableItemLayout(with: pickerFlexLayout, end: 100.0))
    
    }
    
    func childViewSettings() {
        self.swipeView.isHidden = false
        self.swipeView.isUserInteractionEnabled = true
        self.swipeView.flexibleLayout = .init(with: self.flexLayout, end: 40.0)
        
        //indicator 여부
        self.swipeView.isSwipeIndicatorVisible = false
        //둥근 모서리 여부
        self.swipeView.hasRoundedCorners = true
        
        //작을때나 클때나 둘 다 child View와 interaction 가능
        self.swipeView.childViewInteractionOnExpandedOnly = false
    }


    @IBAction func pickerSelected(_ sender: Any) {
        
        //childViewController연결
        if let childViewController = self.storyboard?.instantiateViewController(withIdentifier:"childVC") as? ChildViewController {
            childViewSettings()
            // alternative way to interact with the swipeable view from within a child view
            childViewController.swipeView = self.swipeView
            // plug the child view into the swipeable view
            self.swipeView.setChildView(childVC: childViewController, parentVC: self)
            
        }
        
    }
    
    
}

