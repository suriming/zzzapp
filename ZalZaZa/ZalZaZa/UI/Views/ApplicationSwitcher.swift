//
//  ApplicationSwitcher.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/12/02.
//

import SwiftUI

struct ApplicationSwitcher: View {
    
    @EnvironmentObject var viewModel:AuthViewModel
    
    var body: some View {
        if viewModel.currentUser != nil {
            ZzTabView()
                
        } else {
            AuthView()
        }
    }
}
