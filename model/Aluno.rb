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
    @ra.to_s << "|" << @nome << "|" << @email << "|" << @curso.to_s
  end

end #class