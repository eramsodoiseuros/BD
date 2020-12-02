USE mydb;

DELIMITER //

drop procedure if exists getInfoConsulta;
create procedure getInfoConsulta (IN id_consulta INT)

	begin
    
		select m.nome_membro as Nome, c.tipo_consulta as Tipo, n.nome_nutricionista as Nutricionista, c.data_consulta as 'Data'
        from consulta c
        inner join membro m on m.id_membro = c.membro_id_membro
        inner join nutricionista n on n.id_nutricionista = c.nutricionista_id_nutricionista
        where c.id_consulta = id_consulta;
	end //
    
DELIMITER //
    
    call getInfoConsulta(2);