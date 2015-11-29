class Disciplina
  def initialize(cd_disciplina, nome, carga_horaria, valor)
    @cd_disciplina  = cd_disciplina
    @nome = nome
    @carga_horaria = carga_horaria
    @valor = valor
  end #initialize

  def RA
    @ra
  end

  def altera(nome, carga_horaria, valor)
    @nome = nome
    @carga_horaria = carga_horaria
    @valor = valor
  end

  def valor
    @valor
  end

  def to_s
    texto = "Código: %s | Nome: %s | Carga Horária: %d | Valor: R$%.2f" % [@cd_disciplina,@nome,@carga_horaria,@valor]
    texto.to_s
  end

end #class