class Aluno
  def initialize(cod_aluno, nome, email, curso)
    @ra = cod_aluno
    @nome = nome
    @email = email
    @curso = curso
  end #initialize

  def RA
    @ra
  end

  def altera(nome, email, curso)
    @nome = nome
    @email = email
    @curso = curso
  end

  def to_s
    texto = "Nome: %s" % [@nome]
    texto.to_s
  end

  def to_s_inteiro
    texto = "%d | Nome: %s | Email: %s | Curso: %s" % [@ra,@nome,@email,@curso.Nome]
    texto.to_s
  end


end #class