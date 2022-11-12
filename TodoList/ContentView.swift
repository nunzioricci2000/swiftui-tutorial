//
//  ContentView.swift
//  TodoList
//
//  Created by Nunzio Ricci on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    // All state variables have been moved to the ContentViewModel file.
    // Here we have only an instance of the new class we created.
    @StateObject var viewModel: ViewModel = ViewModel()
    
    // As you can see all the code that had some
    // logical function has now been replaced with
    // calling methods or properties of the ViewModel
    // More info at:
    // https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
    // https://docs.swift.org/swift-book/LanguageGuide/Properties.html
    // https://docs.swift.org/swift-book/LanguageGuide/Methods.html
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
                        viewModel.openModal()
                    } label: {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                    }
                    
                } // End HStack
                .padding()
                
                Spacer(minLength: 15)
                
                // Body
                VStack {
                    ForEach (viewModel.tasks.indices, id: \.self) { index in
                        
                        // A task
                        HStack {
                            // Checkmark
                            Button {
                                viewModel.toggleCheckmark(at: index)
                            } label: {
                                Image(systemName: viewModel.taskDone(at: index) ? "checkmark" : "square")
                                    .foregroundColor(viewModel.taskDone(at: index) ? .green : .primary)
                            }
                                
                            Spacer()
                            
                            // Task text
                            Text(viewModel.taskText(at: index))
                                .foregroundColor(viewModel.taskDone(at: index) ? .secondary : .primary)
                                .strikethrough(viewModel.taskDone(at: index))
                            
                            Spacer()
                            
                            // Delete task button
                            Button {
                                viewModel.deleteTask(at: index)
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
        .sheet(isPresented: $viewModel.showModal) {
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
                
                TextField("Your task here", text: $viewModel.newTask)
                    .padding()
                
                // Add button on the left
                HStack {
                    Spacer()
                    
                    Button {
                        viewModel.addTask()
                    } label: {
                        Text("Add")
                            .fontWeight(.semibold)
                            .padding(6)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(viewModel.newTaskEmpty())
                    
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
