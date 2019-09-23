create table LOCATION (
	location_id number(10) not null,
	address varchar2(255) not null,
	city varchar2(255) not null,
	country varchar2(255) not null,
	currency varchar2(3) null,
	name varchar2(255) not null,
	price number(4,2) not null,
	state varchar2(255) not null,
	zip varchar2(255) not null,
	constraint pk_location_id primary key (location_id)
);

-- Generate ID using sequence and trigger
create sequence LOCATION_seq start with 1 increment by 1;

create or replace trigger LOCATION_seq_tr
             before insert on LOCATION for each row
             when (new.location_id is null)
            begin
 select LOCATION_seq.nextval into :new.location_id from dual;
end;
/
