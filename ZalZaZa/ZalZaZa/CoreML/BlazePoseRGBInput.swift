//
//  BlazePoseRGBInput.swift
//  BlazePose_test
//
//  Created by 정은서 on 2022/11/23.
//

import Foundation
import Vision
import CoreML

class BlazePoseRGBInput: MLFeatureProvider {

    private static let imageFeatureName = "input_1"

    var imageFeature: CGImage
    let imageFeatureSize: CGSize

    var featureNames: Set<String> {
        return [BlazePoseRGBInput.imageFeatureName]
    }

    init(image: CGImage, size: CGSize) {
        imageFeature = image
        imageFeatureSize = size
    }
    
    func cgimage2rgb(cgImage: CGImage)-> MLMultiArray{
        let imagePixel = cgImage.getPixelRgb()
        
        let mlarray = try? MLMultiArray(shape: [1, 256, 256, 3], dataType: .float32)
        
        for j in 0..<256{
            for k in 0..<256{
                for i in 0..<3{
                    mlarray![256 * j + k] = imagePixel[0][j][k][i] as NSNumber
                }
            }
        }
        
        return mlarray!

    }

    func featureValue(for featureName: String) -> MLFeatureValue? {
        guard featureName == BlazePoseRGBInput.imageFeatureName else {
            return nil
        }
        

        let _: [MLFeatureValue.ImageOption: Any] = [
            .cropAndScale: VNImageCropAndScaleOption.scaleFill.rawValue
        ]
        
        return try? MLFeatureValue(multiArray: cgimage2rgb(cgImage: imageFeature))
    }
    
    
}
