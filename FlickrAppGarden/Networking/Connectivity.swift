//
//  Connectivity.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import Foundation
import Network

enum ConnectionStatus {
    
    case connected
    case disconnected
}

class Connectivity {
    
    
    static func isReachable(completion: @escaping (ConnectionStatus) -> Swift.Void) {
        
        let monitor = NWPathMonitor()
        let queue = DispatchQueue.global(qos: .background)
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                completion(ConnectionStatus.connected)
            } else {
                completion(ConnectionStatus.disconnected)
            }
        }
    }
}
