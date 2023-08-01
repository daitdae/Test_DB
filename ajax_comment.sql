Drop table ajax_comment;
--ajax comment table

CREATE TABLE ajax_comment(
    num	 NUMBER PRIMARY KEY	
    ,name VARCHAR2(20)   NOT NULL
    ,text VARCHAR2(3000) NOT NULL
    );

--게시판 글번호에 사용할 시퀀스
CREATE SEQUENCE ajax_comment_seq;

--리플 작성 SQL구문 예
INSERT INTO
	ajax_comment (num,name,text) 
VALUES 
	(ajax_comment_seq.nextval,'aaa','댓글내용');
	
SELECT * FROM ajax_comment;



COMMIT;