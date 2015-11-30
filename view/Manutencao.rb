require '.\exception\OpcaoInvalidaException'
require '.\exception\CodigoInvalidoException'
require '.\controller\RegistroAcademico.rb'

class Manutencao #tentativa de herança, ainda precisa esquematizar
  def initialize(hash, registroAcademico,classe)
    @hash = hash
    @reg = registroAcademico
    @classe = classe
  end

  def mostraMenu
    begin
      puts
      puts "Manutenção de %ss" % [@classe]
      puts "Escolha uma opção: "
      puts "1) Inclui %s" % [@classe]
      puts "2) Alterar %s" % [@classe]
      puts "3) Remover %s" % [@classe]
      puts "4) Listar %s" % [@classe]
      puts "5) Descrever %s" % [@classe]
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

  def descreve
    lista
    puts "Digite o código para descrição:"
    codigo = gets.chomp
    if @hash.key?(codigo)
      puts @hash[codigo].to_s_inteiro
    elsif @hash.key?(codigo.to_i)
    puts @hash[codigo.to_i].to_s_inteiro
    else
      raise CodigoInvalidoException
    end
  end

  def remove
    lista
    puts "Digite o código para exclusão:"
    codigo = gets.chomp
    if @hash.key?(codigo) || @hash.key?(codigo.to_i)
      @reg.remove(@hash,codigo)
      puts "%s removido(a)!" % [@classe]
    else
      raise CodigoInvalidoException
    end
  end

  def lista
    puts @hash.to_s
  end

  def Hash
    @hash
  end
end #class

class Hash
  def to_s
    keys.inject([]) do |a, key|
      a << "#{key}: #{fetch(key)}"
    end.join("\n")
  end
end
