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
    @cd_disciplina.to_s << "|" << @nome << "|" << @carga_horaria.to_s << "|" << @valor.to_s
  end

end #class