class Matricula
	attr_acessor : Aluno,Periodo,Disciplinas

	def initialize(cod_matricula, aluno, periodo, disciplinas)
		@numero = cod_matricula
		Aluno = aluno
		Periodo = periodo
		Disciplinas = disciplinas
	end #initialize
	
	def Numero
		@numero
	end
	
	def ValorTotal
	
	end
	

end #class