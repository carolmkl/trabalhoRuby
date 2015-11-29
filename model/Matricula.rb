class Matricula

  @disciplinas = Array.new
  def initialize(cd_matricula, aluno, periodo, disciplinas)
    @cd_matricula = cd_matricula
    @aluno = aluno
    @periodo = periodo
    @disciplinas = disciplinas
  end #initialize

  def RA
    @ra
  end

  def altera(aluno, periodo, disciplinas)
    @aluno = aluno
    @periodo = periodo
    @disciplinas = disciplinas
  end

  def incluiDisciplina(disciplina)
    @disciplinas.push(disciplina)
  end

  def valorTotal
    vlr = 0
    for disciplina in @disciplinas
      vlr += disciplina.valor
    end
  end

  def to_s
    @cd_matricula << "|" << @aluno << "|" << @periodo << "|" << @disciplinas.to_s << "|" << valorTotal.to_s
  end

end #class