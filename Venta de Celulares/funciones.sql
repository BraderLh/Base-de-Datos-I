#FUNCIONES

use tienda;

drop function if exists get_Anho;

DELIMITER //
create function get_Anho(fecha DATE) returns integer
begin
	declare anho integer;
    set anho = year(fecha);
    return anho;
end //

/*
DELIMITER ;
DROP FUNCTION IF EXISTS Generate;
DELIMITER //
CREATE FUNCTION Generate() RETURNS DATE
BEGIN
	DECLARE anio date;
	SET anio = (SELECT FROM_UNIXTIME(RAND() * (UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2003-01-01')) + UNIX_TIMESTAMP('2003-01-01')));
    return anio;
END //
DELIMITER ;
#2.-

DROP FUNCTION IF EXISTS NameRandom;
DELIMITER //
CREATE FUNCTION NameRandom() RETURNS VARCHAR(255)
BEGIN
	DECLARE x VARCHAR(255);
	SET x = (SELECT Nombre FROM artista ORDER BY RAND() LIMIT 0, 1);
	RETURN x;
END //
DELIMITER ;

#3.-
DROP FUNCTION IF EXISTS edad_artista;
DELIMITER //
CREATE FUNCTION edad_artista(Nacimiento date,Defuncion date) RETURNS INTEGER
BEGIN
	DECLARE x INTEGER;
	SET x = year(Defuncion)-year(Nacimiento);
	RETURN x;
END //
DELIMITER ;
DROP FUNCTION IF EXISTS MAXIME_DIVISION;
DELIMITER //
CREATE FUNCTION MAXIME_DIVISION(num1 integer, num2 integer) RETURNS INTEGER
BEGIN
	DECLARE x INTEGER;
    WHILE (num2!=0) DO
		SET x = num1;
        SET num1 = num2;
        SET num2 = MOD(x,num2);
	END WHILE;
	RETURN num1;
END //
DELIMITER ;


DROP FUNCTION IF EXISTS InttoSem;
DELIMITER //
CREATE FUNCTION InttoSem(cod integer) RETURNS VARCHAR(10)
BEGIN
	DECLARE x VARCHAR(10);
	SET x = (select dia from dias where id=cod);
	RETURN x;
END //
DELIMITER ;

    
DROP FUNCTION IF EXISTS edad_fecha;

DELIMITER //
CREATE FUNCTION edad_fecha(fn date)RETURNS INTEGER
BEGIN
	DECLARE ex integer;
    set ex=TIMESTAMPDIFF(YEAR, fn, CURDATE());
	RETURN ex;
END //

DELIMITER ;


DROP FUNCTION IF EXISTS Revertir;
DELIMITER //
CREATE FUNCTION Revertir(palabra VARCHAR(255))RETURNS VARCHAR(255)
BEGIN
	DECLARE PAL VARCHAR(255);
    SET PAL = (REVERSE(palabra));
    RETURN PAL;
END //
DELIMITER;*/