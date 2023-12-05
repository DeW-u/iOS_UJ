//
//  TaskStatus.swift
//  ios_project_2
//
//  Created by Daniel Latos on 05/12/2023.
//

import Foundation
import SwiftUI

enum TaskStatus {
    case ongoing
    case inQueue
    case finished
}

extension TaskStatus {
    func getName() -> String {
        switch self {
        case .ongoing:
            return "Ongoing"
        case .inQueue:
            return "In Queue"
        case .finished:
            return "Finished"
        }
    }
}

extension TaskStatus {
    func getImageName() -> String {
        switch self {
        case .ongoing:
            return "figure.run.circle.fill"
        case .inQueue:
            return "clock.fill"
        case .finished:
            return "flag.checkered.circle.fill"
        }
    }
}
