class Curso
	attr_acessor(Nome,Duracao,GradeCurricular)

	def init(cod_curso, nome, duracao, gradeCurricular)
		@codigo = cod_disciplina
		self.Nome = nome
    self.Duracao = duracao
    self.GradeCurricular = gradeCurricular
	end #initialize
	
	def Codigo
		@codigo
	end
	

end #class