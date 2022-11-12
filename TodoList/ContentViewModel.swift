//
//  ContentViewModel.swift
//  TodoList
//
//  Created by Nunzio Ricci on 12/11/22.
//

import SwiftUI

// Here we have what we call the ViewModel that is
// an object that contains all the logic stuff of
// our view. This is useful becouse we can tidy the
// code and keep it more readable for future
// implementations. Info at:
// https://www.hackingwithswift.com/books/ios-swiftui/introducing-mvvm-into-your-swiftui-project
// https://docs.swift.org/swift-book/LanguageGuide/Extensions.html
extension ContentView {
    // https://www.hackingwithswift.com/quick-start/concurrency/how-to-use-mainactor-to-run-code-on-the-main-queue
    // https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-observedobject-to-manage-state-from-external-objects
    @MainActor
    class ViewModel: ObservableObject {
        @Published var showModal: Bool = false
        @Published var newTask: String = ""
        @Published var tasks: [(text: String, done: Bool)] = []
        
        // If you have read the code of the previous commit
        // you might have noticed that the functions below
        // are code that in the last version was contained
        // within the buttons or used to decide what to
        // show based on the data
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
