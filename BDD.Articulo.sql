use negocio;
call SP_procedures;
call SP_vistas;

-- Parametros de entrada
drop procedure if exists test;
delimiter //
create procedure SP_test(in descripcion varchar(50))
	begin
		SELECT concat('Hamburguesas',descripcion);
	end;
// delimiter ;
call SP_test('Jamon');

describe articulos;

-- encapsular la tabla clientes

drop procedure if exists SP_articulos_insert;

delimiter //

create procedure SP_articulos_insert(in Pdescripcion varchar(50),Prubro varchar(20), Pcosto double,
		Pprecio double, Pstock varchar(100), Pstock_minimo varchar(20), Pstock_maximo varchar(40))
	begin
		insert into articulos (descripcion,rubro,costo,precio,stock,stock_minimo,stock_maximo) 
			values
		(Pdescripcion, Prubro, Pcosto, Pprecio, Pstock, Pstock_minimo, Pstock_maximo);
    end;
// delimiter ;
 call SP_articulos_insert('Hamburguesa','Carniceria', 450, 500, 200, 50, 100);
 select * from articulos;
 
 drop procedure if exists SP_articulos_remove;
 delimiter //
 create procedure SP_articulos_remove(in Pid int)
 begin
	delete from articulos where id=Pid;
 end;
 // delimiter ;
 call SP_articulos_remove(1);
 select * from articulos;
 
 drop procedure if exists SP_articulos_update;
 
 delimiter //
 create procedure SP_articulos_update(in Pid int, Pdescripcion varchar(50),Prubro varchar(20), Pcosto double,
		Pprecio double, Pstock varchar(100), Pstock_minimo varchar(20), Pstock_maximo varchar(40))
begin
	update articulos set descripcion=Pdescripcion, rubro=Prubro, costo=Pcosto, precio=Pprecio,
			stock=Pstock, stock_minimo=Pstock_minimo, stock_maximo=Pstock_maximo
            where id=Pid;
end;
 // delimiter ;
 select * from articulos;
 call SP_articulos_update(4,'Antitranspirante','Personal','80','100','200','50','100');
 
 
 
 