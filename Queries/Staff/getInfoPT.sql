USE mydb;

DELIMITER //

drop procedure if exists getInfoPT;
create procedure getInfoPT (IN id_pt INT)

	begin
    
		select p.nome_pt as Nome, p.ginásio_id_ginásio as Ginásio
        from pt p
        where p.id_pt = id_pt;
	end //
    
DELIMITER //
    
    call getInfoPT(10004122);