/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Implementation details of the size property to extend the CGImage class.
*/

import CoreGraphics
import Foundation

extension CGImage {
    var size: CGSize {
        return CGSize(width: width, height: height)
    }
}

extension CGImage {
    
    func getPixelRgb() -> [[[[Float32]]]]{
        
        // 1 x 256 x 256 x 3
        
        let bytesPerRow = self.bytesPerRow
        let width = self.width
        let height = self.height
        let bytesPerPixel = 4
        let pixelData = self.dataProvider!.data! as Data
        
        var arr = [[[[Float32]]]]()
        var pixelWidthArr = [[Float32]]()
        var pixelHeightArr = [[[Float32]]]()
        var rgb = [Float32]()
        
        for j in 0..<height{
            for i in 0..<width{
                let pixelInfo = bytesPerRow * j + i
                let r = Float32(pixelData[pixelInfo])
                let g = Float32(pixelData[pixelInfo + 1])
                let b = Float32(pixelData[pixelInfo + 2])
                
                rgb.append(r)
                rgb.append(g)
                rgb.append(b)
                pixelWidthArr.append(rgb)
                rgb = []
            }
            pixelHeightArr.append(pixelWidthArr)
            pixelWidthArr = []
        }
        arr.append(pixelHeightArr)
        
        return arr
        
    }
}
