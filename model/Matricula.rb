class Matricula
	attr_acessor(Aluno,Periodo,Disciplinas)

	def initialize(cod_matricula, aluno, periodo, disciplinas)
		@numero = cod_matricula
    self.Aluno =  aluno
    self.Periodo = periodo
    self.Disciplinas = disciplinas
	end #initialize
	
	def Numero
		@numero
	end
	
	def ValorTotal
	
	end
	

end #class