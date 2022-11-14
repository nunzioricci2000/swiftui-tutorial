//
//  ContentViewModel.swift
//  TodoList
//
//  Created by Nunzio Ricci on 12/11/22.
//

import SwiftUI

extension PageView {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var showModal: Bool = false
        @Published var newTask: String = ""
        @Published var tasks: [(text: String, done: Bool)] = []
        
        func openModal() {
            showModal = true
        }
        
        func toggleCheckmark(at index: Int) {
            tasks[index].done.toggle()
        }
        
        func taskDone(at index: Int) -> Bool {
            return tasks[index].done
        }
        
        func taskText(at index: Int) -> String {
            return tasks[index].text
        }
        
        func addTask() {
            tasks.append((text: newTask, done: false))
            showModal = false
            newTask = ""
        }
        
        func deleteTask(at index: Int) {
            tasks.remove(at: index)
        }
        
        func newTaskEmpty() -> Bool {
            return newTask == ""
        }
    }
}
