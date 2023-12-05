//
//  ContentView.swift
//  ios_project_2
//
//  Created by Daniel Latos on 05/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State var listOfTasks = [
        Task(
            id: 1,
            name: "Task 1",
            status: TaskStatus.ongoing
        ),
        Task(
            id: 2,
            name: "Task 2",
            status: TaskStatus.inQueue
        ),
        Task(
            id: 3,
            name: "Task 3",
            status: TaskStatus.inQueue
        ),
        Task(
            id: 4,
            name: "Task 4",
            status: TaskStatus.inQueue
        ),
    ]
    
    var body: some View {
        List(listOfTasks, id: \.id) { task in
            ListRow(
                task: task,
                taskStatus: task.status,
                listOfTasks: $listOfTasks
            )
        }
    }
}

struct ListRow: View {
    
    var task: Task
    @State var taskStatus: TaskStatus
    @Binding var listOfTasks: Array<Task>
    
    var body: some View {
        HStack {
            Image(systemName: task.status.getImageName())
            
            Text(task.name)
            
            Spacer()
            
            Picker("STATUS", selection: $taskStatus) {
                Text(TaskStatus.ongoing.getName())
                    .tag(TaskStatus.ongoing)
                Text(TaskStatus.inQueue.getName())
                    .tag(TaskStatus.inQueue)
                Text(TaskStatus.finished.getName())
                    .tag(TaskStatus.finished)
            }
            .onChange(of: taskStatus) { oldValue, newValue in
                if let index = listOfTasks.firstIndex(where: { $0.id == task.id}) {
                    listOfTasks[index] = Task(id: task.id, name: task.name, status: newValue)
                }
            }
        }.swipeActions {
            Button("DELETE") {
                listOfTasks.removeAll(where: { $0.id == task.id })
            }
            .tint(.red)
        }
    }
}

#Preview {
    ContentView()
}
