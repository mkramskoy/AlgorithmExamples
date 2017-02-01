//
//  BFS.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 10/22/16.
//  Copyright © 2016 Connector. All rights reserved.
//

import Foundation

class BreadthFirstSearch {
    class func run() {
        let graph = Graph()
        
        let nodeA = Vertex(label: "a")
        graph.addVertex(nodeA)
        let nodeB = Vertex(label: "b")
        graph.addVertex(nodeB)
        let nodeC = Vertex(label: "c")
        graph.addVertex(nodeC)
        let nodeD = Vertex(label: "d")
        graph.addVertex(nodeD)
        let nodeE = Vertex(label: "e")
        graph.addVertex(nodeE)
        
        let _ = nodeA.addEdge(to: nodeB)
        let _ = nodeB.addEdge(to: nodeE)
        let _ = nodeC.addEdge(to: nodeE)
        let _ = nodeD.addEdge(to: nodeB)
        let _ = nodeE.addEdge(to: nodeD)
        
        let graphCopy = graph.copyWithBFS()
        
        print("Original graph:\n\(graph.description())\nGraph copy:\n\(graphCopy.description())")
    }
}

extension Graph {
    func copyWithBFS() -> Graph {
        let graphCopy = Graph()
        var copiedVertices = [String: Vertex]()
        
        for vertex in self.vertices where vertex.visited == false {
            
            self.BFS(startVertex: vertex, vertexBlock: { vertex in
                if vertex.visited == false {
                    vertex.visited = true
                    let vertexCopy = Vertex(label: vertex.label)
                    graphCopy.addVertex(vertexCopy)
                    
                    copiedVertices[vertexCopy.label] = vertexCopy
                    
                    return true
                }
                
                return false
            },
            edgeBlock: { edge in
                if let source = copiedVertices[edge.source.label],
                    let neighbour = copiedVertices[edge.neighbour.label] {
                    let _ = source.addEdge(to: neighbour)
                }
            })
        }
        
        return graphCopy
    }
    
    func BFS(startVertex: Vertex, vertexBlock:(Vertex) -> Bool, edgeBlock:(Edge) -> Void) {
        let queue = Queue<Vertex>()
        queue.push(startVertex)
        
        let _ = vertexBlock(startVertex)
        
        while let vertex = queue.pop() {
            for edge in vertex.edges {
                if vertexBlock(edge.neighbour) {
                    queue.push(edge.neighbour)
                }
                edgeBlock(edge)
            }
        }
    }
}


