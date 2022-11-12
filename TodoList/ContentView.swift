//
//  ContentView.swift
//  TodoList
//
//  Created by Nunzio Ricci on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var showModal: Bool = false
    @State var newTask: String = ""
    
    // Following variable stores a list of named tuples
    // that rapresents a task. Each tuple have a
    // text argument for store the body of the task
    // and a done argument for save if the task is done
    // or not. More info about complex types here:
    // https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html
    // https://www.tutlane.com/tutorial/swift/swift-tuples
    
    @State var tasks: [(text: String, done: Bool)] = []
    
    var body: some View {
        // Main page
        ScrollView {
            VStack {
                // Header
                HStack {
                    // Title
                    Text("Todo List")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    // Open modal button
                    Button {
                        showModal = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                    }
                    
                } // End HStack
                .padding()
                
                Spacer(minLength: 15)
                
                // Body
                VStack {
                    
                    // This ForEach takes the indices of all
                    // the tasks. More info at:
                    // https://developer.apple.com/documentation/swift/collection/indices-swift.property-9kkbf
                    // https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-views-in-a-loop-using-foreach
                    // https://www.hackingwithswift.com/sixty/3/7/the-ternary-operator
                    ForEach (tasks.indices, id: \.self) { index in
                        
                        // A task
                        HStack {
                            // Checkmark
                            Button {
                                tasks[index].done.toggle()
                            } label: {
                                Image(systemName: tasks[index].done ? "checkmark" : "square")
                                    .foregroundColor(tasks[index].done ? .green : .primary)
                            }
                                
                            Spacer()
                            
                            // Task text
                            Text(tasks[index].text)
                                .foregroundColor(tasks[index].done ? .secondary : .primary)
                                .strikethrough(tasks[index].done)
                            
                            Spacer()
                            
                            // Delete task button
                            Button {
                                // https://www.tutorialkart.com/swift-tutorial/swift-remove-element-from-array/
                                tasks.remove(at: index)
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            
                        } // End HStack
                        .padding(.horizontal)
                        
                        Spacer(minLength: 18)
                    }
                    
                } // End VStack
            } // End VStack
        } // End ScrollView
        
        // Modal
        .sheet(isPresented: $showModal) {
            Spacer(minLength: 30)
            VStack {
                HStack {
                    // Title
                    Text("Add Task")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                } // End HStack
                .padding()
                
                TextField("Your task here", text: $newTask)
                    .padding()
                
                // Add button on the left
                HStack {
                    Spacer()
                    
                    Button {
                        // https://developer.apple.com/documentation/swift/array/append(_:)-1ytnt
                        tasks.append((text: newTask, done: false))
                        showModal = false
                        newTask = ""
                    } label: {
                        Text("Add")
                            .fontWeight(.semibold)
                            .padding(6)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    // https://swiftwombat.com/how-to-disable-button-in-swiftui/
                    .disabled(newTask == "")
                    
                } // End HStack
                .padding()
                
                Spacer()
            } // End VStack
        } // End modal

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
