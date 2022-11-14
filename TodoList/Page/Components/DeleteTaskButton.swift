//
//  DeleteTaskButton.swift
//  TodoList
//
//  Created by Nunzio Ricci on 14/11/22.
//

import SwiftUI

extension PageView {
    func DeleteTaskButton(index: Int) -> some View {
        Button {
            viewModel.deleteTask(at: index)
        } label: {
            Image(systemName: "trash")
                .foregroundColor(.red)
        }
    }
}
