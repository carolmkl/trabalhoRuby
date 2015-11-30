require '.\exception\OpcaoInvalidaException'
require '.\controller\RegistroAcademico'
require_relative 'ManutencaoAluno'
require_relative 'ManutencaoCurso'
require_relative 'ManutencaoDisciplina'
require_relative 'ManutencaoMatricula'

reg = RegistroAcademico.new

begin
  
  puts "Escolha uma opção: "
  puts "1) Manutenção de Alunos"
  puts "2) Manutenção de Cursos"
  puts "3) Manutenção de Disciplinas"
  puts "4) Manutenção de Matriculas"
  puts "5) Sair"

  opcao = gets.chomp

  case opcao
  when "1"
    manutencaoAluno(reg) #metodo do arquivo ManutencaoAluno
  when "2"
    manutencaoCurso(reg)
  when "3"
    ManutencaoDisciplina.new(reg.Disciplinas,reg,"Disciplina")
  when "4"
    manutencaoMatricula(reg)
  when "5"
    puts "Adeus."
  else
    begin
      raise OpcaoInvalidaException
    rescue Exception
      puts "Você escolheu uma opção inválida. Escolha um número entre 1 e 5, incluídos."
    end
  end
end while opcao != "5"