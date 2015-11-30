require '.\exception\CodigoInvalidoException'
require '.\controller\RegistroAcademico.rb'
require '.\view\Manutencao.rb'

class ManutencaoMatricula < Manutencao
  def initialize(hash, registroAcademico,classe,manAluno,manDisciplina)
    super(hash,registroAcademico,classe)
    @manAluno = manAluno
    @manDisciplina = manDisciplina
  end

  def insere
    @manAluno.lista
    puts "Insira o código do aluno:"
    codigo = gets.chomp.to_i
    if @reg.Alunos.key?(codigo)
      aluno = @reg.Alunos[codigo]
      puts "Informe o período da matricula (Ex.:2015/2):"
      periodo = gets.chomp
      disciplinas = informaDisciplinas
      matricula = @reg.incluiMatricula(aluno,periodo,disciplinas)
      puts "Matrícula incluída!"
      puts matricula.to_s_inteiro
    else
      raise CodigoInvalidoException
    end
  end

  def altera
    lista
    puts "Escolha a Matricula [digite o código]:"
    codigo = gets.chomp.to_i
    if @hash.key?(codigo)
      @manAluno.lista
      puts "Insira o código do aluno:"
      codigo = gets.chomp.to_i
      if @reg.Alunos.key?(codigo)
        aluno = @reg.Alunos[codigo]
        puts "Informe o período da matricula (Ex.:2015/2):"
        periodo = gets.chomp
        disciplinas = informaDisciplinas
        matricula = @reg.alteraMatricula(nome,duracao,gradeCurricular)
        puts "Matrícula alterada!"
        puts matricula.to_s_inteiro
      else
        raise CodigoInvalidoException
      end
    else
      raise CodigoInvalidoException
    end
  end

  def informaDisciplinas
    disciplinas = Hash.new
    @manDisciplina.lista
    retorno = 0;
    until retorno == "9" do
      puts "Informe o código da disciplina ou 9 para finalizar"
      retorno = gets.chomp
      if retorno != "9"
        if (@manDisciplina.Hash.key?(retorno) && !disciplinas.key?(retorno))
          disciplinas[retorno] = @manDisciplina.Hash[retorno]
          puts "Incluído!"
        else
          puts "Código inválido"
        end #ifelse
      end #if
    end #until
    disciplinas
  end

end
