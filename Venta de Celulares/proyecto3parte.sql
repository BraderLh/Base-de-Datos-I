use tienda;

create table articulo(
	codigo_art integer not null auto_increment,
    tipo varchar(40) not null,
    diseño varchar(30),
    precioUni decimal(4,2) not null,
    marca varchar(30),
    primary key(codigo_art)
    )engine=InnoDB;
-- alter table articulo add constraint PK_ARTICULO primary key (codigo_art);
alter table articulo auto_increment=1;

create table compra(
	cod_arti_com integer not null,
    DNI_cliente integer not null
    )engine=InnoDB;

alter table compra add constraint PK_COMPRA primary key (cod_arti_com,DNI_cliente);
alter table compra add constraint CO_ARTICULO1 foreign key FK_ARTICULO(cod_arti_com) references articulo(codigo_art)
on delete no action
on update no action;
alter table compra add constraint CO_CLIENTE foreign key FK_CLIENTE(DNI_cliente) references cliente(DNI_cli)
on delete no action
on update no action;

create table venta(
	cod_arti_ven integer not null,
    DNI_vendedor integer not null
    )engine=InnoDB;

alter table venta add constraint PK_VENTA primary key (cod_arti_ven,DNI_vendedor);
alter table venta add constraint CO_ARTICULO2 foreign key FK_ARTICULO(cod_arti_ven) references articulo(codigo_art)
on delete no action
on update no action;
alter table venta add constraint CO_VENDEDOR foreign key FK_EMPLEADO_VENDEDOR(DNI_vendedor) references empleado_vendedor(DNI_vend)
on delete no action
on update no action;

create table almacen(
	numero int not null,
    stock int
    )engine=InnoDB;
alter table almacen add constraint PK_ALMACEN primary key (numero);

create table estante(
	numero_es int not null,
    num_almacen int not null,
    capacidad int
    )engine=InnoDB;
    
alter table estante add constraint PK_ESTANTE primary key(numero_es);
alter table estante add constraint CO_ALMACEN_ESTANTE foreign key FK_ALMACEN_ESTANTE(num_almacen) references almacen(numero)
on delete no action
on update no action;

create table guarda_en(
	num_estante int not null,
    cod_arti_g integer not null
    )engine=InnoDB;

alter table guarda_en add constraint PK_GUARDA_EN primary key(num_estante,cod_arti_g);
alter table guarda_en add constraint CO_ESTANTE foreign key FK_ESTANTE(num_estante) references estante(numero_es)
on delete no action
on update no action;
alter table guarda_en add constraint CO_ARTICULO3 foreign key FK_ARTICULO(cod_arti_g) references articulo(codigo_art)
on delete no action
on update no action;

create table vehiculo(
	placa varchar(20) not null,
    capacidad int not null,
    marca varchar(20) not null,
    tipo varchar(20) not null
    )engine=InnoDB;
alter table vehiculo add constraint PK_VEHICULO primary key(placa);

create table vehiculo_part(
	placa_part varchar(20) not null
    )engine=InnoDB;
    
alter table vehiculo_part add constraint PK_VEHICULO_PART primary key(placa_part);
alter table vehiculo_part add constraint CO_VEHICULO_PART_VEHICULO foreign key FK_VEHICULO_PART_VEHICULO(placa_part) references vehiculo(placa)
on delete no action
on update no action;

create table vehiculo_distri(
	placa_dis varchar(20) not null,
    cod_local_dis int not null
    )engine=InnoDB;
    
alter table vehiculo_distri add constraint PK_VEHICULO_DISTRI primary key(placa_dis);
alter table vehiculo_distri add constraint CO_VEHICULO_DISTRI_VEHICULO foreign key FK_VEHICULO_VEHICULO_DISTRI(placa_dis) references vehiculo(placa)
on delete no action
on update no action;
alter table vehiculo_distri add constraint CO_VEHICULO_DSITRI_DISTRIBUIDORA foreign key FK_DISTRIBUIDORA_VEHICULO_DISTRI(cod_local_dis) references distribuidora(cod_l_dis)
on delete no action
on update no action; 

create table vd_proveedor(
	placa_veh_dis varchar(20) not null,
    DNI_proveedor integer not null
    )engine=InnoDB;
alter table vd_proveedor add constraint PK_VD_PROVEEDOR primary key(placa_veh_dis,DNI_proveedor);
    
alter table vd_proveedor add constraint CO_VEHICULO_DISTRI foreign key FK_VEHICULO_DISTRI(placa_veh_dis) references vehiculo_distri(placa_dis)
on delete no action
on update no action;

alter table vd_proveedor add constraint CO_EMPLEADO_PROVEEDOR1 foreign key FK_EMPLEADO_PROVEEDOR(DNI_proveedor) references empleado_proveedor(DNI_prove)
on delete no action
on update no action;

create table vd_repartidor(
	placa_veh_re varchar(20) not null,
    DNI_repartidor integer not null
    )engine=InnoDB;

alter table vd_repartidor add constraint PK_VD_PROVEEDOR primary key(placa_veh_re,DNI_repartidor);

alter table vd_repartidor add constraint CO_VEHICULO_DISTRI1 foreign key FK_VEHICULO_DISTRI(placa_veh_re) references vehiculo_distri(placa_dis)
on delete no action
on update no action;

alter table vd_repartidor add constraint CO_EMPLEADO_REPADOMI foreign key FK_EMPLEADO_REPADOMI(DNI_repartidor) references empleado_repaDomi(DNI_rd)
on delete no action
on update no action;

create table distribucion(
	cod_art_dis integer not null,
    pla_ve_dis varchar(20) not null,
    cantidad int,
    fecha datetime not null
    )engine=InnoDB;
    
alter table distribucion add constraint PK_DISTRIBUCION primary key(cod_art_dis,pla_ve_dis);

alter table distribucion add constraint CO_VEHICULO_DISTRI2 foreign key FK_VEHICULO_DISTRI(pla_ve_dis) references vehiculo_distri(placa_dis)
on delete no action
on update no action;
alter table distribucion add constraint CO_ARTICULO4 foreign key FK_ARTICULO(cod_art_dis) references articulo(codigo_art)
on delete no action
on update no action;

create table abastecimiento_tienda(
	codArt integer not null,
    DNIprove integer not null,
    cod_tienda char not null,
    cantidad int,
    fecha_abas date not null
    )engine=InnoDB;

alter table abastecimiento_tienda add constraint PK_ABASTECIMIENTO_TIENDA primary key(codArt,DNIprove);

alter table abastecimiento_tienda add constraint CO_ARTICULO5 foreign key FK_ARTICULO(codArt) references articulo(codigo_art)
on delete no action
on update no action;

alter table abastecimiento_tienda add constraint CO_EMPLEADO_PROVEEDOR2 foreign key FK_EMPLEADO_PROVEEDOR(DNIprove) references empleado_proveedor(DNI_prove)
on delete no action
on update no action; 

alter table abastecimiento_tienda add constraint CO_TIENDA foreign key FK_TIENDA(cod_tienda) references tienda(codigo)
on delete no action
on update no action;

    