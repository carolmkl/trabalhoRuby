class Disciplina
  attr_acessor(Nome,CargaHoraria,Valor)

	def init(cod_disciplina, nome, carga_horaria, valor)
		@codigo = cod_disciplina
		self.Nome = nome
		self.CargaHoraria = carga_horaria
		self.Valor = valor
	end #initialize
	
	def Codigo
		@codigo
	end
	

end #class