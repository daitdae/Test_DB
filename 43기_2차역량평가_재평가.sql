-- cashbook ����
-- ���� ���� ����� ������

drop table cashbook_member;
drop table cashbook_info;

drop sequence cashbook_seq;

--cashbook_member ���̺�
create table cashbook_member(
	memberid 	varchar2(20) primary key					  --����ھ��̵�
	,memberpw	varchar2(100) not null						  --��й�ȣ
	,membername	varchar2(20) not null						  --������̸�
	,enabled	number(1) default 1 check (enabled in (0, 1)) --��������. 1:��밡��, 0:���Ұ���
	,rolename	varchar2(20) default 'ROLE_USER'			  --����� ����
);

--cashbook_info ���̺�
create table cashbook_info(
	infonum		number primary key							-- �Ϸù�ȣ ������ ��ü�� ó��
	,memberid	varchar2(20)
				references cashbook_member(memberid) not null--����� id
	,type		varchar2(20) not null						--����/���� ����
	,memo		varchar2(1000) not null						--����/���� ����
	,amount		number default 0							--����/���� �ݾ�
	,inputdate	date default sysdate						--�ۼ���
);

--cashbook_info ���̺��� �Ϸù�ȣ ������
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

