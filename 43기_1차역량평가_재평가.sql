DROP TABLE student;

CREATE TABLE student
(
    stdid           NUMBER(20) PRIMARY KEY 
    ,stdname        VARCHAR2(20) NOT NULL
    ,it             NUMBER(6,2) DEFAULT 0.0 NOT NULL
    ,language       NUMBER(6,2) DEFAULT 0.0 NOT NULL
    ,basic          NUMBER(6,2) DEFAULT 0.0 NOT NULL
);

COMMIT;

INSERT INTO student 
(stdid, stdname, it, language, basic)
VALUES
(15, 'ȫ�浿', 85.5, 92, 79.6);


SELECT * FROM student;
