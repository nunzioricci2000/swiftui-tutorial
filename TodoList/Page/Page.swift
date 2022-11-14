//
//  PageView.swift
//  TodoList
//
//  Created by Nunzio Ricci on 11/11/22.
//

import SwiftUI

struct PageView: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        // Main page
        ScrollView {
            VStack {
                Header("Todo List") {
                    Button {
                        viewModel.openModal()
                    } label: {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                    }
                }
                .padding()
                
                Spacer(minLength: 15)
                
                // Body
                VStack {
                    ForEach (viewModel.tasks.indices, id: \.self) { index in
                        
                        // A task
                        Task(text: viewModel .tasks[index].text, done: $viewModel .tasks[index].done, index: index)
                        
                        Spacer(minLength: 18)
                    }
                } // End VStack
            } // End VStack
        } // End ScrollView
        
        // Modal
        .sheet(isPresented: $viewModel.showModal) {
            Spacer(minLength: 30)
            modal
        } // End modal
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
