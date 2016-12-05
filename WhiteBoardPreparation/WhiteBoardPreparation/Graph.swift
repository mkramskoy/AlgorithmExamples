////
////  Graph.swift
////  WhiteBoardPreparation
////
////  Created by Michael Kramskoy on 10/27/16.
////  Copyright © 2016 Connector. All rights reserved.
////

import Foundation

class Vertex {
    
    var visited: Bool = false
    
    var edges = [Edge]()
    let label: String
    
    init(label: String) {
        self.label = label
    }
    
    func addEdge(to neighbour: Vertex) -> Edge {
        
        let edge = Edge(source: self, neighbour: neighbour)
        self.edges.append(edge)
        
        return edge
    }
    
    func description() -> String {
        return "vartex: \(label) with edges: \(edges.debugDescription)"
    }
}

class Edge {
    
    let source: Vertex
    let neighbour: Vertex
    
    let weight: Int
    
    init (source: Vertex, neighbour: Vertex, weight: Int) {
        
        self.source = source
        self.neighbour = neighbour
        self.weight = weight
    }
    
    convenience init(source: Vertex, neighbour: Vertex) {
        
        self.init(source: source, neighbour: neighbour, weight: 1)
    }
    
    func description() -> String {
        
        return "from: \(source), to:\(neighbour), weight: \(weight)"
    }
}

class Graph {
    
    var vertices: [Vertex]
    
    init() {
        self.vertices = [Vertex]()
    }
    
    func addVertex(_ vertex: Vertex) {
        self.vertices.append(vertex)
    }
    
    func description() -> String {
        
        var string = ""
        for node in self.vertices {
            string += "\(node.description())\n"
        }
        
        return string
    }
}

