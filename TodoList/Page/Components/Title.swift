//
//  Title.swift
//  TodoList
//
//  Created by Nunzio Ricci on 14/11/22.
//

import SwiftUI

extension PageView {
    func Title(_ text: String) -> some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

struct PageTitle_Previews: PreviewProvider {
    static var previews: some View {
        PageView().Title("This is a title")
    }
}
