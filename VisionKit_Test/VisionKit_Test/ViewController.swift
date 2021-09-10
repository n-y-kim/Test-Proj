//
//  ViewController.swift
//  VisionKit_Test
//
//  Created by Nayeon Kim on 2021/08/15.
//

import UIKit
import VisionKit

class ViewController: UIViewController, VNDocumentCameraViewControllerDelegate {

    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images:Array<Any> = []
    //비어 있는 Any 타입 배열. 여기에 스캔한 이미지들을 저장할 것임.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        images = [] //처음에 '스캔하기' 버튼을 누르면 초기화 시켜 새로운 값을 저장
        visionKit()
    }
    
    @IBAction func pageChanged(_ sender: Any) {
        //페이지 컨트롤을 누르게 되어서 페이지가 바뀌게 되면 호출되는 함수
        
        imageView.image = (images[pageControl.currentPage] as! UIImage) //해당 페이지 (ex.2)에 맞는 images[2] 이미지를 불러옴
    }
    
    
    private func visionKit(){
        let scan = VNDocumentCameraViewController() //컨트롤러
        scan.delegate = self
        self.present(scan, animated: true, completion: nil)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        for pageNumber in 0..<scan.pageCount { //스캔한 문서 수를 세서 그 갯수동안 for문 돌기
            let image = scan.imageOfPage(at: pageNumber)
            images.append(image) //images 배열에 스캔한 이미지들 하나씩 저장
        }
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        imageView.image = (images[0] as! UIImage) //첫 이미지 넘겨주기
        
        controller.dismiss(animated: true, completion: nil)
    }
}

