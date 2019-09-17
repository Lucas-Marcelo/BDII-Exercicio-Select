create database ETEC_HAS_FUNC

use ETEC_HAS_FUNC

create table Cargo (
	cd_cargo integer		not null	primary key,
	ds_cargo varchar(40)	not null
);

create table Departamento (
	cd_depto integer		not null	primary key,
	nm_depto varchar(40)	not null,
	sg_depto varchar(5)		not null 
);

create table Funcionario (
	cd_func		  integer		not null	primary key,
	nm_pnome_func varchar(50)	not null,
	nm_unome_func varchar(30)	not null,
	dt_inicio	  date			not null,
	vl_salario	  numeric(9,2)  not null,
	end_func	  varchar(50)	not null,
	cargo_cd_cargo			integer		constraint fk_cd_cargo foreign key(cargo_cd_cargo)		  references Cargo(cd_cargo),
	departamento_cd_depto	integer		constraint fk_cd_depto foreign key(departamento_cd_depto) references Departamento(cd_depto)
);


/*Todas as informações sobre o cargo Contador*/
select cd_Cargo as 'Cod Cargo', ds_cargo as 'Nome Cargo'
from Cargo
where ds_cargo = 'contador'

/*Todos os dados de cd_depto e sg_depto correspondente ao departamento 20 e 40*/
select cd_depto as 'Cod Departamento', sg_depto as 'Sigla Departamento'
from Departamento
where cd_depto in (20,40)

/*Informações dos funcionários com 2500 ou mais de salário*/
select cd_func							as 'Cod Funcionário',
	   departamento_cd_depto			as 'Cod Cargo',
	   nm_pnome_func+' '+nm_unome_func  as 'Nome',
	   vl_salario						as 'Valor Salário'
from Funcionario
where vl_salario >= 2500

/*Informações dos funcionários entre as datas de inicio de 2015-06-01 e 2015-08-01 ordenadas pelo Cod do funcionário*/
select * from Funcionario
where dt_inicio between '2015-06-01' and '2015-08-01'
order by cd_func 

/*Informações dos funcionários que começam com a letra 'A'*/
select cd_func							as 'Cod Funcionário',
	   nm_pnome_func+' '+nm_unome_func  as 'Nome Funcionário',
	   dt_inicio						as 'Data de inicio',
	   vl_salario						as 'Valor Salário',
       end_func							as 'Endereço Funcionário'
from Funcionario
where nm_pnome_func like 'a%' or nm_pnome_func like 'A%' 


select * from Cargo
select * from Departamento
select * from Funcionario