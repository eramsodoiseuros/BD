USE mydb;
DELIMITER //

drop procedure if exists getConsultasPorMembro;
create procedure getConsultasPorMembro (IN id_membro INT)

	begin
    
		select c.tipo_consulta as Tipo , c.data_consulta as 'Data' , n.nome_nutricionista as Nutricionista
        from consulta c
        left join nutricionista as n on c.nutricionista_id_nutricionista = n.id_nutricionista
        where c.membro_id_membro = id_membro;
	end //
    
DELIMITER //
    
    call getConsultasPorMembro(40005216);