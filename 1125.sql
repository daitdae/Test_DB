-- 11�� 25��(��)
/* �Լ�, ��������, ����
�����Լ��� ����   
1)������ �Լ�
    - ���ڿ� �Լ� : lower(), upper(), initcap(), {�������� �ش�} length(), concat(), substr(���ڿ�, n), substr(���ڿ�, n1, n2)
                    replace(���ڿ�, ã�� ���ڿ�, �ٲٴ� ���ڿ�)
    - ���� �Լ� : ceil() - �ø�, floor() - ����, round()-�ݿø�
    - ��¥ �Լ� : add_months(), months_between()
    - ��ȯ �Լ� : to_date(), to_number(), to_char()
2)�׷��� �Լ� : �����ϴ� �뵵
*/

SELECT sysdate,systimestamp
FROM dual;

SELECT sysdate, sysdate+1 AS "����", sysdate-1 AS "����"    -- +-�� ����
FROM dual;

SELECT sysdate - '91/11/15'  -- ���� : ���ڿ��� �ν��ؼ� ����, �Ϸ��� ��ȯ�Լ��� ���� ��¥���·� ��ȯ�� �� �۾��ؾ��Ѵ�.
FROM dual;

--�Ի��� ���� ������� �� �ٹ���
SELECT first_name, ceil (sysdate - hire_date) as "�� �ٹ���"    --ceil�̳� floor �־ �Ҽ��� ������
FROM employees
ORDER by "�� �ٹ���" DESC;

-- ADD_MONTH(��¥������,����)
SELECT 
    sysdate, ADD_MONTHS(sysdate, 3), ADD_MONTHS(sysdate, -3)
FROM 
    dual;
    
-- MONTHS_BETWEEN(��¥������,����)
SELECT 
    first_name, hire_date, CEIL(MONTHS_BETWEEN(sysdate, hire_date)) as "�ٹ� ����"
FROM 
    employees;
    
--[����] �ټӳ�� ���ϱ�
SELECT
    first_name, hire_date, 
    ROUND (MONTHS_BETWEEN(sysdate, hire_date), 1) as "�ٹ� ����",  
    CEIL (MONTHS_BETWEEN(sysdate, hire_date)/12) as "�ٹ� ���"
FROM 
    employees
ORDER by "�ٹ� ���";


--��ȯ�Լ��� ��� : TO_DATE(), TO_CHAR(), TO_NUMBER()
--'91/12/25'
SELECT '91/12/25', TO_DATE('91/12/25')+1
FROM dual;

-- �¾�� ���ñ��� ������ ����ߴ��� Ȯ��
SELECT CEIL(sysdate-TO_DATE('89/01/11'))
FROM dual;

--TO_CHAR(��¥,����) : YYYY-MM-DD HH(��) MI(��) SS(��)
SELECT sysdate, TO_CHAR(sysdate, 'YYYY-MM-DD HH:MI:SS (DAY)')
FROM dual;

--TO_NUMBER('1234') ���ڿ� ���¸� ���ڷ� CAST(������,�ڷ���) : �ѹ濡 �ٹٲ�
--�������� �������� Ȯ���ϴ¹� : ���ڴ� ���� ���������� ���ĵǰ� ���ڴ� �������� ���ĵ�
SELECT TO_NUMBER('1234')+2,TO_NUMBER('1234.56')
FROM dual;

--[����] 20���̻� �ٹ��� ������ ����� ��ȸ
--      (�����ȣ(EMPLOYEE_ID),�̸�,�Ի���(YYYY-MM-DD),�ټӳ��(XX�� �ٹ�) )
--      �Ի��� �������� �������� ����
SELECT
    employee_ID, first_name, 
    TO_CHAR(hire_date, 'YYYY-MM-DD'), 
    FLOOR(MONTHS_BETWEEN(sysdate, hire_date)/12) as "�ټӳ��"
FROM
    employees
WHERE
    FLOOR(MONTHS_BETWEEN(sysdate, hire_date)/12)>=20
ORDER BY
    "�ټӳ��" desc;
    

--
--�׷��� �Լ� : COUNT(�÷���) null�����ʹ� ���� �ʴ´�
-- COUNT() : ��ü���ڵ��� ������ ����
-- SUM(�÷���)
-- AVG(�÷���)
-- MIN(�÷���)
-- MAX(�÷���)
SELECT * FROM departments;

SELECT COUNT(*), COUNT(department_name), COUNT(manager_id)
FROM departments;

--[����] �������� �ο����� ���� ������ �ۼ��Ͻÿ�.
SELECT
    COUNT(*)
FROM
    employees;
    
--[����] Ŀ�̼��� �����ϴ� �ο����� ���� ������ �ۼ��Ͻÿ�.
SELECT
    COUNT(commission_pct)
FROM
    employees;
    
--[����] Ŀ�̼��� �������� ���ϴ� �ο����� ���� ������ �ۼ��Ͻÿ�.
SELECT COUNT(*) - COUNT(commission_pct)
FROM employees;

--��ü �ӱ��� �հ�, �ӱ��� ��, �ּұ޿� ���ɾ�, �ִ�޿� ���ɾ�, 
--�ִ�޿� ���ɾװ� �ּұ޿� ���ɾ��� �޿��� SALARY
--SUM(�÷���) AVG(�÷���) MIN(�÷���) MAX(�÷���)

SELECT 
    SUM(salary),
    ROUND(AVG(salary),2),
    MIN(salary),
    MAX(salary),
    MAX(salary)-MIN(salary)
FROM employees;


--�׷��� ��Ų�� �����ϱ�
--GROUP BY,HAVING (�׷�ȭ�� �����Ϳ� ������ �ɰ��� �Ҷ� ���)
SELECT 
    department_id,
    SUM(salary),
    ROUND(AVG(salary),2)
FROM employees
GROUP by department_ID
ORDER by 1; --1��° �÷��̶�� ��

--HAVING
--[����] 7000������ ��ձ޿��� �޴� �μ��� ��ȸ
SELECT 
    department_id,
    SUM(salary),
    ROUND(AVG(salary),2)
FROM employees
GROUP by department_ID
HAVING ROUND(AVG(salary),2)<=7000
ORDER by 1; 

--[����] �� �μ���(=�׷���)�� �޿��� �ִ�޿�, �ּұ޿�, �޿����, �μ��� �ο������� ��ȸ�Ͻÿ�
SELECT
    MAX(salary) as "�ִ�޿�",
    MIN(salary) as "�ּұ޿�",
    ROUND(AVG(salary),2) as "��ձ޿�",
    COUNT(department_id) as "�ο���"
FROM employees
GROUP by department_ID;

--[����4] 80�� �μ��� �޿� ���, �ְ�, ����, �ο����� ��ȸ
SELECT
    ROUND(AVG(salary),2),
    MAX(salary),
    Min(salary),
    COUNT(department_id)
FROM employees
--WHERE Department_id IN(80); �׷����� ������ ���
GROUP by (department_id)
HAVING (department_id=80);

    
--[����5]  ���μ��� ��տ��� ��ü���� ���������� ���Ͽ� ��տ����� ���� ������ ��ȸ
--�� �μ���ȣ�� ���̸� ������� �ʴ´�
SELECT
    department_id,
    salary,
    ROUND(AVG(salary),2),
    MIN(salary)
FROM employees
GROUP by department_ID, salary
HAVING department_id IS NOT NULL
ORDER BY 2;

--[����6] ���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο����� ��ȸ
--�׷��� ��Ų��쿡�� �Լ��� ���� ���� �ִ�.
SELECT 
    job_id,COUNT(*)
FROM
    employees
GROUP by job_id
HAVING COUNT(job_id)>=4;
ORDER by 1;

/*JOIN 
 - �� �̻��� ���谡 �ִ� ���̺�鰣�� �����͸� ��ȸ�ϴ� ��
 - PRIMARY KEY�� FK�� ���� �÷��� �ִ� ���̺��� ��ȸ
 
 **������ ����'
 - CROSS JOIN (=ī���׽þ� ����) �� �Ⱦ�
 
 - EQUI JOIN 
    PK==FK�� ���踦 ���� �����͸� ����
    FK�� NULL�� ���� ��� ��ü ��ȸ�� �ȵɼ��� �ִ�!!!
*/

-- CROSS JOIN
SELECT 
    e.salary, d.department_name
FROM
    employees e, departments d;
    
    
--EQUI JOIN
SELECT 
    e.first_name, d.department_name
FROM
    employees e, departments d
WHERE
    d.department_id = e.department_id; --null�� �ִ� �Ѹ� ��ȸ �ȵ�
    











