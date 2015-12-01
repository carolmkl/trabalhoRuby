require '..\exception\OpcaoInvalidaException'
require '..\controller\RegistroAcademico'

require_relative 'ManutencaoAluno'
require_relative 'ManutencaoCurso'
require_relative 'ManutencaoDisciplina'
require_relative 'ManutencaoMatricula'

@reg = RegistroAcademico.new
@reg.popularDados
@manDisciplina = ManutencaoDisciplina.new(@reg.Disciplinas,@reg,"Disciplina")
@manCurso = ManutencaoCurso.new(@reg.Cursos,@reg,"Curso",@manDisciplina)
@manAluno = ManutencaoAluno.new(@reg.Alunos,@reg,"Aluno",@manCurso)
@manMatricula = ManutencaoMatricula.new(@reg.Matriculas,@reg,"Matricula",@manAluno,@manDisciplina)

begin #while

  puts "Escolha uma opção: "
  puts "1) Manutenção de Alunos"
  puts "2) Manutenção de Cursos"
  puts "3) Manutenção de Disciplinas"
  puts "4) Manutenção de Matriculas"
  puts "5) Sair"

  opcao = gets.chomp

  begin
    case opcao
    when "1"
      @manAluno.mostraMenu
    when "2"
      @manCurso.mostraMenu
    when "3"
      @manDisciplina.mostraMenu
    when "4"
      @manMatricula.mostraMenu
    when "5"
      puts "Adeus."
    else
      raise OpcaoInvalidaException
    end #case
  rescue OpcaoInvalidaException
    puts "Você escolheu uma opção inválida. Escolha um número entre 1 e 5, incluídos."
  rescue Exception => ex
    puts "Foi lançada a exceção: #{ex}"
  end #rescue
end while opcao != "5"