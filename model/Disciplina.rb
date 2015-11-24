class Disciplina
	attr_acessor : Nome,CargaHoraria,Valor

	def initialize(cod_disciplina, nome, carga_horaria, valor)
		@codigo = cod_disciplina
		Nome = nome
		CargaHoraria = carga_horaria
		Valor = valor
	end #initialize
	
	def Codigo
		@codigo
	end
	

end #class