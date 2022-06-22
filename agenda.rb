# Funcionalidades:
# Adicionar, editar e remover contatos 
# informações de contato --> nome e telefone 


@agenda = [
    {nome: 'Diego', telefone: "(XX)XXXXX-XXXX"},
    {nome: 'Beatriz', telefone: "(XX)XXXXX-XXXX"}
]  

def todos_contatos
    @agenda.each do |contato| 
        puts "Nome: #{contato[:nome]}\n Telefone: #{contato[:telefone]}"
        puts "------------------------------------------------------"
    end 
end 

def adicionar_contatos
    print"Nome:"
    nome= gets.chomp
    print"Telefone:"
    telefone = gets.chomp

    @agenda << {nome: nome, telefone:telefone}
end 

def ver_contato
    print "Qual contato você deseja ver? "
    nome = gets.chomp
    @agenda.each do |contato| 
        if contato[:nome].downcase.include?(nome.downcase)
            puts"Informações Gerais:\n Nome: #{contato[:nome]}  Telefone: #{contato[:telefone]}}"
        else
            puts "Esse contato não está salvo na sua agenda" *1 
        end 
    end 
end 

def editar_contato
    print "Qual contato você deseja editar? "
    nome = gets.chomp

    @agenda.each do |contato| 
        if contato[:nome].downcase.include?(nome.downcase)
        print "Nome para editar (Se quiser manter o nome aperte Enter)"
        nome_salvo = contato[:nome]

        contato[:nome] = gets.chomp
        contato[:nome] = contato[:nome].empty? ? nome_salvo: contato[:nome]

        print "Telefone para editar (Se quiser manter o número aperte Enter)"
        telefone_salvo = contato[:telefone]

        contato[:telefone] = gets.chomp
        contato[:telefone] = contato[:telefone].empty? ? nome_salvo: contato[:telefone]
        end 
    end 
end 

def remover_contato
    print "Qual contao você deseja remover? "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase ==(nome.downcase)
            indice = @agenda.index(contato)
            @agenda.delete_at(indice)
            puts "Contato excluido!"
            break 
        end 
        
    end 
end 

puts "Menu"

loop do 
    puts " 1.Contatos\n 2. Adicionar Conatos\n 3. Ver Contatos\n 4. Editar Contato\n 5. Remover Contato\n 0. Sair da Agenda\n"

    codigo = gets.chomp.to_i

    case 
        when codigo == 0 
            puts "Até mais!"
            break 
        when codigo == 1 
            todos_contatos
        when codigo == 2 
            adicionar_contatos
        when codigo == 3 
            ver_contato
        when codigo == 4 
            editar_contato
        when codigo == 5 
            remover_contato 
        else 
            puts "Função Inválida"
            puts""
    end 
    
end 


