USE mydb;

DELIMITER //

drop procedure if exists getInfoMembro;
create procedure getInfoMembro (IN id_membro INT)

	begin
    
		select m.nome_membro as Nome, m.peso_membro as Peso, m.altura_membro as Altura, m.data_nascimento_membro as 'Data Nascimento', m.localidade_membro as Localidade, i.nome_tipo as 'Tipo de Inscrição'
        from membro m
        inner join tipo_de_inscrição i on i.id_tipo = m.tipo_de_inscrição_id_tipo
        where m.id_membro = id_membro;
	end //
    
DELIMITER //
    
    call getInfoMembro(40005126);