//
//  Task.swift
//  TodoList
//
//  Created by Nunzio Ricci on 14/11/22.
//

import SwiftUI

extension PageView {
    func Task(text: String, done: Binding<Bool>, index: Int) -> some View {
        HStack {
            Checkmark(done)
                
            Spacer()
            
            TaskText(text, done: done.wrappedValue)
            Spacer()
            
            DeleteTaskButton(index: index)
            
        } // End HStack
        .padding(.horizontal)
    }
}
