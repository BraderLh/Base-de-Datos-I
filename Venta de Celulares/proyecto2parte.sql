use tienda;

create table empresa(
	RUC bigint not null,
    nombre varchar(60) not null,
    direccion varchar(60) not null,
    telefono integer,
    email varchar(60),
    unique (email)
    )engine=InnoDB;

create table empComercial(
	RUC_com bigint not null
    )engine=InnoDB;

create table empDistribucion(
	RUC_dis bigint not null
    )engine=InnoDB;
    
create table local_trabajo(
	
    cod_local int not null auto_increment,
    RUC_emp bigint not null,
    nombre varchar(30) not null,
    DNI_gerente integer not null,
    fecha_inicio_g date,
    primary key (cod_local,RUC_emp)
    )engine=InnoDB;
    
/*alter table local_trabajo add constraint CO_LOCAL_TRABAJO_EMPLEADO_GERENTE foreign key FK_EMPLEADO_GERENTE_LOCAL_TRABAJO (DNI_gerente) references empleado (DNI_em)
on delete no action
on update no action;*/

alter table empleado add constraint CO_EMPLEADO_LOCAL_TRABAJO foreign key FK_LOCAL_TRABAJO_EMPLEADO (codigo_local) references local_trabajo(cod_local)
on delete no action
on update no action;
    
create table atencionCli(
	cod_l_ac int not null,
    aforo int not null
    )engine=InnoDB;

create table distribuidora(
	cod_l_dis int not null,
    aforo int not null
    )engine=InnoDB;
    
    create table recepcion(
	cod_l_dis_r int not null,
    numero_ofi int not null
    )engine=InnoDB;
    
    create table paqueteria(
	cod_l_dis_p int not null
    )engine=InnoDB;
		
create table tienda(
	codigo char not null,
	cod_l_t int not null,
	aforo int not null,
    DNI_propie integer not null
    )engine=InnoDB;
    
create table trabaja_en(
	cod_empleado integer not null,
    cod_local_trab integer not null,
    fecha_ini_trab date
    )engine=InnoDB;

alter table trabaja_en add constraint PK_TRABAJA_EN primary key(cod_empleado,cod_local_trab);
alter table trabaja_en add constraint CO_EMPLEADO foreign key FK_EMPLEADO(cod_empleado) references empleado(DNI_em)
on delete no action
on update no action;
alter table trabaja_en add constraint CO_LOCAL_TRABAJO foreign key FK_LOCAL_TRABAJO(cod_local_trab) references local_trabajo(cod_local)
on delete no action
on update no action;

#CLAVES PRIMARIAS DE EMPRESA
alter table empresa add constraint PK_EMPRESA primary key(RUC);
/**/
alter table empComercial add constraint PK_EMPCOMERCIAL primary key (RUC_com);
alter table empDistribucion add constraint PK_EMPDISTRIBUCION primary key (RUC_dis);

-- alter table local_trabajo add constraint PK_LOCAL_TRABAJO primary key (cod_local,RUC_emp);
-- {
alter table tienda add constraint PK_TIENDA primary key (codigo);

alter table atencionCli add constraint PK_ATENCIONCLI primary key (cod_l_ac);

alter table distribuidora add constraint PK_DISTRIBUIDORA primary key (cod_l_dis);
/**/
alter table recepcion add constraint PK_RECEPCION primary key (cod_l_dis_r,numero_ofi);
alter table paqueteria add constraint PK_PAQUETERIA primary key (cod_l_dis_p); 
/**/
-- }
#autoimcrements
alter table local_trabajo auto_increment=1;


#claves foranea EMPRESA-LOCAL
alter table local_trabajo add constraint CO_EMPRESA foreign key FK_EMPRESA (RUC_emp) references empresa (RUC)
on delete no action
on update no action;


#CLAVES FORANEAS QUE HEREDAN DE EMPRESA
alter table empComercial add constraint CO_EMPRESA_EMPCOMERCIAL foreign key FK_EMPRESA_EMPCOMERCIAL (RUC_com) references empresa (RUC)
on delete no action
on update no action;

alter table empDistribucion add constraint CO_EMPRESA_EMPDISTRIBUCION foreign key FK_EMPRESA_EMPDISTRIBUCION (RUC_dis) references empresa (RUC)
on delete no action
on update no action;

#CLAVES FOREANEAS QUE HEREDAN DE LOCAL_TRABAJO
alter table tienda add constraint CO_LOCAL_TRABAJO_TIENDA foreign key FK_TIENDA_LOCAL_TRABAJO (cod_l_t) references local_trabajo (cod_local)
on delete no action
on update no action;

alter table atencionCli add constraint CO_LOCAL_TRABAJO_ATENCIONCLI foreign key FK_ATENCIONCLI_LOCAL_TRABAJO (cod_l_ac) references local_trabajo (cod_local)
on delete no action
on update no action;

alter table distribuidora add constraint CO_LOCAL_TRABAJO_DISTRIBUIDORA foreign key FK_DISTRIBUIDORA_LOCAL_TRABAJO (cod_l_dis) references local_trabajo (cod_local)
on delete no action
on update no action;

#CLAVES FOREANES QUE HEREDAN DE DISTRIBUCION
alter table recepcion add constraint CO_DISTRIBUIDORA_RECEPCION foreign key FK_RECEPCION_DISTRIBUIDORA (cod_l_dis_r) references distribuidora (cod_l_dis)
on delete no action
on update no action;

alter table paqueteria add constraint CO_DISTRIBUIDORA_PAQUETERIA foreign key FK_PAQUETERIA_DISTRIBUIDORA (cod_l_dis_p) references distribuidora (cod_l_dis)
on delete no action
on update no action;