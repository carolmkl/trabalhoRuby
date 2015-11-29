class Curso

  @gradeCurricular = Hash.new
  
  def initialize(cod_curso, nome, duracao, gradeCurricular)
    @cod_curso = cod_curso
    @nome = nome
    @duracao = duracao
    @gradeCurricular = gradeCurricular
  end #initialize

  def RA
    @ra
  end

  def altera(nome, duracao, gradeCurricular)
    @nome = nome
    @duracao = duracao
    @gradeCurricular = gradeCurricular
  end

  def incluiDisciplina(semestre,disciplina)
    if (semestre < duracao && semestre > 0)
      @gradeCurricular[semestre] = disciplina
    end
  end

  def to_s
    @cod_curso.to_s << "|" << @nome << "|" << @duracao << "|" << @gradeCurricular.to_s
  end

end #class