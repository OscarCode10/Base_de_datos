Create database transporte;
Use transporte;

create table Horarios(
	idHorario int unsigned auto_increment primary key,
    horaEntrada time not null,
    horaSalida time not null,
	fecha date
);
create table Conductor(
	numDocConductor int unsigned primary key,
    nombre varchar(255) not null,
    fechaNacimiento date not null,
    caracteConductor varchar(255) not null,
    idHorarioFK int unsigned,
    foreign key (idHorarioFK) references Horarios (idHorario)
);
create table Bus(
	placaBus varchar(255) primary key,
    caracteBus varchar(255) not null,
    precioViaje double unsigned not null,
    idHorarioFK int unsigned not null,
    foreign key (idHorarioFK) references Horarios (idHorario)
);
Create Table Pasajeros(
	numDocPasajeros int unsigned primary key,
    saldoTarjeta double unsigned not null,
    numTarjetaAcceso int unsigned unique,
    caractePasajero varchar(255) not null,
    placaBusFK varchar(255) not null,
    foreign key (placaBusFK) references Bus (placaBus)
);
Create Table Rutas(
	numRutas int unsigned primary key auto_increment,
    direcInicial varchar(255) not null,
    direcFinal varchar(255) not null,
    tiempoEstimado varchar(255) not null,
    numParadas int unsigned not null
);
create table Conductor_Rutas(
	idConductorRutas int unsigned primary key auto_increment,
    numDocConductorFK int unsigned,
    numRutasFK int unsigned,
    foreign key (numDocConductorFK) references Conductor(numDocConductor),
    foreign key (numRutasFK) references Rutas (numRutas)
);
create table Bus_Rutas(
	idBusRutas int unsigned primary key auto_increment,
    placaBusFK varchar(255) not null,
    numRutasFK int unsigned,
    foreign key (placaBusFK) references Bus(placaBus),
    foreign key (numRutasFK) references Rutas (numRutas)
);



insert into Horarios (horaEntrada, horaSalida, fecha) values("10:00", "9:00", "23/04/26");
insert into Horarios (horaEntrada, horaSalida, fecha) values("11:00", "8:00", "23/04/27");
insert into Horarios (horaEntrada, horaSalida, fecha) values("12:00", "7:00", "23/04/28");
insert into Horarios (horaEntrada, horaSalida, fecha) values("13:00", "6:00", "23/04/29");
insert into Horarios (horaEntrada, horaSalida, fecha) values("14:00", "5:00", "23/04/30");
insert into Horarios (horaEntrada, horaSalida, fecha) values("15:00", "4:00", "23/05/30");
insert into Horarios (horaEntrada, horaSalida, fecha) values("16:00", "3:00", "23/05/01");
insert into Horarios (horaEntrada, horaSalida, fecha) values("17:00", "2:00", "23/04/02");
insert into Horarios (horaEntrada, horaSalida, fecha) values("18:00", "1:00", "23/04/03");
insert into Horarios (horaEntrada, horaSalida, fecha) values("19:00", "12:00", "23/04/04");

select * from Horarios;

insert into Bus (placaBus, caracteBus, precioViaje, idHorarioFk) values("ND1-MW2", "LINDO", "4000","1");
insert into Bus (placaBus, caracteBus, precioViaje, idHorarioFk) values("AB3-MW1", "LINDO", "4000","2");
insert into Bus (placaBus, caracteBus, precioViaje, idHorarioFk) values("TN6-MÑ8", "LINDO", "4000","3");
insert into Bus (placaBus, caracteBus, precioViaje, idHorarioFk) values("PO6-TY5", "LINDO", "4000","4");
insert into Bus (placaBus, caracteBus, precioViaje, idHorarioFk) values("AS1-TY2", "LINDO", "4000","5");
insert into Bus (placaBus, caracteBus, precioViaje, idHorarioFk) values("KQ1-TY7", "LINDO", "4000","6");
insert into Bus (placaBus, caracteBus, precioViaje, idHorarioFk) values("PO1-T75", "LINDO", "4000","7");
insert into Bus (placaBus, caracteBus, precioViaje, idHorarioFk) values("ASA-OP1", "LINDO", "4000","8");
insert into Bus (placaBus, caracteBus, precioViaje, idHorarioFk) values("ND7-LO2", "LINDO", "4000","9");
insert into Bus (placaBus, caracteBus, precioViaje, idHorarioFk) values("ND8-TN1", "LINDO", "4000","10");

select * from Bus;

insert into Pasajeros (numDocPasajeros, saldoTarjeta, numTarjetaAcceso, caractePasajero, placaBusFK) values ("1","1000","1","feo","ND1-MW2");
insert into Pasajeros (numDocPasajeros, saldoTarjeta, numTarjetaAcceso, caractePasajero, placaBusFK) values ("2","2000","2","feo","AB3-MW1");
insert into Pasajeros (numDocPasajeros, saldoTarjeta, numTarjetaAcceso, caractePasajero, placaBusFK) values ("3","3000","3","feo","TN6-MÑ8");
insert into Pasajeros (numDocPasajeros, saldoTarjeta, numTarjetaAcceso, caractePasajero, placaBusFK) values ("4","4000","4","feo","PO6-TY5");
insert into Pasajeros (numDocPasajeros, saldoTarjeta, numTarjetaAcceso, caractePasajero, placaBusFK) values ("5","5000","5","feo","AS1-TY2");
insert into Pasajeros (numDocPasajeros, saldoTarjeta, numTarjetaAcceso, caractePasajero, placaBusFK) values ("6","6000","6","feo","KQ1-TY7");
insert into Pasajeros (numDocPasajeros, saldoTarjeta, numTarjetaAcceso, caractePasajero, placaBusFK) values ("7","7000","7","feo","PO1-T75");
insert into Pasajeros (numDocPasajeros, saldoTarjeta, numTarjetaAcceso, caractePasajero, placaBusFK) values ("8","8000","8","feo","ASA-OP1");
insert into Pasajeros (numDocPasajeros, saldoTarjeta, numTarjetaAcceso, caractePasajero, placaBusFK) values ("9","9000","9","feo","ND7-LO2");
insert into Pasajeros (numDocPasajeros, saldoTarjeta, numTarjetaAcceso, caractePasajero, placaBusFK) values ("10","10000","10","feo","ND8-TN1");

select * from Pasajeros;

insert into Rutas(direcInicial, direcFinal, tiempoEstimado, numParadas) values("kr 111 #129-97","calle 72 No. 45-16","1 hora","10");
insert into Rutas(direcInicial, direcFinal, tiempoEstimado, numParadas) values("kr 112 #129-97","calle 72 No. 45-16","40 min","11");
insert into Rutas(direcInicial, direcFinal, tiempoEstimado, numParadas) values("kr 113 #129-97","calle 72 No. 45-16","10 min","12");
insert into Rutas(direcInicial, direcFinal, tiempoEstimado, numParadas) values("kr 114 #129-97","calle 72 No. 45-16","30 min","13");
insert into Rutas(direcInicial, direcFinal, tiempoEstimado, numParadas) values("kr 115 #129-97","calle 72 No. 45-16","1 hora","14");
insert into Rutas(direcInicial, direcFinal, tiempoEstimado, numParadas) values("kr 116 #129-97","calle 72 No. 45-16","2 horas","15");
insert into Rutas(direcInicial, direcFinal, tiempoEstimado, numParadas) values("kr 117 #129-97","calle 72 No. 45-16","1 hora y media","16");
insert into Rutas(direcInicial, direcFinal, tiempoEstimado, numParadas) values("kr 118 #129-97","calle 72 No. 45-16","38 min","17");
insert into Rutas(direcInicial, direcFinal, tiempoEstimado, numParadas) values("kr 119 #129-97","calle 72 No. 45-16","3 horas","18");
insert into Rutas(direcInicial, direcFinal, tiempoEstimado, numParadas) values("kr 110 #129-97","calle 72 No. 45-16","4 horas","19");

select * from Rutas;

insert into Conductor(numDocConductor, nombre, fechaNacimiento, caracteConductor) values("1","Oscar1","05/11/04","Lindo");
insert into Conductor(numDocConductor, nombre, fechaNacimiento, caracteConductor) values("2","Oscar2","05/11/05","Lindo");
insert into Conductor(numDocConductor, nombre, fechaNacimiento, caracteConductor) values("3","Oscar3","05/11/06","Lindo");
insert into Conductor(numDocConductor, nombre, fechaNacimiento, caracteConductor) values("4","Oscar4","05/11/07","Lindo");
insert into Conductor(numDocConductor, nombre, fechaNacimiento, caracteConductor) values("5","Oscar5","05/11/08","Lindo");
insert into Conductor(numDocConductor, nombre, fechaNacimiento, caracteConductor) values("6","Oscar6","05/11/09","Lindo");
insert into Conductor(numDocConductor, nombre, fechaNacimiento, caracteConductor) values("7","Oscar7","05/11/10","Lindo");
insert into Conductor(numDocConductor, nombre, fechaNacimiento, caracteConductor) values("8","Oscar8","05/11/11","Lindo");
insert into Conductor(numDocConductor, nombre, fechaNacimiento, caracteConductor) values("9","Oscar9","05/11/12","Lindo");
insert into Conductor(numDocConductor, nombre, fechaNacimiento, caracteConductor) values("10","Oscar10","05/11/13","Lindo");

select * from Conductor;

insert into Conductor_Rutas(numDocConductorFK, numRutasFK) values("1","1");
insert into Conductor_Rutas(numDocConductorFK, numRutasFK) values("2","2");
insert into Conductor_Rutas(numDocConductorFK, numRutasFK) values("3","3");
insert into Conductor_Rutas(numDocConductorFK, numRutasFK) values("4","4");
insert into Conductor_Rutas(numDocConductorFK, numRutasFK) values("5","5");
insert into Conductor_Rutas(numDocConductorFK, numRutasFK) values("6","6");
insert into Conductor_Rutas(numDocConductorFK, numRutasFK) values("7","7");
insert into Conductor_Rutas(numDocConductorFK, numRutasFK) values("8","8");
insert into Conductor_Rutas(numDocConductorFK, numRutasFK) values("9","9");
insert into Conductor_Rutas(numDocConductorFK, numRutasFK) values("10","10");

select * from Conductor_Rutas;

insert into Bus_Rutas (placaBusFK, numRutasFK) value("ND1-MW2","1");
insert into Bus_Rutas (placaBusFK, numRutasFK) value("AB3-MW1","2");
insert into Bus_Rutas (placaBusFK, numRutasFK) value("TN6-MÑ8","3");
insert into Bus_Rutas (placaBusFK, numRutasFK) value("PO6-TY5","4");
insert into Bus_Rutas (placaBusFK, numRutasFK) value("AS1-TY2","5");
insert into Bus_Rutas (placaBusFK, numRutasFK) value("KQ1-TY7","6");
insert into Bus_Rutas (placaBusFK, numRutasFK) value("PO1-T75","7");
insert into Bus_Rutas (placaBusFK, numRutasFK) value("ASA-OP1","8");
insert into Bus_Rutas (placaBusFK, numRutasFK) value("ND7-LO2","9");
insert into Bus_Rutas (placaBusFK, numRutasFK) value("ND8-TN1","10");

#1
select horaEntrada as horaEntrad from Horarios;
select nombre as nombres from Conductor;
select caracteBus as caracteristicasBus from Bus;
select saldoTarjeta as saldoTarje from Pasajeros;
select direcInicial as direccionInicial from Rutas;
select numDocConductorFK as numDocConductorfk from Conductor_Rutas;
select placaBusFK as placaBusfk from Bus_Rutas;
#2
select * from Horarios limit 5;
select * from Conductor limit 5;
select * from Rutas limit 5;
select * from Pasajeros limit 5;
select * from Bus limit 5;
select * from Conductor_Rutas limit 5;
select * from Bus_Rutas limit 5;
#3 
select count(*) from Horarios where idHorario="2" or idHorario="4" or idHorario="6" or idHorario="8" or idHorario="10";
select count(*) from Conductor where numDocConductor="2" or numDocConductor="4" or numDocConductor="6" or numDocConductor="8" or numDocConductor="10";
select count(*) from Rutas where numRutas="2" or numRutas="4" or numRutas="6" or numRutas="8" or numRutas="10"; 
select count(*) from Pasajeros where numDocPasajero="2" or numDocPasajero="4" or numDocPasajero="6" or numDocPasajero="8" or numDocPasajero="10";
select count(*) from Bus where idHorarioFK="2" or idHorarioFK="4" or idHorarioFK="6" or idHorarioFK="8" or idHorarioFK="10";
select count(*) from Conductor_Rutas where numDocConductorFK="2" or numDocConductorFK="4" or numDocConductorFK="6" or numDocConductorFK="8" or numDocConductorFK="10";
select count(*) from Bus_Rutas where numRutasFK="2" or numRutasFK="4" or numRutasFK="6" or numRutasFK="8" or numRutasFK="10";
#4
select * from Horarios inner join Conductor;
select * from Conductor inner join Rutas;
select * from Rutas inner join Bus;
select * from Pasajeros inner join Bus;
select * from Bus inner join Rutas;
select * from Conductor_Rutas inner join Conductor;
select * from Bus_Rutas inner join Bus;





