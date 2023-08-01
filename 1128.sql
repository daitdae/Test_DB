/*join
 - cross join : m x n
 - Equi join : pk == fk (FK�ʿ� NULL�� �����ϸ� �����͸� ��ȸ���� ���� �� �ִ�)
 - Self Join : �ϳ��� ���̺� PK�� FK�� �����ϴ� ���
 - Inner / Outer Join : (FK�ʿ� NULL�� �����ϴ��� �����͸� ��ȸ�Ѵ�.)
*/


--cross join
SELECT
    e.first_name, e.salary, d.department_name
FROM
    employees e, departments d;
    
    
--Equi Join ( = ANSI ǥ�ع���� join)
SELECT
    e.first_name, e.salary, d.department_name
FROM
    employees e, departments d
WHERE
    e.department_id = d.department_id; 
    
-- 3���� ���̺�κ��� ��ȸ
SELECT
    e.first_name, d.department_name, l.city
FROM
    employees e, departments d, locations l
WHERE
    e.department_ID = d.department_ID
    AND
    d.location_id = l.location_ID;
    
--[����] �μ���, �������� ��ȸ
SELECT
    d.department_name, l.city
FROM
    departments d, locations l
WHERE
   d.location_id = l.location_id;
    
    
--[����] �ټӳ�� 20�� �̻��� ����� �̸� �Ի��� �μ����� ��ȸ�Ͻÿ�.
SELECT
    e.first_name, e.hire_date, d.department_name,
    SUBSTR(sysdate, 1,2) - SUBSTR(hire_date, 1,2) as"�ټӳ��"
FROM
     employees e, departments d
WHERE
    e.department_ID = d.department_ID
AND
    SUBSTR(sysdate, 1,2) - SUBSTR(hire_date, 1,2) >=20; 
    

--[����] ���ΰ� ���ϵ�ī�带 �̿��ؼ� �̸��� 'A'�� ���Ե� ��� ����� �̸��� �μ����� ��ȸ�Ͻÿ�.
--       (�̶� �̸��� ��ȸ�Ҷ� ��ҹ��� ������ ���� ��ȸ�Ǿ�� ��)
SELECT
    e.first_name, e.hire_date, d.department_name
FROM
     employees e, departments d
WHERE
    e.department_ID = d.department_ID
AND
    UPPER(e.first_name) LIKE '%A%';
    
--[����] 'Seattle' �� �ٹ��ϴ� ��� ������ �μ���ȣ, �̸�, ������(job_title), �μ����� ��ȸ�Ͻÿ�.
SELECT 
    e.department_id, e.first_name, j.job_title, d.department_name
FROM
    departments d, employees e, jobs j, locations l
WHERE
    e.department_ID = d.department_ID
AND
    e.job_id = j.job_id
AND
    d.location_ID = l.location_id
AND
    l.city = 'Seattle'
ORDER BY 
    first_name;
    
--OUTER JOIN        �θ��ʿ� +
SELECT
    e.first_name, e.salary, d.department_name
FROM
    employees e, departments d
WHERE
    e.department_id = d.department_id(+);
    
--[����] �μ���� �Ŵ������� ��ȸ�Ͻÿ�
SELECT
    d.department_name, d.manager_id, e.first_name
FROM 
    departments d, employees e
WHERE
    e.manager_id = d.manager_id;



--Self Join : �ϳ��� ���̺� PK�� FK�� ��� �����ϴ� ��� ���
--������� �Ŵ������� ��ȸ�Ͻÿ�
--��) xxx�� �Ŵ����� xxx�Դϴ�
-- null data�� ������ �θ��ʿ� (+) ���δ�
SELECT
    e1.first_name as"�Ŵ�����", e2.first_name as"������"
FROM
    employees e1, employees e2
WHERE
    e1.employee_id(+) = e2.manager_id
ORDER BY
    e1.first_name;
    
--����̰� �ִ����� �ڽ�
SELECT
    d.department_name, c.country_name, r.region_name, l.location_id
FROM
    departments d, countries c, regions r, locations l
WHERE
    r.region_name(+)  = c.country_name
AND
    c.country_name(+) = l.location_id 
AND 
    l.location_id(+) = d.department_name;
    
/* SUB QUERY
 - �����ȿ� �ٸ� ������ ���ԵǾ� �ִ� ��ɹ�
 
 - main query
   ��ȸ������ ����� ������ �ִ� �ٱ��� ����
   ���������� ���� ����� ���� ���� ������ �����
  
 - sub query
   ���ʿ� ���Ե� ����
   ���������� ���� ����, �� ����� �������� �������̳� FROM ����� ����
   ���������� ������ ����κп��� ���Ǵ°�?
   where, from, select, having, insert into, update set �� */
   
--[����] ����� 162�� ������ �̸��� �޿��� ��ȸ
SELECT 
    first_name, salary
FROM
    employees
WHERE
    employee_id=162;
    
--[����] �޿��� 10500�� ������ ��� ������ ��ȸ
SELECT
    *
FROM
    employees
WHERE 
    salary = 10500;
    
--[����] 162�� ������ �޴� �޿��� ������ �޾��� �޴� ��� ������ ������ ��ȸ�Ͻÿ�(�̰� ��������)
--�ι��� ������ �۾��� �� �ѹ��� �ϴ°�
SELECT
    *
FROM
    employees
WHERE 
    salary = ( 
        SELECT 
            salary
        FROM
            employees
        WHERE
            employee_id=162) ;
            
--[����] ���������� from���� �ִ°�, 
-- 80�� �μ��� �����ȣ, �̸�, �޿�, �μ���ȣ�� ��ȸ�ϴµ� 8000�� �Ѵ� �����
-- rownum �� ���� ��ȣ
SELECT
    rownum, tbl.first_name
FROM
    (SELECT 
        employee_id, first_name, salary, department_id
    FROM
        employees
    WHERE
        department_id = 80) tbl
WHERE
    tbl.salary>8000;
    
--[����] �������� ���� ���̵��°� 'Bruce'��� ������ ������ �μ��� �ٹ��ϴ� ������ ��ȸ�Ͻÿ�
-- ��ȸ ���� ���� ���Ϻμ�(id),  (������:first_name, �μ���: department_name)
SELECT
    e.first_name, d.department_name
FROM
    employees e, departments d
WHERE
    e.department_id = d.department_id   --join������ ������ ��ȸ����
AND
    e.department_id = (
        SELECT
            department_id
        FROM
            employees
        WHERE
            first_name = 'Bruce');
        
--[����] 30�� �μ��� �ٹ��ϴ� ��å�� ������ ��å���� �ٹ��ϴ� ������ �ٸ� �μ����� �ִ��� Ȯ���Ͽ� ������ ��������� �˻�
SELECT
    *
FROM
    employees
WHERE
    job_id IN (
        SELECT DISTINCT 
            job_id
        FROM
            employees
        WHERE
            department_id = 30);
 
    
--[����] ȸ���� ��ü �޿����(6461.xx)���� ���� �޴� ������ ����� ��ȸ�Ͻÿ�
SELECT
    *
FROM
    employees
WHERE   
    salary<(
        SELECT AVG
            (salary)
        FROM
            employees);
    
--[����] �� �������� �ڽ��� �ٹ��ϰ� �ִ� �μ��� ����ӱ��� ����ϴ� SQL ��ɹ���? �̸�,�޿�,�μ���ȣ,�μ���, �μ� ��ձ޿�




    
