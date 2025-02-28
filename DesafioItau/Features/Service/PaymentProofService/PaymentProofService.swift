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
    
    func atualizarComprovantes() async throws -> Data {
        // Implementacao com URl Session -> Chamada de API
        return Data()
    }
}
