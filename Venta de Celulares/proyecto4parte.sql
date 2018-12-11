use tienda;

create table factura(
	codigo integer not null auto_increment,
    codA int not null,
    DNIc integer not null,
    DNIv integer not null,
    RUCe bigint not null,
    codTienda char not null,
    precioU decimal(6,2),
    cantidad int,
    fecha datetime not null,
    primary key(codigo)
    )engine=InnoDB;

alter table factura auto_increment=1;

alter table factura add constraint CO_FACTURA_ARTICULO foreign key FK_FACTURA_ARTICULO(codA) references articulo(codigo_art)
on delete no action
on update no action;

alter table factura add constraint CO_FACTURA_CLIENTE foreign key FK_FACTURA_CLIENTE(DNIc) references cliente(DNI_cli)
on delete no action
on update no action;
alter table factura add constraint CO_FACTURA_EMPLEADO_VEND foreign key FK_FACTURA_EMPLEADO_VEND(DNIv) references empleado_vendedor(DNI_vend)
on delete no action
on update no action;
alter table factura add constraint CO_FACTURA_EMPRESA foreign key FK_FACTURA_EMPLEADO_VEND(RUCe) references empresa(RUC)
on delete no action
on update no action;
alter table factura add constraint CO_FACTURA_TIENDA foreign key FK_FACTURA_TIENDA(codTienda) references tienda(codigo)
on delete no action
on update no action;
