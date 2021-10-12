//
//  ViewController.swift
//  QRcodeEx
//
//  Created by 김수빈 on 2021/10/11.
//

import UIKit
class ReaderView: UIView {

  weak var delegate: ReaderViewDelegate?

  var previewLayer: AVCaptureVideoPreviewLayer?
  var centerGuideLineView: UIView?

  var captureSession: AVCaptureSession?

  var isRunning: Bool {
    guard let captureSession = self.captureSession else {
      return false
    }

    return captureSession.isRunning
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.initialSetupView()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.initialSetupView()
  }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

