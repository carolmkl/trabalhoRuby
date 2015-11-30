require '.\exception\OpcaoInvalidaException'
require '.\controller\RegistroAcademico.rb'
require '.\view\Manutencao.rb'

class ManutencaoCurso < Manutencao
  def initialize(hash, registroAcademico,classe,manDisciplina)
    super(hash,registroAcademico,classe)
    @manDisciplina = manDisciplina
  end

  def insere
    puts "Insira o nome:"
    nome = gets.chomp
    puts "Insira quantos semestres possui o curso:"
    duracao = gets.chomp.to_i
    gradeCurricular = informaGradeCurricular(duracao)
    curso = @reg.incluiCurso(nome,duracao,gradeCurricular)
    puts "Curso incluído!"
    puts curso.to_s_inteiro
  end

  def altera
    lista
    puts "Escolha o Curso [digite o código]:"
    codigo = gets.chomp.to_i
    if @hash.key?(codigo)
      puts "Insira o nome:"
      nome = gets.chomp
      puts "Insira quantos semestres possui o curso:"
      duracao = gets.chomp.to_i
      gradeCurricular = @hash[codigo].GradeCurricular
      if @hash[codigo].Duracao != duracao
        gradeCurricular = informaGradeCurricular(duracao)
      else
        puts "Deseja alterar a grade curricular? [Y|N]"
        if gets.chomp == "Y"
          gradeCurricular = informaGradeCurricular(duracao)
        end
      end
      @reg.alteraCurso(codigo.to_i,nome,duracao,gradeCurricular)
    else
      raise CodigoInvalidoException
    end
  end

  def informaGradeCurricular(duracao)
    gradeCurricular = Hash.new
    @manDisciplina.lista
    for i in 1..duracao
      gradeCurricular[i] = Hash.new
      retorno = 0;
      until retorno == "9" do
        puts "Informe o código da disciplina para o %do semestre ou 9 para finalizar" % [i]
        retorno = gets.chomp
        if retorno != "9"
          if (@manDisciplina.Hash.key?(retorno) && !gradeCurricular[i].key?(retorno))
            gradeCurricular[retorno] = @manDisciplina.Hash[retorno]
            puts "Incluído!"
          else
            puts "Código inválido"
          end #if
        end #if
      end #until
    end #for
    gradeCurricular
  end

end
