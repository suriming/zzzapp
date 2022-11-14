//
//  LakeView.swift
//  ZalZaZa
//
//  Created by Sulim Chun on 2022/11/12.
//

import SwiftUI
import SceneKit

struct LakeView: View {
    
    static func makeScene() -> SCNScene? {
        let scene = SCNScene(named: "CalmLakeScene.scn")
        return scene
    }
    
    var scene = makeScene()
    
    var body: some View {
        ZStack{
            SceneView(
                scene: scene,
                options: [.allowsCameraControl]
            )
        }
    }
}

struct LakeView_Previews: PreviewProvider {
    static var previews: some View {
        LakeView()
    }
}
