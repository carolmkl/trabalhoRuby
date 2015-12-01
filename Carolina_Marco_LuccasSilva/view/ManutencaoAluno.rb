require '..\exception\OpcaoInvalidaException'
require '..\controller\RegistroAcademico.rb'
require '..\view\Manutencao.rb'

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
    curso = gets.chomp.to_i
    if @manCursos.Hash.key?(curso)
      aluno = @reg.incluiAluno(nome,email,curso)
      puts "Aluno(a) incluído(a)!"
      puts aluno.to_s_inteiro
    else
      raise CodigoInvalidoException
    end
  end

  def altera
    lista
    puts "Escolha o aluno [digite o código]:"
    codigo = gets.chomp.to_i
    if @hash.key?(codigo)
      puts "Insira o nome:"
      nome = gets.chomp
      puts "Insira o e-mail:"
      email = gets.chomp
      @manCursos.lista
      puts "Escolha curso [digite o código]: "
      curso = gets.chomp
      aluno = @reg.alteraAluno(codigo,nome,email,curso.to_i)
      puts "Aluno(a) alterado(a)!"
    else
      raise CodigoInvalidoException
    end
  end

end