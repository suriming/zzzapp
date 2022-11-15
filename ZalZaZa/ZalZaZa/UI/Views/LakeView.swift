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
        applyTextures(to: scene)
        return scene
    }
    
    static func applyTextures(to scene: SCNScene?){
        
        let skyboxImages = (1...6).map { UIImage(named: "skyboxLake\($0)")
        }
        scene?.background.contents = skyboxImages
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
