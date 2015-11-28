class Aluno
	attr_acessor(Nome,Email,Curso)

	def initialize(cod_aluno, nome, email, curso)
		@ra = cod_aluno
    self.Nome = nome
    self.Email = email
    self.Curso = curso
	end #initialize
	
	def RA
		@ra
	end
	

end #class