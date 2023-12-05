//
//  Task.swift
//  ios_project_2
//
//  Created by Daniel Latos on 05/12/2023.
//

import Foundation

struct Task : Hashable, Identifiable {
    let id: Int
    var name: String
    var status: TaskStatus
}
