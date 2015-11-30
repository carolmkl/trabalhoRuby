require '.\exception\OpcaoInvalidaException'
require '.\controller\RegistroAcademico.rb'
require '.\model\Curso.rb'

require_relative 'ManutencaoDisciplina.rb'

class Manutencao #tentativa de herança, ainda precisa esquematizar
  
  def initialize(hash, registroAcademico,classe)
    @lista = hash
    @reg = registroAcademico
    @classe = classe
  end
  
  def mostraMenu
    begin
      puts "Manutenção de /ss" % [@classe]
      puts "Escolha uma opção: "
      puts "1) Inclui /s" % [@classe]
      puts "2) Alterar /s" % [@classe]
      puts "3) Remover /s" % [@classe]
      puts "4) Listar /s" % [@classe]
      puts "5) Descrever /s" % [@classe]
      puts "6) Voltar ao menu"

      opcao = gets.chomp

      begin
        case opcao
        when "1"
          insere
        when "2"
          altera
        when "3"
          remove
        when "4"
          lista
        when "5"
          descreve
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

  def insere()
    puts "Insira o nome:"
    nome = gets.chomp
    puts "Insira quantos semestres possui o curso:"
    duracao = gets.chomp.to_i
    lista
    gradeCurricular = informaGradeCurricular(reg,duracao)
    curso = reg.incluiCurso(nome,duracao,gradeCurricular)
    puts "Curso incluído!"
    puts curso.to_s_inteiro
  end

  def altera
  end

  def descreve
    lista
    puts "Digite o código para descrição:"
    codigo = gets.chomp
    if @lista.key?(codigo)
      @lista[key].to_s_inteiro
    else
      raise CodigoInvalidoException
    end
  end

  def remove
    lista
    puts "Digite o código para exclusão:"
    codigo = gets.chomp
    reg.removeCurso(codigo)
  end

  def lista
    @lista.each do |k,v|
      puts v.to_s
    end #each
  end

end #class