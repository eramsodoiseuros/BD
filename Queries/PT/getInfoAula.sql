USE mydb;

DELIMITER //

drop procedure if exists getInfoAula;
create procedure getInfoAula (IN id_aula INT)

	begin
    
		select m.nome_membro as Nome, a.nome_aulas as Tipo, p.nome_pt as PT, a.data_aulas as 'Data'
        from aulas a
        inner join membro m on m.id_membro = a.membro_id_membro
        inner join pt p on p.id_pt = a.pt_id_pt
        where a.id_aulas = id_aula;
	end //
    
DELIMITER //
    
    call getInfoAula(5);