//
//  StringExtensionTests.swift
//  DesafioItauTests
//
//  Created by Vitor Campos on 27/02/25.
//

import XCTest

@testable import DesafioItau

final class StringExtensionTests: XCTestCase {
    func test_removingWrongCharacters_shouldReturnOnlyValidCharacters() {
        let str = "D√©bora dos Santos".removingWrongCharacters()
        let str1 = "Jo√£o da Silva".removingWrongCharacters()
        let str2 = "Transfer√™ncia".removingWrongCharacters()
        
        XCTAssert(str == "Débora dos Santos")
        XCTAssert(str1 == "João da Silva")
        XCTAssert(str2 == "Transferência")
    }
}
