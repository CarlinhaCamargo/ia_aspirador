import Foundation 
import Glibc 


public enum Estado {
	case sujo 
	case limpo
}

class Espaco: NSObject {
	private var status: Estado = .limpo	

	public func retornaEstado() -> Estado{
		return status
	}

	public func setEstado(_ status: Estado) {
		self.status = status 
	}
}

class Ambiente: NSObject {
	// private let tamanhoEspaco = 2
	//so existirao dois espacos 
	static var shared: Ambiente = Ambiente()

	var espacoA: Espaco!
	var espacoB: Espaco!
	var aspirador: Agente!

	override public init(){
		
		self.espacoA = Espaco()
		self.espacoB = Espaco()

		// inicialize os estados do ambiente
	 	self.espacoA.setEstado(.sujo)
	 	self.espacoB.setEstado(.sujo)
		
		// inicializa a posicao do agente.
	 	// pode ser randomica, por ora sera fixa em A. 
	 	self.aspirador = Agente(espaco: self.espacoA)
	 	
	}

	public func acaoNoEspaco(_ espaco: Espaco) {

		let acao: Acoes = self.aspirador.executaMovimento(espaco: espaco)
		switch acao {
			case .aspirar:
				espaco.setEstado(.limpo)
				break
			case .moveDireita:
				self.aspirador.espaco = espacoB	
				break
			case .moveEsquerda:
				self.aspirador.espaco = espacoA
				break
			case .parar:
				// fazer nada
				self.aspirador.espaco = espaco
				break
			// default: 
			// 	print("erro fatal ao executar acao")
		}	


	}





	public func mostrarEspacos() {
		print("\nESPACO A\n")		
		print(self.espacoA.retornaEstado())
		print("\nESPACO B\n")		
		print(self.espacoB.retornaEstado())

	}


}