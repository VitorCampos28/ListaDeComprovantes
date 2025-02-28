//
//  PaymentProofListViewModelTests.swift
//  DesafioItauTests
//
//  Created by Vitor Campos on 28/02/25.
//

import XCTest

@testable import DesafioItau

class PaymentProofListViewModelTests: XCTestCase {
    private let sut = PaymentProofListViewModel(service: <#T##any PaymentProofServiceProtocol#>)
}


//MARK: DUMMY

final class PaymentProofServiceDummy: PaymentProofServiceProtocol {
    func atualizarComprovantes() async throws -> Data {
        return Data()
    }
    
    func atualizarComprovantesMock() async throws -> Data {
        return Data()
    }
    
    
}
