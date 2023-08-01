43기 박준형

--1
 값의 중복이 없어야한다., NULL값을 가질 수 없다.   
  
--2
 REFERENCES
 
--3
CREATE TABLE categories (
    category_id CHAR(7) CONSTRAINT categories_category_id_pk PRIMARY KEY, CHECK(Type IN ('WR_PROD','PA_PROD','AR_PROD','ME_PROD','ET_PROD')),
    category_name VARCHAR2(30) CONSTRAINT categories_catogory_name_uqnn UNIQUE, CHECK(Type IN ('필기구','종이류','미술용품','측정용품','기타')),
    category_desc VARCHAR2(3000) DEFAULT NULL
    );
    
--4
CREATE TABLE Products (
    PROD_ID NUMBER CONSTRAINT Products_PROD_ID_pk PRIMARY KEY,
    PROD_NAME VARCHAR2(30) NOT NULL,
    COUNTRY VARCHAR2(50) NOT NULL,
    MANUFACTURES VARCHAR2(50) NOT NULL,
    making_date DATE,
    category_id CHAR(7) REFERENCES categories(category_id) ON DELETE CASCADE
);

--5
DROP SEQUENCE products_seq;
CREATE SEQUENCE products_seq;

--6
CREATE TABLE Stock(
    STOCK_ID NUMBER CONSTRAINT Stock_Stock_ID_pk PRIMARY KEY,
    PROD_ID NUMBER REFERENCES  Products(PROD_ID) ON DELETE CASCADE,
    RECEIVE_DATE DATE,
    FOWARD_DATE DATE DEFAULT SYSDATE,
    UNIT_PRICE NUMBER(10,2) DEFAULT 0,
    TOTAL_STOCK NUMBER(7)
);

--7
DROP SEQUENCE Stock_seq;
CREATE SEQUENCE Stock_seq;

--8
다음과 같은 부서의 정보를 조회하시오(employees, departments, locations)
(부서명 department_name, 부서위치 city, 부서직원수는 함수사용)
SELECT
    d.department_name ,l.city, count(employee_id)
FROM
    employees e, deparment d, location l
WHERE
    e.department_ID = d.department_ID
    AND
    d.location_id = l.location_ID;




    
  