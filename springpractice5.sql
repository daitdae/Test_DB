--SpringPractice 5 예제 테이블 구조
--회원정보

DROP TABLE springpractice5_member;

CREATE TABLE springpractice5_member(
	memberid 		VARCHAR2(20) PRIMARY KEY --사용자 식별 ID
	,memberpw 		VARCHAR2(100) NOT NULL --비밀번호
	,membername 	VARCHAR2(30) NOT NULL --사용자 이름
	,email 			VARCHAR2(50) -- 이메일 주소
	,phone			VARCHAR2(50) -- 전화번호
	,address VARCHAR2(150) --주소
	,enabled NUMBER(1) DEFAULT 1 --계정상태(숫자1: 사용가능 0:불가능)
	,rolename VARCHAR2(20) DEFAULT 'ROLE_USER'
);

SELECT * FROM springpractice5_member;

-- 멤버 저장 sql 구문
INSERT INTO 
	springpractice5_member (memberid, memberpw, membername, email, phone, address) 
VALUES 
	('aaa','111','홍길동','aaa@aaa.com','010-1111-1111','서울시 강남구 삼성동 1111');

COMMIT;