create table member( 
	id varchar2(200) primary key,
	pw varchar2(200),
	nickname varchar2(200)
	
)

insert into member values('test', 'test', 'test');

select * from member;

drop table member;