//
//  String.swift
//  DesafioItau
//
//  Created by Vitor Campos on 27/02/25.
//

import Foundation

extension String {
    func removeSpecialChars() -> String {
        self.replacingOccurrences(of: "√™", with: "ê")
            .replacingOccurrences(of: "√©", with: "é")
            .replacingOccurrences(of: "√£", with: "ã")
    }
}
