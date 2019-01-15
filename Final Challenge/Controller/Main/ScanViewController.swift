//
//  ScanViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 08/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit
import AVKit
import Vision
import Firebase
import FirebaseMLVision

class ScanViewController: UIViewController {
    let session = AVCaptureSession()
    var requests = [VNRequest]()
    var sampleImage: CIImage!
    
    @IBAction func logOutButton(_ sender: Any) {
        session.stopRunning()
        try! Auth.auth().signOut()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    var textRecognizer: VisionTextRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vision = Vision.vision()
        textRecognizer = vision.onDeviceTextRecognizer()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        startLiveVideo()
        startTextDetection()
    }
    func startLiveVideo() {
        session.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        let deviceInput = try! AVCaptureDeviceInput(device: captureDevice!)
        let deviceOutput = AVCaptureVideoDataOutput()
        deviceOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
        deviceOutput.setSampleBufferDelegate(self, queue: DispatchQueue.global(qos: DispatchQoS.QoSClass.default))
        session.addInput(deviceInput)
        session.addOutput(deviceOutput)
        
        let imageLayer = AVCaptureVideoPreviewLayer(session: session)
        imageLayer.frame = imageView.bounds
        imageView.layer.addSublayer(imageLayer)
        
        session.startRunning()
    }
    //MARK: baca text dengan firebase
    func bacaTextFirebase(sampeleBuffer: CMSampleBuffer){
        let metadata = VisionImageMetadata()

        let image = VisionImage(buffer: sampeleBuffer)
        image.metadata = metadata
        
        textRecognizer.process(image) { (feture, error) in
            self.processResult(from: feture, error: error)
        }
    }
    func processResult(from text: VisionText?, error: Error?){
        let resultText = text?.text
        print(resultText)
    }
    //MARK: detect text dengan vision
    func startTextDetection(){
        let textRequest = VNDetectTextRectanglesRequest(completionHandler: self.detectTextHandeler)
        textRequest.reportCharacterBoxes = true
        self.requests = [textRequest]
    }

    func detectTextHandeler(request: VNRequest, error: Error?){
        guard let observations = request.results else {
            print("no result")
            return
        }
        let result = observations.map({ $0 as? VNTextObservation})
        DispatchQueue.main.async() {
            self.imageView.layer.sublayers?.removeSubrange(1...)
            for region in result {
                guard let rg = region else {
                    continue
                }
                self.highLightWord(box: rg)
//
//                if let boxes = region?.characterBoxes{
//                    for characterBoxes in boxes{
//                        self.highLightLatters(box: characterBoxes)
//                    }
//                }
            }
        }
    }
    //MARK: highLight detected word with vision
    func highLightWord(box: VNTextObservation){

        guard let boxes = box.characterBoxes else {return}

        var maxX: CGFloat = 9999.0
        var minX: CGFloat = 0.0
        var maxY: CGFloat = 9999.0
        var minY: CGFloat = 0.0

        for char in boxes {
            if char.bottomLeft.x < maxX{
                maxX = char.bottomLeft.x
            }
            if char.bottomRight.x > minX{
                minX = char.bottomRight.x
            }
            if char.bottomRight.y < maxY{
                maxY = char.bottomRight.y
            }
            if char.topRight.y > minY{
                minY = char.topRight.y
            }
        }
        let xCord = maxX * imageView.frame.size.width
        let yCord = (1 - minY) * imageView.frame.size.height
        let width = (minX - maxX) * imageView.frame.size.width
        let height = ( minY - maxY) * imageView.frame.size.height

        let outline = CALayer()
        outline.frame = CGRect(x: xCord, y: yCord, width: width, height: height)
        outline.borderWidth = 2
        outline.borderColor = UIColor.red.cgColor
        
        imageView.layer.addSublayer(outline)
    }

//    func highLightLatters(box: VNRectangleObservation) {
//        let xCord = box.topLeft.x * imageView.frame.size.width
//        let yCord = (1 - box.topRight.y) * imageView.frame.size.height
//        let width = (box.topRight.x - box.bottomLeft.x) * imageView.frame.size.width
//        let height = (box.topLeft.y - box.bottomLeft.y) * imageView.frame.size.height
//
//        let outline = CALayer()
//        outline.frame = CGRect(x: xCord, y: yCord, width: width, height: height)
//        outline.borderWidth = 1
//        outline.borderColor = UIColor.blue.cgColor
//
//        imageView.layer.addSublayer(outline)
//    }
    
   var location = CGPoint(x: 0, y: 0)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch:UITouch! = touches.first! as UITouch
        
        location = touch.location(in: self.view)
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch:UITouch! = touches.first! as UITouch
        
        location = touch.location(in: self.view)
        
    }
    @IBOutlet weak var scaleButton: UIButton!
    @IBAction func mindahinButton(_ sender: UIButton) {
        scaleButton.center = location
    }
    
}

extension ScanViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        
        var requestOptions:[VNImageOption : Any] = [:]
        
        if let camData = CMGetAttachment(sampleBuffer, key: kCMSampleBufferAttachmentKey_CameraIntrinsicMatrix, attachmentModeOut: nil) {
            requestOptions = [.cameraIntrinsics:camData]
        }
        
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: CGImagePropertyOrientation(rawValue: 6)! , options: requestOptions)
        
        do {
            try imageRequestHandler.perform(self.requests)
        } catch {
            print(error)
        }
        var sampleImage = CIImage(cvPixelBuffer: pixelBuffer)
        bacaTextFirebase(sampeleBuffer: sampleBuffer)
    }
}
