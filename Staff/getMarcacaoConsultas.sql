USE mydb;

DELIMITER //

drop procedure if exists getMarcacaoConsultas;
create procedure getMarcacaoConsultas (IN id_nutricionista INT)

	begin
    
		select c.tipo_consulta as Tipo, m.nome_membro as Paciente, c.data_consulta as 'Data', c.id_consulta as ID, n.nome_nutricionista as Nutricionista, n.ginásio_id_ginásio as Ginásio
        from consulta c
        inner join membro m on m.id_membro = c.membro_id_membro
        inner join nutricionista n on n.id_nutricionista = c.nutricionista_id_nutricionista
        where c.nutricionista_id_nutricionista = id_nutricionista;
	end //
    
DELIMITER //
    
    call getMarcacaoConsultas(30002142);