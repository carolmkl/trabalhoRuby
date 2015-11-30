require '.\exception\OpcaoInvalidaException'
require '.\controller\RegistroAcademico.rb'
require '.\model\Curso.rb'

require_relative 'ManutencaoDisciplina.rb'

def manutencaoCurso(reg)
  begin
    puts "Manutenção de Cursos"
    puts "Escolha uma opção: "
    puts "1) Inclui Curso"
    puts "2) Alterar Curso"
    puts "3) Remover Curso"
    puts "4) Listar Cursos"
    puts "5) Descrever Curso"
    puts "6) Voltar ao menu"

    opcao = gets.chomp

    begin
      case opcao
      when "1"
        insereCurso(reg)
      when "2"
        alteraCurso(reg)
      when "3"
        removeCurso(reg)
      when "4"
        listaCursos(reg)
      when "5"
        descreveCurso(reg)
      when "6"
        puts "Voltando ao menu."
      else
        raise OpcaoInvalidaException
      end
    rescue OpcaoInvalidaException
      puts "Você escolheu uma opção inválida. Escolha um número entre 1 e 6, incluídos."
    rescue CodigoInvalidoException
      puts "Código inválido. Informe outro código"
    end
  end while opcao != "6"
end

def insereCurso(reg)
  puts "Insira o nome:"
  nome = gets.chomp
  puts "Insira quantos semestres possui o curso:"
  duracao = gets.chomp.to_i
  listaDisciplinas(reg)
  gradeCurricular = informaGradeCurricular(reg,duracao)
  curso = reg.incluiCurso(nome,duracao,gradeCurricular)
  puts "Curso incluído!"
  puts curso.to_s_inteiro
end

def alteraCurso(reg)
  listaCursos()
  puts "Escolha o Curso [digite o código]:"
  codigo = gets.chomp.to_i
  if reg.Cursos.key?(codigo)
    puts "Insira o nome:"
    nome = gets.chomp
    puts "Insira a quantidade de semestres do curso:"
    duracao = gets.chomp.to_i
    gradeCurricular = reg.Cursos[codigo].GradeCurricular
    if reg.Cursos[codigo].Duracao != duracao
      gradeCurricular = informaGradeCurricular(reg,duracao)
    else
      puts "Deseja alterar a grade curricular? [Y|N]"
      if gets.chomp == "Y"
        gradeCurricular = informaGradeCurricular(reg,duracao)
      end
    end
    reg.alteraCurso(codigo.to_i,nome,duracao,gradeCurricular)
  else
    raise CodigoInvalidoException
  end
end

def descreveCurso(reg)
  listaCursos()
  puts "Escolha o Curso [digite o código]:"
  codigo = gets.chomp.to_i
  if reg.Cursos.key?(codigo)
    reg.Cursos[codigo].to_s_inteiro
  else
    raise CodigoInvalidoException
  end
end

def removeCurso(reg)
  listaCursos()
  puts "Escolha o Curso [digite o código]:"
  codigo = gets.chomp.to_i
  if reg.Cursos.key?(codigo)
    reg.removeCurso(codigo)
    puts "Curso removido!"
  else
    raise CodigoInvalidoException
  end
end

def informaGradeCurricular(reg,duracao)
  gradeCurricular = Hash.new

  1..duracao.each do |i|
    gradeCurricular[i] = Hash.new
    retorno = 0;
    until retorno == "9" do
      puts "Informe o código da disciplina para o %do semestre ou 9 para finalizar" % [i]
      retorno = gets.chomp
      if retorno != "9"
        if (reg.Disciplinas.key?(retorno) && !gradeCurricular[i].key?(retorno))
          gradeCurricular[retorno] = reg.Disciplinas[retorno]
          puts "Incluído!"
        else
          puts "Código inválido"
        end #if
      end #if
    end #until
  end #each
  gradeCurricular
end

def listaCursos(reg)
  reg.Cursos.each do |k,v|
    puts v.to_s
  end #each
end

