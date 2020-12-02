USE mydb;

DELIMITER //

drop procedure if exists getTipoInscricao;
create procedure getTipoInscricao (IN id_membro INT)

	begin
    
		select i.nome_tipo as Tipo, m.nome_membro as Nome
        from tipo_de_inscrição i
        inner join membro m on m.tipo_de_inscrição_id_tipo = i.id_tipo
        where m.id_membro = id_membro;
	end //
    
DELIMITER //
    
    call getTipoInscricao(40005216);