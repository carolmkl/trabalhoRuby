class Curso

  @gradeCurricular = Hash.new
  def initialize(cod_curso, nome, duracao, gradeCurricular)
    @cod_curso = cod_curso
    @nome = nome
    @duracao = duracao
    @gradeCurricular = gradeCurricular
  end #initialize

  def Codigo
    @cod_curso
  end

  def Duracao
    @duracao
  end
  
  def Nome
    @nome
  end

  def GradeCurricular
    @gradeCurricular
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
    texto = "Nome: %s" % [@nome]
    texto.to_s
  end

  def to_s_inteiro
    texto = "%d | Nome: %s | Duração: %d semestre(s)\nGrade Curricular:\n%s" % [@cod_curso,@nome,@duracao,@gradeCurricular.to_s]
    texto.to_s 
  end

end #class