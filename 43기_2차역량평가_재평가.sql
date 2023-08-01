-- cashbook 예제
-- 개인 일일 가계부 웹서비스

drop table cashbook_member;
drop table cashbook_info;

drop sequence cashbook_seq;

--cashbook_member 테이블
create table cashbook_member(
	memberid 	varchar2(20) primary key					  --사용자아이디
	,memberpw	varchar2(100) not null						  --비밀번호
	,membername	varchar2(20) not null						  --사용자이름
	,enabled	number(1) default 1 check (enabled in (0, 1)) --계정상태. 1:사용가능, 0:사용불가능
	,rolename	varchar2(20) default 'ROLE_USER'			  --사용자 권한
);

--cashbook_info 테이블
create table cashbook_info(
	infonum		number primary key							-- 일련번호 시퀀스 객체로 처리
	,memberid	varchar2(20)
				references cashbook_member(memberid) not null--사용자 id
	,type		varchar2(20) not null						--수입/지출 구분
	,memo		varchar2(1000) not null						--수입/지출 내용
	,amount		number default 0							--수입/지출 금액
	,inputdate	date default sysdate						--작성일
);

--cashbook_info 테이블의 일련번호 시퀀스
create sequence cashbook_seq;

select * from cashbook_member;
select * from cashbook_info;

SELECT EXTRACT(YEAR FROM inputdate) AS year, type, SUM(amount) AS total
FROM cashbook_info
GROUP BY EXTRACT(YEAR FROM inputdate), type
ORDER BY EXTRACT(YEAR FROM inputdate), type;


SELECT EXTRACT(YEAR FROM inputdate) AS year, 
       type, 
       SUM(amount) AS total 
FROM cashbook_info 
GROUP BY EXTRACT(YEAR FROM inputdate), type 
ORDER BY EXTRACT(YEAR FROM inputdate), type;

