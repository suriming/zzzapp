//
//  BlazePoseOutput.swift
//  BlazePose_test
//
//  Created by 정은서 on 2022/11/23.


import Foundation
import CoreML
import Vision

struct BlazePoseOutput {
    enum Feature: String {
        case ld_3d = "ld_3d"
        case output_segmentation = "output_segmentation"
        case output_poseflag = "output_pose"
    }
    
    let ld_3d: MLMultiArray
    let output_segmentation: MLMultiArray
    let output_poseflag: MLMultiArray
    
    struct Cell {
        let yIndex: Int
        let xIndex: Int

        init(_ yIndex: Int, _ xIndex: Int) {
            self.yIndex = yIndex
            self.xIndex = xIndex
        }

        static var zero: Cell {
            return Cell(0, 0)
        }
    }
    
    init(ld_3d: MLMultiArray, output_segmentation: MLMultiArray, output_poseflag: MLMultiArray) {
        self.ld_3d = ld_3d
        self.output_segmentation = output_segmentation
        self.output_poseflag = output_poseflag
    }
    
    
}

