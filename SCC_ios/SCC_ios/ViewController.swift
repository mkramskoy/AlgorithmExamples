//
//  ViewController.swift
//  SCC_ios
//
//  Created by Michael Kramskoy on 9/1/16.
//  Copyright © 2016 wirrwarr. All rights reserved.
//

import UIKit

//
//  main.swift
//  SCC
//
//  Created by Michael Kramskoy on 9/1/16.
//  Copyright © 2016 wirrwarr. All rights reserved.
//

import Foundation

public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
    
    return lhs.key == rhs.key
}

public class Vertex: Hashable {
    
    let graph: SwiftGraph
    
    var key: Int
    public var hashValue: Int {
        return key
    }
    
    var explored = false
    var label: Int? {
        didSet {
            if let label = self.label {
                self.graph.canvasByLabels[label] = self
                //print("label set \(label) to vertex \(self.key)")
            }
        }
    }
    
    var neighbors = Set<Vertex>()
    
    init (graph: SwiftGraph, key: Int) {
        self.graph = graph
        self.key = key
    }
    
    func description() -> String {
        
        return "\(key)"
    }
}

public class SwiftGraph {
    
    var canvas = Dictionary<Int, Vertex>()
    var canvasByLabels = Dictionary<Int, Vertex>()
    
    public let isDirected: Bool = true
    public var verticesCount: Int {
        return canvas.keys.count
    }
    
    func vertexForKey(key: Int) -> Vertex? {
        return canvas[key]
    }
    
    func vertexForLabel(label: Int) -> Vertex? {
        return canvasByLabels[label]
    }
    
    func getOrCreateVertexForKey(key: Int) -> Vertex {
        
        if let vertex = canvas[key] {
            return vertex
        }
        else {
            let vertex = Vertex(graph: self, key: key)
            canvas[key] = vertex
            
            return vertex
        }
    }
    
    func addEdge(source source: Vertex, neighbor: Vertex) {
        
        if source.graph !== self || neighbor.graph !== self {
            print("serious problem")
        }
        
        source.neighbors.insert(neighbor)
        
        if isDirected == false {
            neighbor.neighbors.insert(source)
        }
    }
    
    func edgeDescription() -> String {
        
        var desc = ""
        for i in 0...self.verticesCount {
            if let vertex = self.vertexForKey(i) {
                let label = vertex.label ?? -1
                desc += "key: \(vertex.key), label: \(label), edges: "
                for neighbor in vertex.neighbors {
                    desc+="\(neighbor.key) "
                }
                desc+="\n"
            }
        }
        
        return desc
    }
}

class ViewController: UIViewController {

    let graph = SwiftGraph()
    let reversedGraph = SwiftGraph()
    
    var sccDict: Dictionary<Int, Int>?
    var sccArray: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var verticesArray = [String]()
        
        do {
            let url: NSURL! = NSBundle.mainBundle().URLForResource("SCC", withExtension: "txt")
            let string = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
            verticesArray = string.componentsSeparatedByString("\n")
            verticesArray.removeLast()
        }
        catch {
            print("")
        }
        
        for edgesString in verticesArray {
            var edgesArray = edgesString.componentsSeparatedByString(" ")
            edgesArray.removeLast()
            
            var integers = edgesArray.map { Int($0)! }
            
            let sourceVertex = graph.getOrCreateVertexForKey(integers.removeFirst())
            
            let rNeighborVertex = reversedGraph.getOrCreateVertexForKey(sourceVertex.key)
            
            for neighborKey in integers {
                let neighborVertex = graph.getOrCreateVertexForKey(neighborKey)
                graph.addEdge(source: sourceVertex, neighbor: neighborVertex)
                
                let rSourceVertex = reversedGraph.getOrCreateVertexForKey(neighborKey)
                reversedGraph.addEdge(source: rSourceVertex, neighbor: rNeighborVertex)
            }
        }
        
        print("verticesCount = \(graph.verticesCount)")

        self.firstDFSLoop(reversedGraph)
        //print("Reversed graph:\n\(reversedGraph.edgeDescription())")
        
        self.sccDict = Dictionary<Int, Int>()
        self.sccArray = [Int]()
        
        self.secondDFSLoop(graph, reversedGraph: reversedGraph)

        self.sccArray?.sortInPlace()
        
        print("SCC array \(self.sccArray)")
        
    }
    
    func firstDFSLoop(graph: SwiftGraph) {
        
        var label = 0
        
        for i in graph.verticesCount.stride(to: 0, by: -1) {
            if let vertex = graph.vertexForKey(i) {
                if vertex.explored == false {
                    self.DFS(vertex, label: &label)
                }
            }
            else {
                print("serious error happened")
            }
        }
    }
    
    func secondDFSLoop(graph: SwiftGraph, reversedGraph: SwiftGraph) {
        
        var label = 0
        
        for i in graph.verticesCount.stride(to: 0, by: -1) {
            if let vertexFromReversedGraph = reversedGraph.vertexForLabel(i),
                let vertex = graph.vertexForKey(vertexFromReversedGraph.key) {
                
                if vertex.explored == false {
                    //print("secondLoop vertex \(vertex.description())")
                    
                    let labelBeforeDFS = label
                    
                    self.DFS(vertex, label: &label)
                    
                    let componentSize = label - labelBeforeDFS
                    if self.sccDict != nil && componentSize > 20 {
                        self.sccDict![vertex.key] = componentSize
                        self.sccArray?.append(componentSize)
                    }
                }
            }
            else {
                print("serious error happened")
            }
        }
    }
    
    func DFS(vertex: Vertex, inout label: Int) {
        
        vertex.explored = true
        //print("vertex explored \(vertex.key)")
        
        var stack = VertexStack()
        stack.push(vertex)
        
        while stack.items.count != 0 {
            
            var didPush = false
            let top = stack.items.last!

            for neighbor in top.neighbors {
                if neighbor.explored == false {
                    neighbor.explored = true
                    //print("vertex explored \(neighbor.key)")
                    stack.push(neighbor)
                    didPush = true
                    break
                }
            }
            
            if !didPush {
                stack.pop()
                label += 1
                top.label = label
                //print("top \(top.description()), label \(label)")
                
                didPush = false
            }
        }
    }
    
    struct VertexStack {
        
        var items = [Vertex]()
        
        mutating func push(item: Vertex) {
            
            items.append(item)
        }
        
        mutating func pop() -> Vertex {
            
            return items.removeLast()
        }
    }
}

