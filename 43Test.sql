DROP TABLE todolist;
DROP TABLE personal;
DROP SEQUENCE todolist_seq;

CREATE TABLE personal
(
    email   VARCHAR2(20) PRIMARY KEY, 
    passwd  VARCHAR2(20) NOT NULL,
    usrname VARCHAR2(20) NOT NULL
);
COMMIT;

CREATE TABLE todolist
(
    seqno        NUMBER PRIMARY KEY
    ,email       VARCHAR2(20) REFERENCES personal(email) ON DELETE CASCADE NOT NULL
    ,regdate     DATE default sysdate
    ,todo        VARCHAR2(3000) DEFAULT '���Ͼ���'
    ,importance  VARCHAR2(10) CONSTRAINT todolist_importance_ck CHECK(importance IN ('����','����','����'))
    ,categories  CHAR(6) DEFAULT '����' CONSTRAINT todolist_categories_ck CHECK(categories IN ('����', 'ȸ��'))
);
COMMIT;
--CONSTRAINT todolist_importance_ck �̺κ� �����


CREATE SEQUENCE todolist_seq;

COMMIT;

select * from todolist;

    
SELECT 
    p.passwd, p.usrname, t.seqno, t.regdate, t.todo, t.importance, t.categories
FROM
    personal p, todolist t
WHERE
    p.email=t.email;
    
    
