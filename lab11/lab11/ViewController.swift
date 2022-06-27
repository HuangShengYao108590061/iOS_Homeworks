//
//  ViewController.swift
//  lab11
//
//  Created by Starvian Wibowo on 6/8/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var plantNode: SCNNode?
    var dragonNode: SCNNode?
    
    var imageNodes = [SCNNode]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
        
        let plantScene = SCNScene(named: "art.scnassets/obj1.scn")
        let dragonScene = SCNScene(named: "art.scnassets/obj10.scn")
        
        plantNode = plantScene?.rootNode
        dragonNode = dragonScene?.rootNode
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARImageTrackingConfiguration()
        
        if let trackingImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main) {
            configuration.trackingImages = trackingImages
            configuration.maximumNumberOfTrackedImages = 2
        }
        
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            let size = imageAnchor.referenceImage.physicalSize
            let plane = SCNPlane(width: size.width, height: size.height)
            plane.firstMaterial?.diffuse.contents = UIColor.white.withAlphaComponent(0.5)
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi/2
            node.addChildNode(planeNode)
            
            var shapeNode: SCNNode?
            
            switch imageAnchor.referenceImage.name {
            case CardType.plant.rawValue:
                shapeNode = plantNode
            case CardType.dragon.rawValue:
                shapeNode = dragonNode
            default:
                break
            
            }
            
            let shapeSpin = SCNAction.rotateBy(x: 0, y: 2 * .pi, z: 0,duration: 5)
            
            let repeatSpin = SCNAction.repeatForever(shapeSpin)
            shapeNode?.runAction(repeatSpin)
            
            guard let shape = shapeNode else {return nil}
            node.addChildNode(shape)
            imageNodes.append(node)
            
            return node
        }
        return nil
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if imageNodes.count == 2 {
            let positionOne = SCNVector3ToGLKVector3(imageNodes[0].position)
            let positionTwo = SCNVector3ToGLKVector3(imageNodes[1].position)
            let distance = GLKVector3Distance(positionOne, positionTwo)
            
            if distance < 0.50 {
                spinJump(node: imageNodes[0])
                spinJump(node: imageNodes[1])
            }
            
        }
    }
    
    func spinJump(node: SCNNode) {
        
        let shapeNode = node.childNodes[1]
        let shapeSpin = SCNAction.rotateBy(x: 0, y: 2 * .pi, z: 0, duration: 1)
        shapeSpin.timingMode = .easeInEaseOut
        
        let up = SCNAction.moveBy(x: 0, y: 0.05, z: 0, duration: 0.5)
        
        up.timingMode = .easeInEaseOut
        
        let down = up.reversed()
        let upDown = SCNAction.sequence([up,down])
        
        shapeNode.runAction(shapeSpin)
        shapeNode.runAction(upDown)
        
    }
    
    enum CardType: String {
        case plant  = "image1"
        case dragon = "image2"
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
//
}
