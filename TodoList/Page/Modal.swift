//
//  Modal.swift
//  TodoList
//
//  Created by Nunzio Ricci on 14/11/22.
//

import SwiftUI

extension PageView {
    var modal: some View {
        VStack {
            Header("Add task")
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
        }
    }
}
