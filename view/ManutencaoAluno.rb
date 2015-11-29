require '.\exception\OpcaoInvalidaException'
require '.\model\RegistroAcademico'
require '.\model\Aluno'

def manutencaoAluno(reg)
  begin
    puts "Manutenção de Alunos"
    puts "Escolha uma opção: "
    puts "1) Inclui Aluno"
    puts "2) Alterar Aluno"
    puts "3) Remover Aluno"
    puts "4) Listar Alunos"
    puts "5) Voltar ao menu"

    opcao = gets.chomp

    case opcao
    when "1"
      insereAluno(reg)
    when "2"
      alteraAluno(reg)
    when "3"
      removeAluno(reg)
    when "4"
      listaAlunos(reg)
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

def insereAluno(reg)
  puts "Insira o nome:"
  nome = gets.chomp
  puts "Insira o e-mail:"
  email = gets.chomp
  puts "Escolha curso [digite o código]: "
  reg.mostraCursos()
  curso = gets.chomp
  reg.incluiAluno(nome,email,curso.to_i)
end

def alteraAluno(reg)
  puts "Escolha o aluno [digite o código]:"
  reg.mostraAlunos()
  codigo = gets.chomp
  puts "Insira o nome:"
  nome = gets.chomp
  puts "Insira o e-mail:"
  email = gets.chomp
  puts "Escolha curso [digite o código]: "
  reg.mostraCursos()
  curso = gets.chomp
  reg.alteraAluno(codigo.to_i,nome,email,curso.to_i)
end

def removeAluno(reg)
  puts "Escolha o aluno [digite o código]:"
  reg.mostraAlunos()
  codigo = gets.chomp
  reg.removeAluno(codigo)
end

def listaAlunos(reg)
  reg.mostraAlunos
end