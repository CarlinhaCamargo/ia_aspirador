import Foundation 

public enum Acoes: Int {
	case aspirar
	case moveDireita
	case moveEsquerda 
	case parar
}


class Agente: NSObject {

	var espaco: Espaco? 
	var movimento: Acoes?
	// private var posicao: Int = 0 			//posicao pode ser 0 - esquerda, 1 - direita

	public init(espaco: Espaco) {
		self.espaco = espaco
		self.movimento = Acoes.moveDireita
	}

	
	/*
	 Configuracao do espaco    
			 ___________
			|     |     |
			|  A  |  B  |
			|_____|_____|

	*/
	public func executaMovimento(espaco: Espaco) -> Acoes {
		let aux: Espaco = Ambiente.shared.espacoA
		switch espaco.retornaEstado(){
			case .sujo:
				return .aspirar
			case .limpo: 
				if espaco ==  aux {
					return .moveDireita
				} else {
					return .moveEsquerda
				}
			default:
				return .parar
		}
	}

}