//
//  ViewModel.swift
//  Bubs
//
//  Created by Haya Albaker on 08/10/2024.
//
//
import Foundation



class ViewModel: ObservableObject{
    @Published var levelsArray: [Bool] = [true, false, false, false, false]
}