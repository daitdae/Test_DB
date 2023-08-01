43�� ������

--1
 ���� �ߺ��� ������Ѵ�., NULL���� ���� �� ����.   
  
--2
 REFERENCES
 
--3
CREATE TABLE categories (
    category_id CHAR(7) CONSTRAINT categories_category_id_pk PRIMARY KEY, CHECK(category_id IN ('WR_PROD','PA_PROD','AR_PROD','ME_PROD','ET_PROD')),
    category_name VARCHAR2(30) CONSTRAINT categories_catogory_name_uqnn UNIQUE, CHECK(category_name IN ('�ʱⱸ','���̷�','�̼���ǰ','������ǰ','��Ÿ')),
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
80�� �μ���ȣ�� ����� �� �� ��� �޿��� ���ų� Ŀ�̼��� ���� ������� �̸�, �޿�, Ŀ�̼�, �μ���ȣ
�� ���������� nvl�Լ��� �̿��� ��ȸ�Ͻÿ�. (80�� �μ� �ο� ����)
SELECT
    first_name, salary, commission_pct, department_id
    NVL(salary




    
  