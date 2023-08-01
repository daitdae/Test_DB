43기 박준형

--1
 값의 중복이 없어야한다., NULL값을 가질 수 없다.   
  
--2
 REFERENCES
 
--3
CREATE TABLE categories (
    category_id CHAR(7) CONSTRAINT categories_category_id_pk PRIMARY KEY, CHECK(category_id IN ('WR_PROD','PA_PROD','AR_PROD','ME_PROD','ET_PROD')),
    category_name VARCHAR2(30) CONSTRAINT categories_catogory_name_uqnn UNIQUE, CHECK(category_name IN ('필기구','종이류','미술용품','측정용품','기타')),
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
CREATE SEQUENCE Stock_seq;

--8
SELECT
    d.department_name, l.city, e.count(employee_id)
FROM
    employees e, deparments d, locations l
WHERE
    e.department_ID = d.department_ID
    AND
    d.location_id = l.location_ID;
    
--9 
SELECT
    e.first_name, e.hire_date, d.department_name,
    SUBSTR(sysdate, 1,2) - SUBSTR(hire_date, 1,2)
FROM
    employees e, departments d
WHERE
    e.department_ID = d.department_ID
AND
    SUBSTR(sysdate, 1,2) - SUBSTR(hire_date, 1,2) < 15; 

--10
80번 부서번호인 사원들 중 한 명과 급여가 같거나 커미션이 같은 사원들의 이름, 급여, 커미션, 부서번호
를 서브쿼리와 nvl함수를 이용해 조회하시오. (80번 부서 인원 제외)
SELECT
    first_name, salary, commission_pct, department_id
    NVL(salary




    
  