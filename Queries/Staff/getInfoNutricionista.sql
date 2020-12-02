USE mydb;

DELIMITER //

drop procedure if exists getInfoNutricionista;
create procedure getInfoNutricionista (IN id_nutricionista INT)

	begin
    
		select n.nome_nutricionista as Nome, n.ginásio_id_ginásio as Ginásio
        from nutricionista n
        where n.id_nutricionista = id_nutricionista;
	end //
    
DELIMITER //
    
    call getInfoNutricionista(30002142);