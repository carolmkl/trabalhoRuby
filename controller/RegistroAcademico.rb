require '.\model\Matricula.rb'
require '.\model\Disciplina.rb'
require '.\model\Curso.rb'
require '.\model\Aluno.rb'

class RegistroAcademico
  @@cdAlunos = 1
  @@cdCursos = 1
  @@cdMatriculas = 1
  def initialize
    @alunos = Hash.new
    @cursos = Hash.new
    @disciplinas = Hash.new
    @matriculas = Hash.new
  end

  #MANUTENÇÃO DE ALUNOS========================
  def incluiAluno(nome,email,codcurso)
    curso = @cursos[codcurso]
    aluno = Aluno.new(@@cdAlunos,nome,email,curso)
    @alunos[@@cdAlunos] = aluno
    @@cdAlunos += 1
  end

  def alteraAluno(cd_aluno,nome,email,codcurso)
    curso = @cursos[codcurso]
    @alunos[cd_aluno].altera(nome,email,curso)
  end

  def removeAluno(cd_aluno)
    @alunos.delete(cd_aluno)
  end

  def mostraAlunos
    for aluno in @alunos.keys();
      puts @alunos[aluno].to_s
    end
  end

  #MANUTENÇÃO DE CURSOS========================
  def incluiCurso(nome,duracao,gradeCurricular)
    curso = Curso.new(@@cdCursos,nome,duracao,gradeCurricular)
    @cursos[@@cdCursos] = curso
    @@cdCursos += 1
  end

  def alteraCurso(cd_curso,nome,duracao,gradeCurricular)
    @cursos[cd_curso].altera(nome,duracao,gradeCurricular)
  end

  def removeCurso(cd_curso)
    @cursos.delete(cd_curso)
  end

  def mostraCursos
    for curso in @cursos.keys();
      puts @cursos[curso].to_s
    end
  end

  #MANUTENÇÃO DE DISCIPLINAS========================
  def incluiDisciplina(codigo, nome, carga_horaria, valor)
    if @disciplinas[codigo] then
    end #if
    disciplina = Disciplina.new(codigo, nome, carga_horaria, valor)
    @disciplinas[codigo] = disciplina
  end

  def alteraDisciplina(cod_disciplina, nome, carga_horaria, valor)
    @disciplinas[cod_disciplina].altera(nome, carga_horaria, valor)
  end

  def removeDisciplina(cd_disciplina)
    @disciplinas.delete(cd_disciplina)
  end

  def Disciplinas
    @disciplinas
  end

  def getDisciplina(cod_disciplina)
    @disciplinas[cod_disciplina]
  end

  #MANUTENÇÃO DE MATRICULAS========================
  def incluiMatricula(aluno, periodo, disciplinas)
    matricula = Matricula.new(@@cdMatriculas,aluno, periodo, disciplinas)
    @matriculas[@@cdMatriculas] = matricula
    @@cdMatriculas += 1
  end

  def alteraMatricula(cd_matricula, aluno, periodo, disciplinas)
    @matriculas[cd_matricula].altera(aluno, periodo, disciplinas)
  end

  def mostraMatriculas
    for matricula in @matriculas.keys();
      puts @matriculas[matricula].to_s
    end
  end

  #ENCAPSULADORES================================
  def cursos
    @cursos
  end

  def disciplinas
    @disciplinas
  end

  def matriculas
    @matriculas
  end

end

#r = RegistroAcademico.new

#TESTE DE ALUNOS=================
#r.incluiAluno("Marco","Marco",1)
#r.incluiAluno("Marco","Marco",2)
#
#r.alteraAluno(2,"José","José",1)
#
#r.removeAluno(2)
#
#r.mostraAlunos
#
#TESTE DE CURSOS=====================
#r.incluiCurso("Computação","3 meses","grade")
#r.incluiCurso("Computação","3 meses","grade")
#
#r.alteraCurso(2,"Fisio","4 meses","grade3")
#
#r.removeCurso(1)
#
#r.mostraCursos
#
#TESTE DE DISCIPLINAS=====================
#r.incluiDisciplina("Grafos",800,400)
#r.incluiDisciplina("Grafos",800,400)
#
#r.alteraDisciplina(2,"Ling Prog",300,100)
#
#r.removeDisciplina(1)
#
#r.mostraDisciplinas
#TESTE DE MATRICULAS=====================

