//
//  ServicoDeComprovantes.swift
//  DesafioItau
//
//  Created by Vitor Campos on 26/02/25.
//

import Foundation

enum AplicationErrors: Error, LocalizedError {
    case unableToRetrieveTheData
    case decodeError
    
    var errorDescription: String? {
        switch self {
        case .unableToRetrieveTheData:
            return "Não foi possivel recuperar os dados."
        case .decodeError:
            return "Erro no decode."
        }
    }
}

protocol PaymentProofServiceProtocol {
    func atualizarComprovantes() async throws -> Data
}

class PaymentProofService: PaymentProofServiceProtocol {
    private let session: URLSession
    private let mock: Bool
    
    init (urlSession: URLSession = .shared, mock: Bool = false) {
        self.session = urlSession
        self.mock = mock
    }
    
    func atualizarComprovantes() async throws -> Data {

        if mock {
            return try await mockDataProvider()
        } else {
            return Data()
        }
    }
    
    private func mockDataProvider() async throws -> Data {
        guard let bundle = Bundle.main.url(forResource: "DadosComprovantes", withExtension: "json") else {
            throw AplicationErrors.unableToRetrieveTheData
        }
        
        return try Data(contentsOf: bundle)
    }
}
