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
    
    @IBOutlet weak var swipeView: SwipeableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.swipeView.delegate = self
        self.swipeView.flexibleLayout = .init(with: self.flexLayout, end: 40.0)
        
        //indicator 여부
        self.swipeView.isSwipeIndicatorVisible = false
        //둥근 모서리 여부
        self.swipeView.hasRoundedCorners = true
        
        //childViewController연결
        if let childViewController = self.storyboard?.instantiateViewController(withIdentifier:"childVC") as? ChildViewController {
            // alternative way to interact with the swipeable view from within a child view
            childViewController.swipeView = self.swipeView
            // plug the child view into the swipeable view
            self.swipeView.setChildView(childVC: childViewController, parentVC: self)
        }
        
        
        //작을때나 클때나 둘 다 child View와 interaction 가능
        self.swipeView.childViewInteractionOnExpandedOnly = false
    }


}

