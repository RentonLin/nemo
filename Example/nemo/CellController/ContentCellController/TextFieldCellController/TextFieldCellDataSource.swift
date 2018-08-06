//
//  TextFieldCellDataSource.swift
//  nemo
//
//  Created by Andyy Hope on 5/8/18.
//  Copyright © 2018 Andyy Hope. All rights reserved.
//

import UIKit

final class TextFieldCellDataSource {
    
    // MARK: - Properties
    
    let entity: TextFieldCellEntity
    var model: TextFieldCellModel
    var property: String
    
    // MARK: - Initializer
    
    init(entity: TextFieldCellEntity) {
        self.entity = entity
        self.model = TextFieldCellModel(entity: entity)
        self.property = ""
    }
    
    
}

