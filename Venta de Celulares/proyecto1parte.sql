create database if not exists tienda
	character set utf8
    collate utf8_general_ci;

use tienda;

create table persona(
	DNI integer not null,
    nombres varchar(60) not null,
    apellidos varchar(60) not null,
    direccion varchar(120) not null,
    sexo char not null,
    telefono integer
    ) Engine=InnoDB;
 

create table propietario(
	DNI_pro integer not null,
	fecha_perte date not null
    )engine=InnoDB;

create table empleado(
	DNI_em integer not null,
    anhos_tr int not null,
    turno varchar(10) not null,
    sueldo_e int not null,
    codigo_local int not null
    )engine=InnoDB;
    
create table empleado_gerente(
	DNI_g integer not null
    ) engine=InnoDB;
create table empleado_atenCliente(
	DNI_ac integer not null
	)engine=InnoDB;
create table empleado_repaDomi(
	DNI_rd integer not null,
    num_lic_cond integer not null
    )engine=InnoDB;
create table empleado_servTec(
	DNI_st integer not null
    )engine=InnoDB;
create table empleado_vendedor(
	DNI_vend integer not null
    )engine=InnoDB;
create table empleado_proveedor(
	DNI_prove integer not null,
    num_lic_cond integer
    )Engine=InnoDB;

create table cliente(
	DNI_cli integer not null
    )engine=InnoDB;

create table cliente_frec(
	DNI_cli_fr integer not null
    )engine=InnoDB;


create table cliente_oca(
	DNI_cli_o integer not null
    )engine=InnoDB;

create table cliente_fami(
	DNI_cli_fa integer not null,
    DNIe integer not null
    )engine=InnoDB;

create table cliente_mayo(
	DNI_cli_m integer not null
    )Engine=InnoDB;

#claves primarias de persona y los que heredan de el

alter table persona add constraint PK_PERSONA primary key(DNI);
alter table propietario add constraint PK_PROPIETARIO primary key(DNI_pro);

alter table empleado add constraint PK_EMPLEADO primary key(DNI_em);
/*/*/
alter table empleado_gerente add constraint PK_GERENTE primary key(DNI_g);
alter table empleado_atenCliente add constraint PK_EMPLEADO_ATENCLIENTE primary key(DNI_ac);
alter table empleado_repaDomi add constraint PK_EMPLEADO_REPADOMI primary key(DNI_rd);
alter table empleado_proveedor add constraint PK_EMPLEADO_PROVEEDOR primary key(DNI_prove);
alter table empleado_vendedor add constraint PK_EMPLEADO_VENDEDOR primary key (DNI_vend);
alter table empleado_servTec add constraint PK_EMPLEADO_SERVTEC primary key(DNI_st);
/*/*/

alter table cliente add constraint PK_CLIENTE primary key(DNI_cli);
/*/*/
alter table cliente_frec add constraint PK_CLIENTE_FREC primary key(DNI_cli_fr);
alter table cliente_oca add constraint PK_CLIENTE_OCA primary key(DNI_cli_o);
alter table cliente_fami add constraint PK_CLIENTE_FAMI primary key(DNI_cli_fa,DNIe);
alter table cliente_mayo add constraint PK_CLIENTE_MAYO primary key(DNI_cli_m);
/*/*/

#claves foreaneas de PERSONA: EMPLEADO-PROPIETARIO-CLIENTE

alter table cliente add constraint CO_CLIENTE_PERSONA foreign key FK_CLIENTE_PERSONA (DNI_cli) references persona (DNI)
on delete no action
on update cascade;

alter table propietario add constraint CO_PROPIETARIO_PERSONA foreign key FK_PROPIETARIO_PERSONA (DNI_pro) references persona (DNI)
on delete no action
on update cascade;

alter table empleado add constraint CO_EMPLEADO_PERSONA foreign key FK_EMPLEADO_PERSONA (DNI_em) references persona (DNI)
on delete no action
on update cascade;

#CLAVES FORANEAD QUE HEREDAN DE EMPLEADO
alter table empleado_gerente add constraint CO_EMPLEADO_EMPLEADO_GERENTE foreign key FK_EMPLEADO_GERENTE_EMPLEADO (DNI_g) references empleado (DNI_em)
on delete no action
on update no action;

alter table empleado_atenCliente add constraint CO_EMPLEADO_ATENCLIENTE_CLIENTE foreign key FK_EMPLEADO_ATENCLIENTE_EMPLEADO (DNI_ac) references empleado (DNI_em)
on delete no action
on update cascade;

alter table empleado_proveedor add constraint CO_EMPLEADO_EMPLEADO_PROVEEDOR foreign key FK_EMPLEADO_PROVEEDOR_EMPLEADO (DNI_prove) references empleado (DNI_em)
on delete no action
on update cascade;

alter table empleado_vendedor add constraint CO_EMPLEADO_EMPLEADO_VENDEDOR foreign key FK_EMPLEADO_VENDEDOR_EMPLEADO (DNI_vend) references empleado (DNI_em)
on delete no action
on update cascade;

alter table empleado_repaDomi add constraint CO_EMPLEADO_REPADOMI_CLIENTE foreign key FK_EMPLEADO_REPADOMI_EMPLEADO (DNI_rd) references empleado (DNI_em)
on delete no action
on update cascade;

alter table empleado_servTec add constraint CO_EMPLEADO_SERVTEC_CLIENTE foreign key FK_EMPLEADO_SERVTEC_EMPLEADO (DNI_st) references empleado (DNI_em)
on delete no action
on update cascade;


#CLAVES FORANEAS QUE HEREDAN DE CLIENTE
alter table cliente_frec add constraint CO_CLIENTE_FREC_CLIENTE foreign key FK_CLIENTE_FREC_CLIENTE (DNI_cli_fr) references cliente (DNI_cli)
on delete no action
on update cascade;

alter table cliente_oca add constraint CO_CLIENTE_OCA_CLIENTE foreign key FK_CLIENTE_OCA_CLIENTE (DNI_cli_o) references cliente (DNI_cli)
on delete no action
on update cascade;

alter table cliente_fami add constraint CO_CLIENTE_FAMI_CLIENTE foreign key FK_CLIENTE_FAMI_CLIENTE (DNI_cli_fa) references cliente (DNI_cli)
on delete no action
on update cascade;

alter table cliente_fami add constraint CO_CLIENTE_FAMI_EMPLEADO foreign key FK_CLIENTE_FAMI_EMPLEADO (DNIe) references empleado (DNI_em)
on delete no action
on update no action;

alter table cliente_mayo add constraint CO_CLIENTE_MAYO_CLIENTE foreign key FK_CLIENTE_MAYO_CLIENTE (DNI_cli_m) references cliente (DNI_cli)
on delete no action
on update cascade;


    