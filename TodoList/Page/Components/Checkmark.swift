//
//  Checkmark.swift
//  TodoList
//
//  Created by Nunzio Ricci on 14/11/22.
//

import SwiftUI

extension PageView {
    func Checkmark(_ binding: Binding<Bool>) -> some View {
        Button {
            binding.wrappedValue.toggle()
        } label: {
            Image(systemName: binding.wrappedValue ? "checkmark" : "square")
                .foregroundColor(binding.wrappedValue ? .green : .primary)
        }
    }
}
