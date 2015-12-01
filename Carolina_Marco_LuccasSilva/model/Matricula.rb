class Matricula

  @disciplinas = Array.new
  @valorTotal = 0
  def initialize(cd_matricula, aluno, periodo, disciplinas)
    @cd_matricula = cd_matricula
    @aluno = aluno
    @periodo = periodo
    @disciplinas = disciplinas
    calculaValor
  end #initialize

  def RA
    @ra
  end

  def altera(aluno, periodo, disciplinas)
    @aluno = aluno
    @periodo = periodo
    @disciplinas = disciplinas
    calculaValor
  end

  def incluiDisciplina(disciplina)
    @disciplinas.push(disciplina)
  end

  def calculaValor
    @valorTotal = 0
    @disciplinas.each do |k,v|
      @valorTotal += v.Valor
    end
  end

  def to_s
    texto = "Periodo: %s\n Aluno: %s" % [@periodo,@aluno.to_s]
    texto.to_s
  end

  def to_s_inteiro
    texto = "%d | Periodo: %s\nAluno: %s\nDisciplinas: %s\nValor:%d" % [@cd_matricula,@periodo,@aluno.to_s,@disciplinas.to_s,@valorTotal]
    texto.to_s
  end

end #class