USE mydb;

DELIMITER //

drop procedure if exists getMarcacaoAulas;
create procedure getMarcacaoAulas (IN id_pt INT)

	begin
    
		select a.nome_aulas as Tipo, m.nome_membro as Membro, a.data_aulas as 'Data', p.nome_pt as PT, a.id_aulas as ID, a.ginasio_id_ginasio as Ginásio
        from aulas a
        inner join membro m on m.id_membro = a.membro_id_membro
        inner join pt p on p.id_pt = a.pt_id_pt
        where a.pt_id_pt = id_pt;
	end //
    
DELIMITER //
    
    call getMarcacaoAulas(10004122);