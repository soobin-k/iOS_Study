//
//  ViewController.swift
//  Snapkit+ThenEx
//
//  Created by 김수빈 on 2022/02/28.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

    lazy var greenBox = UIView().then {
        $0.backgroundColor = .green
    }
    
    lazy var redBox = UIView().then {
        $0.backgroundColor = .red
    }
    
    lazy var yellowBox = UIView().then {
        $0.backgroundColor = .yellow
    }
    
    lazy var blueBox = UIView().then {
        $0.backgroundColor = .blue
    }
    
    lazy var purpleBox = UIView().then {
        $0.backgroundColor = .purple
    }
    
    lazy var myButton = UIButton().then {
        $0.backgroundColor = .gray
        $0.setTitle("내 버튼", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 16
    }
    
    var greenBoxTopNSLayoutConstraint : NSLayoutConstraint? = nil
    
    var greenBoxTopConstraint : Constraint? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(yellowBox)
        self.view.addSubview(greenBox)
        self.view.addSubview(redBox)
        self.view.addSubview(blueBox)
        self.view.addSubview(purpleBox)
        self.view.addSubview(myButton)
        
        //MARK: 예제 1
        // 기존 오토 레이아웃
        
//        yellowBox.translatesAutoresizingMaskIntoConstraints = false
        
//        yellowBox.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive =  true
//        yellowBox.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8).isActive = true
//
//        yellowBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        yellowBox.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
//        OR
        
//        yellowBox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
//        yellowBox.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
//        yellowBox.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 20).isActive = true
//        yellowBox.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        
        // 스냅킷
        yellowBox.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
//            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
            // yellow 박스의 top, bottom, lead, trail을 view에 맞춘다
            // 패딩을 주려면 inset 활용
        }
        
        //MARK: 예제 2
        
        // 기존 오토 레이아웃
//        redBox.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            redBox.widthAnchor.constraint(equalToConstant: 100),
//            redBox.heightAnchor.constraint(equalToConstant: 100),
//            redBox.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            redBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//        ])
        
        // 스냅킷
        redBox.snp.makeConstraints { (make) in
            make.width.height.equalTo(100) // 너비, 높이 모두 100으로
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
//            make.center.equalToSuperview() // 상위 뷰와 center x,y 같게
        }
        
        //MARK: 예제 3
        
        // 기존 오토레이아웃
//        blueBox.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            blueBox.widthAnchor.constraint(equalTo: self.redBox.widthAnchor, multiplier: 2),
//            blueBox.heightAnchor.constraint(equalTo: self.redBox.heightAnchor),
//            blueBox.topAnchor.constraint(equalTo: self.redBox.bottomAnchor, constant: 20),
//            blueBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//        ])
        
        //스냅킷
        blueBox.snp.makeConstraints { (make) in
//            make.width.equalTo(redBox.snp.width).dividedBy(1.5)
            make.width.equalTo(redBox.snp.width).multipliedBy(2)
            // multipliedBy : 곱하기, dividedBy: 나누기
            make.height.equalTo(redBox.snp.height)
            make.top.equalTo(redBox.snp.bottom).offset(20)
            // offset은 띄워주기 역할
            make.centerX.equalToSuperview()
        }
        
        //MARK: 예제 4
        
        //스냅킷
        myButton.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        myButton.addTarget(self, action: #selector(moveGreenBoxDown), for: .touchUpInside)
        
        // 기존 오토레이아웃
//        myDarkGrayBtn.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            myDarkGrayBtn.widthAnchor.constraint(equalToConstant: 200),
//            myDarkGrayBtn.heightAnchor.constraint(equalToConstant: 100),
//            myDarkGrayBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
//            myDarkGrayBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//        ])
        
        //MARK: 예제 5
        
        // 기존 오토레이아웃
//        greenBox.translatesAutoresizingMaskIntoConstraints = false
//
//        greenBoxTopNSLayoutConstraint = greenBox.topAnchor.constraint(equalTo: self.blueBox.bottomAnchor, constant: 20)
//
//        NSLayoutConstraint.activate([
//            greenBox.widthAnchor.constraint(equalToConstant: 100),
//            greenBox.heightAnchor.constraint(equalToConstant: 100),
//            greenBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//
//        ])
//
//        greenBoxTopNSLayoutConstraint?.isActive = true
        
        //스냅킷
        greenBox.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
//            make.centerX.equalTo(self.view)
            self.greenBoxTopConstraint = make.top.equalTo(blueBox.snp.bottom).offset(20).constraint
        }
        
        //MARK: 예제 6
        purpleBox.snp.makeConstraints { (make) in
            make.width.equalTo(blueBox.snp.width)
            make.height.equalTo(greenBox.snp.height)
            make.top.equalTo(greenBox.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

    }
    var offset = 0
    
    @objc fileprivate func moveGreenBoxDown(){
        offset += 40
        print("ViewController - moveGreenBoxDown() called / offset: \(offset)")
        
        //스냅킷
        self.greenBoxTopConstraint?.update(offset: offset)
        
        
//        self.greenBoxTopNSLayoutConstraint?.priority = 900
//        self.greenBoxTopNSLayoutConstraint?.constant = CGFloat(offset)
        
        UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.view.layoutIfNeeded()
        }).startAnimation()
        
        
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    // update
    func updateUIViewController(_ uiViewController: UIViewController, context: Context){
        
    }
    // makeui
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View{
        ViewControllerRepresentable().previewDisplayName("아이폰 11")
    }
}
#endif
