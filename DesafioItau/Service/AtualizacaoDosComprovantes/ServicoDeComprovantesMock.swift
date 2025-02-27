//
//  ServicoDeComprovantesMock.swift
//  DesafioItau
//
//  Created by Vitor Campos on 26/02/25.
//

import Foundation

class ServicoDeComprovantesMock: ServicoDeComprovantesProtocol {
    
    func atualizarComprovantes() async throws -> Data {
        guard let bundle = Bundle.main.url(forResource: "DadosComprovantes", withExtension: "json") else {
            throw ErrorsDasAplicacao.naoFoiPossivelRecuperarDados
        }
        return try Data(contentsOf: bundle)
    }
}
