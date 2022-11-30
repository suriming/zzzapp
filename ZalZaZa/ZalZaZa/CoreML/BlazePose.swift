//
//  BlazePose.swift
//  BlazePose_test
//
//  Created by 정은서 on 2022/11/23.
//

import Foundation
import CoreML
import Vision

//protocol BlazePoseDelegate: AnyObject {
//    func blazePose(_ blazePose: BlazePose, didPredict prediction: )
//}
protocol BlazePoseDelegate: AnyObject {
    func blazePose(_ blazePose: BlazePose, didPredict predictions: BlazePoseOutput)
}

class BlazePose {
    
    private let blazePoseMLModel: MLModel
    
    init() throws {
        
        blazePoseMLModel = try model_coreml_float32(configuration: .init()).model
        
    }
    
    let modelInputSize = CGSize(width: 256, height: 256)
    
    func predict(_ image: CGImage){
        DispatchQueue.global(qos: .userInitiated).async {
            
            let BlazePoseinput = BlazePoseRGBInput(image: image, size: self.modelInputSize)
            let input = BlazePoseRGBInput(image: image, size: self.modelInputSize) as MLFeatureProvider
            
            guard let prediction = try? self.blazePoseMLModel.prediction(from: input) else {
                return
            }
            print("BlazePose:\n", prediction.featureNames)
            
            print("ld_3d:\n", prediction.featureValue(for: "ld_3d"))
            print("output_poseflag:\n", prediction.featureValue(for: "output_poseflag"))
            print("output_segmentation:\n", prediction.featureValue(for: "output_segmentation"))

            
        }
    }
}
