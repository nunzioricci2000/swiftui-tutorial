//
//  TaskText.swift
//  TodoList
//
//  Created by Nunzio Ricci on 14/11/22.
//

import SwiftUI

extension PageView {
    func TaskText(_ text: String, done: Bool = false) -> some View {
        Text(text)
            .foregroundColor(done ? .secondary : .primary)
            .strikethrough(done)
    }
}
