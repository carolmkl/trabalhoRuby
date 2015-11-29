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
    puts "5) Voltar ao menu"

    opcao = gets.chomp

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
      puts "Voltando ao menu."
    else
      begin
        raise OpcaoInvalidaException
      rescue Exception
        puts "Você escolheu uma opção inválida. Escolha um número entre 1 e 5, incluídos."
      end
    end
  end while opcao != "5"
end

def insereCurso(reg)
  puts "Insira o nome:"
  nome = gets.chomp
  puts "Insira quantos semestres possui o curso:"
  duracao = gets.chomp
  listaDisciplinas(reg)
  gradeCurricular = Hash.new
  
  1..duracao.each do |i|
    gradeCurricular[i] = Hash.new
    retorno = 0;
    until retorno == "9" do
      puts "Informe o código da disciplina para o %do semestre ou 9 para finalizar" % [i]
      retorno = gets.chomp
      
    end #until
  end #each
  
  puts "Escolha curso [digite o código]: "
  reg.mostraCursos()
  curso = gets.chomp
  reg.incluiCurso(nome,email,curso.to_i)
end

def alteraCurso(reg)
  puts "Escolha o Curso [digite o código]:"
  reg.mostraCursos()
  codigo = gets.chomp
  puts "Insira o nome:"
  nome = gets.chomp
  puts "Insira o e-mail:"
  email = gets.chomp
  puts "Escolha curso [digite o código]: "
  reg.mostraCursos()
  curso = gets.chomp
  reg.alteraCurso(codigo.to_i,nome,email,curso.to_i)
end

def removeCurso(reg)
  puts "Escolha o Curso [digite o código]:"
  reg.mostraCursos()
  codigo = gets.chomp
  reg.removeCurso(codigo)
end

def listaCursos(reg)
  reg.mostraCursos
end