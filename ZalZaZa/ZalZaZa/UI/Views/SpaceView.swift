//
//  SpaceView.swift
//  ZalZaZa
//
//  Created by Sulim Chun on 2022/11/14.
//

import SwiftUI
import SceneKit

struct SpaceView: View {
    
    static func makeScene() -> SCNScene? {
        let scene = SCNScene(named: "SpaceScene.scn")
        applyTextures(to: scene)
        return scene
    }
    
    static func applyTextures(to scene: SCNScene?){
        
        let skyboxImages = (1...6).map { UIImage(named: "skybox\($0)")
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
        .ignoresSafeArea()
    }
}

struct SpaceView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceView()
    }
}
