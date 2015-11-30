require '.\exception\OpcaoInvalidaException'
require '.\controller\RegistroAcademico.rb'
require '.\model\Disciplina.rb'
require_relative 'Manutencao.rb'

class ManutencaoDisciplina < Manutencao
  
  def initialize(hash, registroAcademico,classe)
    super(hash,registroAcademico,classe)
    mostraMenu
  end
  
  def mostraMenu
    super
  end

  def insere
    puts "Insira o código da disciplina:"
    codigo = gets.chomp
    if @hash.key?(codigo)
      raise CodigoInvalidoException
    else
      puts "Insira o nome:"
      nome = gets.chomp
      puts "Insira a carga horaria:"
      cargaHoraria = gets.chomp
      puts "Insira o valor: "
      print "R$ "
      valor = gets.chomp
      disciplina = @reg.incluiDisciplina(codigo,nome,cargaHoraria.to_i,valor.to_f)
      puts "Disciplina incluída!"
      puts disciplina.to_s
    end
  end

  def altera
    lista
    puts "Escolha a disciplina [digite o código]:"
    codigo = gets.chomp
    if @hash.key?(codigo)
      puts "Insira o nome:"
      nome = gets.chomp
      puts "Insira a carga horaria:"
      cargaHoraria = gets.chomp
      puts "Insira o valor: "
      print "R$ "
      valor = gets.chomp
      disciplina = @reg.alteraDisciplina(codigo,nome,cargaHoraria.to_i,valor.to_f)
      puts "Disciplina alterada!"
      puts disciplina.to_s
    else
      raise CodigoInvalidoException
    end
  end

end
