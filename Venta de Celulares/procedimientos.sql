#PROCEDIMIENTOS
use tienda;

DELIMITER //
#hacemos un descuento a todos los articulos
create procedure sp_descuento()
begin
	update articulo set precioUni=precioUni*0.60;
end; //

DELIMITER ;

#actualizamos el precio de los articuls mediante un parametro
DELIMITER //
create procedure sp_actualizar_precio_pa(in valor decimal(4,2))
begin
	update articulo set precioUni=precioUni*valor;
end; //

DELIMITER ;

-- drop procedure if exists sp_stock_almacen();
DELIMITER //

create procedure sp_stock_almacen()
begin
	update almacen set stock=stock-1;
end; //

DELIMITER ;

/*
drop procedure if exists insert_factura;
DELIMITER //
create procedure insert_factura (IN cod_ob int,IN DNI_pers integer,IN costo decimal(5,2),IN Fecha_prestamo datetime,IN Fecha_devolucion datetime)
begin
declare exit handler for sqlexception
begin
	get diagnostics condition 1 @sqlstate = returned_sqlstate,
    @errno = mysql_errno, @text=message_text;
    set @full_error = CONCAT('ERROR: ',@errno, ' (', @sqlstate, '): ',@text);
    select @full_error;
    rollback;
end;

start transaction;
update obraarte set Nombre=null,Pais=null,cultura=null,Epoca=null where cod_obra=cod_ob;
insert into prestamo values (cod_ob,DNI_pers,costo,Fecha_prestamo,Fecha_devolucion);
commit;
END; //
DELIMITER ;

drop procedure if exists insert_cliente_oca;

DELIMITER //
create procedure insert_exposicion_obraarte(IN cod_obr int, IN cod_exp int)
begin
declare exit handler for sqlexception
begin
	get diagnostics condition 1 @sqlstate = returned_sqlstate,
    @errno = mysql_errno, @text=message_text;
    set @full_error = CONCAT('ERROR: ',@errno, ' (', @sqlstate, '): ',@text);
    select @full_error;
    rollback;
end;
start transaction;
update expo set nombre='VI Feria Fundo el Fierro' where cod_expo=cod_exp;
insert into exposicion values(cod_obr,cod_exp);
commit;
end; //
DELIMITER ;

drop procedure if exists insert_distribucion;

DELIMITER //
create procedure insert_obra_artista (IN id_arti int, IN cod_obra_art int)
begin
declare exit handler for sqlexception
begin
	get diagnostics condition 1 @sqlstate = returned_sqlstate,
    @errno = mysql_errno, @text=message_text;
    set @full_error = CONCAT('ERROR: ',@errno, ' (', @sqlstate, '): ',@text);
    select @full_error;
    rollback;
end;
start transaction;
update artista set Epoca='Contemporaneo' where id_artista=id_arti;
insert into obraartista values(id_arti,cod_obra_art);
commit;
end; //
DELIMITER ;
*/
