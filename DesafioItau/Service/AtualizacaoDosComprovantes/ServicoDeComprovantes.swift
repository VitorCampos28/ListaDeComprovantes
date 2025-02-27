//
//  ServicoDeComprovantes.swift
//  DesafioItau
//
//  Created by Vitor Campos on 26/02/25.
//

import Foundation

enum ErrorsDasAplicacao: Error, LocalizedError {
    case naoFoiPossivelRecuperarDados
    case erroNoDecode
    
    var errorDescription: String? {
        switch self {
        case .naoFoiPossivelRecuperarDados:
            return "Não foi possivel recuperar os dados."
        case .erroNoDecode:
            return "Erro no decode."
        }
    }
}

protocol ServicoDeComprovantesProtocol {
    func atualizarComprovantes() async throws -> Data
}

class ServicoDeComprovantes: ServicoDeComprovantesProtocol {
    
    func atualizarComprovantes() async throws -> Data {
        // Implementacao com URl Session -> Chamada de API
        return Data()
    }
}
