USE mydb;
DELIMITER //

drop procedure if exists getMarcacoesMembro;


create procedure getMarcacoesMembro (IN id_membro INT)

	begin
		select  m.nome_membro as Nome, m.id_membro as 'ID Membro' , a.id_aulas as 'Aula ID', a.nome_aulas as Aula, a.data_aulas as 'Data', c.id_consulta as 'Consulta ID', c.tipo_consulta as 'Tipo de Consulta', c.data_consulta as 'Data Consulta'
        from aulas a
        inner join membro m on a.membro_id_membro = m.id_membro
        inner join consulta c on a.membro_id_membro = c.membro_id_membro
        where a.membro_id_membro = id_membro;
	end //
    
DELIMITER //
    
    call getMarcacoesMembro(40005124);