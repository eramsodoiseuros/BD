USE mydb;
DELIMITER //
drop procedure if exists getAulasPorMembro;
create procedure getAulasPorMembro (IN id_membro INT)

	begin
		select a.nome_aulas as Aula, a.data_aulas as 'Data'
        from aulas a
        inner join membro m on a.membro_id_membro = m.id_membro
        where a.membro_id_membro = id_membro;
	end //
    
DELIMITER //
    
    call getAulasPorMembro(40005124);
