-- spring5 예제 테이블 구조
-- 회원정보

DROP TABLE spring5_member;

CREATE TABLE spring5_member(
    memberid     VARCHAR2(20)  PRIMARY KEY     		--사용자 식별ID
    , memberpw   VARCHAR2(100) NOT NULL   			--비밀번호
    , membername VARCHAR2(30)  NOT NULL   			--사용자이름
    , email      VARCHAR2(50)  						--이메일주소
    , phone 	 VARCHAR2(50)    				    --전화번호
    , address	 VARCHAR2(150)						--주소
    , enabled    NUMBER(1) DEFAULT 1				--계정 상태(숫자 1:사용가능 0:불가능)
    , rolename   VARCHAR2(20) DEFAULT 'ROLE_USER'	--Role(회원등급)('ROLE_USER':일반회원,'ROLE_ADMIN':관리자)
);


SELECT * FROM spring5_member;

-- 글 저장 SQL구문 예
INSERT INTO 
	spring5_member (memberid, memberpw, membername, email, phone, address) 
VALUES 
	('aaa','111','홍길동','aaa@aaa.com','010-1111-1111','서울시 강남구 삼성동 1111');

DELETE FROM spring5_member WHERE memberid = 'zxcv';

-- 커밋
COMMIT;


DROP TABLE spring5_board;

--게시판 글 정보 테이블
CREATE TABLE spring5_board(
	boardnum 	 NUMBER PRIMARY KEY								 --글번호
	,memberid	 VARCHAR2(20) REFERENCES spring5_member(memberid)--작성자 아이디
	,title 		 VARCHAR2(300) NOT NULL							 --글 제목
	,contents 	 VARCHAR2(3000) NOT NULL						 --글 본문내용
	,inputdate 	 DATE DEFAULT SYSDATE							 --작성일
	,hits 		 NUMBER DEFAULT 0								 --조회수
	,originfile  VARCHAR2(300)								 	 --첨부파일 본래이름
	,savedfile 	 VARCHAR2(200)									 --첨부파일이 서버에 저장된이름
);

--게시판 글번호에 사용할 시퀀스
CREATE SEQUENCE spring5_board_seq;

--글 저장 SQL구문 예
INSERT INTO
	spring5_board (boardnum, memberid, title, contents) 
VALUES 
	(spring5_board_seq.nextval, 'aaa', '제목20', '글 내용20');
	
SELECT * FROM spring5_board;

-- 커밋
COMMIT;

--리플 테이블
CREATE TABLE spring5_reply(
    replynum NUMBER PRIMARY KEY                                            --댓글번호
    ,boardnum NUMBER REFERENCES spring5_board(boardnum) ON DELETE CASCADE  --본문글번호
    ,memberid VARCHAR2(20) REFERENCES spring5_member(memberid)             --작성자 ID
    ,replytext VARCHAR2(200) NOT NULL                                      --댓글내용
    ,inputdate DATE DEFAULT SYSDATE                                        -- 작성일
);
--리플번호에 사용할 시퀀스
CREATE SEQUENCE spring5_reply_seq;

--리플 작성 SQL구문 예
INSERT INTO
	spring5_reply (replynum,boardnum, memberid, replytext) 
VALUES 
	(spring5_reply_seq.nextval, 1, 'aaa','댓글내용');
	
SELECT * FROM spring5_reply;