import Foundation
class DFS {
    
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
        let _ = nodeE.addEdge(to: nodeD)
        let _ = nodeD.addEdge(to: nodeB)
        
        let _ = nodeC.addEdge(to: nodeE)
        
        
        
        let visitedNodes = graph.DFS(graph: graph)
        
        print("Graph:\n\(graph.description())\nVisited nodes:\n\(visitedNodes)")
    }
}

extension Graph {
    func DFS(graph: Graph) -> [String] {
        var visitedNodes = [String]()
        
        for vertex in self.vertices where vertex.visited == false {
            var stack = [Vertex]()
            
            stack.append(vertex)
            vertex.visited = true
            
            visitedNodes.append(vertex.label)
            
            while let element = stack.popLast() {
                for edge in element.edges {
                    let neighbour = edge.neighbour
                    if neighbour.visited == false {
                        stack.append(neighbour)
                        neighbour.visited = true
                        
                        visitedNodes.append(neighbour.label)
                    }
                }
            }
        }
        
        return visitedNodes
    }
}
