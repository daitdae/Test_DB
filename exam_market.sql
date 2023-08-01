-- 중고거래 사이트 예제


-- 회원정보 테이블
create table market_member (
	memberid     VARCHAR2(20)  PRIMARY KEY     		--사용자 식별ID
    , memberpw   VARCHAR2(100) NOT NULL   			--비밀번호
    , membername VARCHAR2(20)  NOT NULL   			--사용자이름
    , phone 	 VARCHAR2(20)  NOT NULL   	        --전화번호
    , enabled    NUMBER(1) DEFAULT 1				--계정 상태(숫자 1:사용가능 0:불가능)
    , rolename   VARCHAR2(20) DEFAULT 'ROLE_USER'	--Role(회원등급)('ROLE_USER':일반회원,'ROLE_ADMIN':관리자)
);

SELECT * FROM market_member;

-- 판매글 테이블
create table market_board (
	boardnum 	 NUMBER PRIMARY KEY								 --글번호
	,memberid	 VARCHAR2(20)  NOT NULL	     					 --작성자 아이디
	,title 		 VARCHAR2(200) NOT NULL							 --글 제목
	,contents 	 VARCHAR2(2000) NOT NULL						 --글 본문내용
	,inputdate 	 DATE DEFAULT SYSDATE							 --작성일
	,category	 VARCHAR2(50)									 --상품분류
	,soldout	 CHAR(1)	DEFAULT 'N'						     --판매완료여부
	,buyerid	 VARCHAR2(20)								     --구매자아이디
);

--판매글 일련번호 시퀀스
CREATE SEQUENCE market_board_seq;

SELECT * FROM market_board;

-- 리플 테이블
create table market_reply (
	replynum 	NUMBER PRIMARY KEY                                          --댓글번호
    ,boardnum   NUMBER REFERENCES market_board(boardnum) ON DELETE CASCADE  --본문글번호
    ,memberid   VARCHAR2(20)   NOT NULL       					            --작성자 ID
    ,replytext 	VARCHAR2(500)                                  				--리플내용
    ,inputdate 	DATE DEFAULT SYSDATE       
);

--리플 일련번호 시퀀스
CREATE SEQUENCE  market_reply_seq;

SELECT * FROM market_reply;
 
--커밋
COMMIT;
