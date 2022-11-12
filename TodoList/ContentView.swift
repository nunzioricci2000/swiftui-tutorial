//
//  ContentView.swift
//  TodoList
//
//  Created by Nunzio Ricci on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var showModal: Bool = false
    @State var newTask: String = "Buy a new keyboa"
    
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
                    
                    // First task
                    HStack {
                        // Checkmark
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                        
                        Spacer()
                        
                        // Task text
                        Text("Coding for an hour")
                            .foregroundColor(.secondary)
                            .strikethrough()
                        
                        Spacer()
                        
                        // Delete task button
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                        
                    } // End HStack
                    .padding(.horizontal)
                    
                    Spacer(minLength: 18)
                    
                    // Second task
                    HStack {
                        // Checkmark
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                        
                        Spacer()
                        
                        // Task text
                        Text("Teach to a monkey to write code")
                            .foregroundColor(.secondary)
                            .strikethrough()
                        
                        Spacer()
                        
                        // Delete task button
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                        
                    } // End HStack
                    .padding(.horizontal)
                    
                    Spacer(minLength: 18)
                    
                    // Third task
                    HStack {
                        // Square
                        Image(systemName: "square")
                        
                        Spacer()
                        
                        // Task text
                        Text("Just another task")
                        
                        Spacer()
                        
                        // Delete task button
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                        
                    } // Fourth HStack
                    .padding(.horizontal)
                    
                    Spacer(minLength: 18)
                    
                    // Fourth task
                    HStack {
                        // Square
                        Image(systemName: "square")
                        
                        Spacer()
                        
                        // Task text
                        Text("Write the next algorithm")
                        
                        Spacer()
                        
                        // Delete task button
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                        
                    } // End HStack
                    .padding(.horizontal)
                    
                    Spacer(minLength: 18)
                    
                    // Fifth task
                    HStack {
                        // Checkmark
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                        
                        Spacer()
                        
                        // Task text
                        Text("Support other monkeys")
                            .foregroundColor(.secondary)
                            .strikethrough()
                        
                        Spacer()
                        
                        // Delete task button
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                        
                    } // End HStack
                    .padding(.horizontal)
                    
                    Spacer(minLength: 18)
                    
                } // End VStack
            } // End VStack
        }// End ScrollView
        
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
                        // future code here
                    } label: {
                        Text("Add")
                            .fontWeight(.semibold)
                            .padding(6)
                    }
                    .buttonStyle(.borderedProminent)
                    
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
