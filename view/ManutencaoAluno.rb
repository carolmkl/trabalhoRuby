require '.\exception\OpcaoInvalidaException'
require '.\controller\RegistroAcademico.rb'
require '.\view\Manutencao.rb'

class ManutencaoAluno < Manutencao
  
  def initialize(hash, registroAcademico,classe,manCursos)
    super hash,registroAcademico,classe
    @manCursos = manCursos
  end

  def insere
    puts "Insira o nome:"
    nome = gets.chomp
    puts "Insira o e-mail:"
    email = gets.chomp
    @manCursos.lista
    puts "Escolha curso [digite o código]: "
    curso = gets.chomp
    @reg.incluiAluno(nome,email,curso.to_i)
  end

  def altera
    lista
    puts "Escolha o aluno [digite o código]:"
    codigo = gets.chomp
    puts "Insira o nome:"
    nome = gets.chomp
    puts "Insira o e-mail:"
    email = gets.chomp
    @manCursos.lista
    puts "Escolha curso [digite o código]: "
    curso = gets.chomp
    @reg.alteraAluno(codigo.to_i,nome,email,curso.to_i)
  end

end