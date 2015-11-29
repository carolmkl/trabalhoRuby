require '.\exception\OpcaoInvalidaException'
require '.\controller\RegistroAcademico.rb'
require '.\model\Disciplina.rb'

def manutencaoDisciplina(reg)
  begin
    puts "Manutenção de Disciplinas"
    puts "Escolha uma opção: "
    puts "1) Inclui Disicplina"
    puts "2) Alterar Disicplina"
    puts "3) Remover Disciplina"
    puts "4) Listar Disciplinas"
    puts "5) Voltar ao menu"

    opcao = gets.chomp
    begin
      case opcao
      when "1"
        insereDisciplina(reg)
      when "2"
        alteraDisciplina(reg)
      when "3"
        removeDisciplina(reg)
      when "4"
        listaDisciplinas(reg)
      when "5"
        puts "Voltando ao menu."
      else
        raise OpcaoInvalidaException
      end
    rescue OpcaoInvalidaException
      puts "Você escolheu uma opção inválida. Escolha um número entre 1 e 5, incluídos."
    rescue CodigoInvalidoException
      puts "Código inválido. Informe outro código"
    end
  end while opcao != "5"
end

def insereDisciplina(reg)
  puts "Insira o código da disciplina:"
  codigo = gets.chomp
  if reg.Disciplinas.key?(codigo)
    raise CodigoInvalidoException
  else
    puts "Insira o nome:"
    nome = gets.chomp
    puts "Insira a carga horaria:"
    cargaHoraria = gets.chomp
    puts "Insira o valor: "
    print "R$ "
    valor = gets.chomp
    disciplina = reg.incluiDisciplina(codigo,nome,cargaHoraria.to_i,valor.to_f)
    puts "Disciplina incluída!"
    puts disciplina.to_s
  end
end

def alteraDisciplina(reg)
  listaDisciplinas(reg)
  puts "Escolha a disciplina [digite o código]:"
  codigo = gets.chomp
  if reg.Disciplinas.key?(codigo)
    puts "Insira o nome:"
    nome = gets.chomp
    puts "Insira a carga horaria:"
    cargaHoraria = gets.chomp
    puts "Insira o valor: "
    print "R$ "
    valor = gets.chomp
    disciplina = reg.alteraDisciplina(codigo,nome,cargaHoraria.to_i,valor.to_f)
    puts "Disciplina alterada!"
    puts disciplina.to_s
  else
    raise CodigoInvalidoException
  end
end

def removeDisciplina(reg)
  listaDisciplinas(reg)
  puts "Escolha a disciplina [digite o código]:"
  codigo = gets.chomp
  if reg.Disciplinas.key?(codigo)
    reg.removeDisciplina(codigo)
    puts "Disciplina removida!"
  else
    raise CodigoInvalidoException
  end
end

def listaDisciplinas(reg)
  reg.Disciplinas.each do |k,v|
    puts v.to_s
  end #each
end