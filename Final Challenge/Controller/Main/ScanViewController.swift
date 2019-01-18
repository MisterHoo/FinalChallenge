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
    let ref = Database.database().reference().childByAutoId()
    var sampleImage: CIImage?
    
    let cropBox = CGRect(x: UIScreen().bounds.height/4, y: (UIScreen().bounds.width-64)/2, width: UIScreen().bounds.width/2, height: 64)
    @IBAction func logOutButton(_ sender: Any) {
        session.stopRunning()
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "toLoginPage", sender: self)
    }
    
    @IBOutlet weak var scanTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var textRecognizer: VisionTextRecognizer!
    
    var scanText : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cropArea()
        let vision = Vision.vision()
        textRecognizer = vision.onDeviceTextRecognizer()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ref.observe(.value) { (snap: DataSnapshot) in
            self.scanTextField.text = (snap.value as AnyObject).description
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        startLiveVideo()
        //startTextDetection()
    }
    //MARK: Setting Camera
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
    //MARK: bikin persegi panjang buat croped area
    func cropArea(){
        let outline = CALayer()
        outline.frame = cropBox
        outline.borderWidth = 2
        outline.borderColor = UIColor.red.cgColor
        imageView.layer.addSublayer(outline)
    }
    //MARK: Text Recongnition with firebase
    func bacaTextFirebase(sampeleBuffer: CVImageBuffer){
        
        var sampleCIImage = CIImage(cvImageBuffer: sampeleBuffer)
        var sampleCropedImage = sampleCIImage.cropped(to: CGRect(x:1920/2 , y: (1080/2)+(1080/4), width: 1920/2, height: 1080/4))
        var cropedImage = UIImage(cgImage: (convertCIImageToCGImage(inputImage: sampleCropedImage)))
        var image = VisionImage(image: cropedImage)
        textRecognizer.process(image) { (feture, error) in
            self.processResult(from: feture, error: error)
        }
    }
    func processResult(from text: VisionText?, error: Error?){
        var blocktext = text?.blocks[0].text
        print(blocktext)
        print(text?.text)
        if let text = text?.text{
            scanText = text
            ref.setValue(scanText)
        }
    }
    //convert CIImage To CGImage
    func convertCIImageToCGImage(inputImage: CIImage) -> CGImage! {
        let context = CIContext(options: nil)
        if context != nil {
            return context.createCGImage(inputImage, from: inputImage.extent)
        }
        return nil
    }
    //MARK: vision text detection
    //vision appcoda
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
        var image: [CIImage] = []
        let cropBox = CGRect(x: xCord, y: yCord, width: width, height: height)
        guard var imageRef = sampleImage?.cropped(to: cropBox) else {
            //print("gambar ga ada")
            return
        }
        image.append(imageRef)
        imageView.layer.addSublayer(outline)
    }
    
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
        
        bacaTextFirebase(sampeleBuffer: pixelBuffer)
    }
}
