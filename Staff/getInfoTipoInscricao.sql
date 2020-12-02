USE mydb;

DELIMITER //

drop procedure if exists getInfoTipoInscricao;
create procedure getInfoTipoInscricao (IN id_tipo INT)

	begin
    
		select i.nome_tipo as Tipo, m.nome_membro as Nome
        from tipo_de_inscrição i
        inner join membro m on m.tipo_de_inscrição_id_tipo = i.id_tipo
        where m.tipo_de_inscrição_id_tipo = id_tipo;
	end //
    
DELIMITER //
    
    call getInfoTipoInscricao(2);