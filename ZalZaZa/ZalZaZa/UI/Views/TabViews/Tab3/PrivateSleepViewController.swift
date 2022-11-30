//
//  ViewController.swift
//  BlazePose_test2
//
//  Created by 정은서 on 2022/11/29.
//

import Foundation
import UIKit
import SwiftUI
import AVFoundation

class PrivateSleepViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    // 1. checks if the app has permission to access the camera
    // 2. checks if so sets up the capture session to present the feed
    
    private var permissionGranted = false // Flag for permission
    
    private let captureSession = AVCaptureSession()
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    
    private var previewLayer = AVCaptureVideoPreviewLayer()
    var screenRect: CGRect! = nil // For view dimensions
    
    override func viewDidLoad() {
        // check for the permission
        checkPermission()
        
        // to set up our capture session if the app has permission to access the camera
        sessionQueue.async {
            [unowned self] in
            guard permissionGranted else { return }
            self.setupCaptureSession()
            self.captureSession.startRunning()
        }
    }
    
    func checkPermission(){
        switch AVCaptureDevice.authorizationStatus(for: .video){
            // Permission has been granted before
            case .authorized:
                permissionGranted = true
            
            // Permission has not been requested yet
            case .notDetermined:
                requestPermission()
            
            default:
                permissionGranted = false
        }
    }
    
    func requestPermission() {
        sessionQueue.suspend()
        AVCaptureDevice.requestAccess(for: .video){ [unowned self] granted in
            self.permissionGranted = granted
            self.sessionQueue.resume()
        }
    }
    
    func setupCaptureSession(){
        // Access camera
        guard let videoDevice = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) else {return}
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else { return }
        
        guard captureSession.canAddInput(videoDeviceInput) else {return}
        captureSession.addInput(videoDeviceInput)
        
        // setup output, add output to our capture session
        let captureOutput = AVCaptureVideoDataOutput()
        captureOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(captureOutput)
        
        // TODO: Add preview layer
        
        screenRect = UIScreen.main.bounds
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill // Fill screen
        previewLayer.connection?.videoOrientation = .portrait
        
        // Update to UI must be on main queue
        DispatchQueue.main.async { [weak self] in
            self!.view.layer.addSublayer(self!.previewLayer)
        }
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
        let ciimage = CIImage(cvPixelBuffer: imageBuffer!)
        let context = CIContext(options: nil)
        let cgImage = context.createCGImage(ciimage, from: ciimage.extent)

        guard let model = try? BlazePose() else {return}
        model.predict(cgImage!)
        
    }
    
}

struct PrivateSleepView: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> some UIViewController {
        return PrivateSleepViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
