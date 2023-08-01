--11�� 22��

SELECT employee_ID,first_name,hire_date,salary FROM employees;

SELECT employee_ID, first_name, salary from employees order by salary desc;

SELECT first_name, phone_number, department_ID 
from employees
order by first_name;

SELECT DISTINCT department_ID
from employees;

----------------------------------------------------------------------------
-- ���ڿ� ���� ������ ||
SELECT first_name || '�� �ȳ��ϼ���?' as "Hello!"  -- Java���ڿ���"" �̰� '' as�� �÷����Ӻ���(Ư�� ���� �ȵǴµ� ""���鰡��)
FROM employees;
--Ȭ ����ǥ : ����Ŭ�� ���ڿ�
--�����ǥ : ���ڿ��ƴ�!! Ư�������� ó����

SELECT first_name, salary as "����޿�", salary*1.1 as "�λ�� �޿�"
FROM employees;

--�������� ���
/*SELECT [ALL/DISTINCT] �÷��� FROM ���̺��
WHERE ������
ORDER BY �÷��� [ASC/DESC]*/

--[����] �޿��� 10,000�޷� �̻��� �������� �̸�,�޿�,��ó,������ ��ȸ�Ͻÿ�
SELECT first_name, salary, department_ID, job_ID
From employees
WHERE salary>=10000;

--�̸�, �μ�, �Ի����� 2005�� ���Ŀ� �Ի��� ������ �Ի��� ������ ��ȸ�Ͻÿ�
SELECT first_name, department_ID, hire_date
FROM employees
WHERE hire_date>='05/01/01'     
ORDER by hire_date;

--2005�� ������ �Ի��� ������ �̸�, �μ�, �Ի����� �̸����� ��ȸ�Ͻÿ�
SELECT first_name, department_ID, hire_date
FROM employees
WHERE hire_date<'05/01/01'
ORDER by first_name;

--[����] �޿��� 5000~10000������ ������ �̸�, �μ���ȣ, �޿� �޿� ������������ ��ȸ
SELECT first_name, department_ID, salary
FROM employees
WHERE salary>=5000 AND salary<=10000 
ORDER by salary DESC;

--[����] �μ���ȣ�� 50�̰ų� 80�� ������ �̸�, �μ���ȣ, �μ� ������������ ��ȸ
SELECT first_name, department_ID
FROM employees
WHERE department_ID=50 OR department_ID=80
ORDER by department_ID ASC;


--[����] �μ���ȣ�� 50�̰ų� 80�� ������ �̸�, �μ���ȣ, �μ� ������������ �̸��� ������������ ��ȸ
SELECT first_name, department_ID
FROM employees
WHERE department_ID=50 OR department_ID=80
ORDER by department_ID ASC, first_name DESC;


--[����] �޿��� 5000~10000������ ������ �̸�, �μ���ȣ, �޿� �޿� ������������ ��ȸ
--�÷��� between ù��° �� and �ι�° �� 
SELECT first_name, department_ID, salary
FROM employees
--WHERE salary>=5000 AND salary<=10000 
WHERE salary between 5000 and 10000  --���� ������
ORDER by salary DESC;

--[����] �޿��� 5000�̸� 10000�ʰ��ϴ� ������ �̸�, �μ���ȣ, �޿� �޿� ������������ ��ȸ
--�÷��� not between ù��° �� and �ι�° �� 
SELECT first_name, department_ID, salary
FROM employees
WHERE salary NOT between 5000 and 10000
ORDER by salary DESC;

--[����] �μ���ȣ�� 50�̰ų� 80�� ������ �̸�, �μ���ȣ, �μ� ������������ �̸��� ������������ ��ȸ
-- �÷��� in (��, ��)
SELECT first_name, department_ID
FROM employees
--WHERE department_ID=50 OR department_ID=80
WHERE department_ID IN (50,80)  -- ������� ���� ����
ORDER by department_ID ASC, first_name DESC;

--[����] �μ���ȣ�� 50�̰ų� 80�� �ƴ� ������ �̸�, �μ���ȣ, �μ� ������������ �̸��� ������������ ��ȸ
-- �÷��� NOT in (��, ��)
SELECT first_name, department_ID
FROM employees
WHERE department_ID NOT IN (50,80)  
ORDER by department_ID ASC, first_name DESC;

--[����] �̸�, �μ���ȣ, �޿�, Ŀ�̼Ǻ����� �̸������������� ��ȸ commission_pct 
SELECT first_name, department_ID, commission_pct
FROM employees
ORDER by first_name;

--�÷��� is null, is not null
SELECT first_name, department_ID, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER by first_name;

--�÷��� is null, is not null
SELECT first_name, department_ID, commission_pct
FROM employees
WHERE commission_pct IS NULL
ORDER by first_name;

--[����]�����ڰ� ���� ����� ��ȸ (�̸� ���޾��̵�job id �μ���ȣdepartment id)
SELECT first_name, job_id, department_id
FROM employees
WHERE manager_ID IS NULL;

--[����]Ŀ�̼��� �޴� ������ �̸� �⺻�޿� Ŀ�̼Ǻ��� Ŀ�̼� �ݾ� �ѱ޿��� ��ȸ(�ѱݾ� ��������)
SELECT
    first_name, salary, commission_pct, salary*commission_pct as "Ŀ�̼Ǻ���",salary+salary*commission_pct as �ѱ޿�
FROM 
    employees
WHERE
    commission_pct IS NOT NULL
ORDER by 
    �ѱ޿� DESC;

/* ���� */
-- 1) �����ȣ(EMPLOYEE_ID), �̸�, �μ���ȣ, �޿�, ����(JOB_ID)�� �޿����� �������� ��ȸ
SELECT employee_ID, first_name, department_id, salary, job_id
FROM employees
ORDER by salary DESC;

-- 2) �޿��� 10000 �̻��� ����� �̸�, �޿�, �μ���ȣ ��ȸ
SELECT first_name, salary, department_ID
FROM employees
WHERE salary>=10000;

-- 3) 100�� �μ��� �Ҽӵ� ������� �̸�, �μ���ȣ, �޿��� �̸������� �������� �����Ͽ� ��ȸ
SELECT first_name, department_ID, salary
FROM employees
WHERE department_ID = 100
ORDER by first_name;

-- 4) �Ի����� '07/02/07' ���Ŀ� �Ի��� ����� �̸�, �Ի����� ��¥�� ������������ ��ȸ
SELECT first_name, hire_date
FROM employees
WHERE hire_date>='07/02/07'
ORDER by hire_date;

-- 5) �̸�, �Ի���, �޿�, �μ���ȣ�� ��ȸ, (�μ��� ��������, �̸��� ��������)
SELECT first_name, hire_date, salary, department_ID
FROM employees
ORDER by department_ID ASC, first_name ASC;

-- 6) �μ��� �Ҽӵ��� ���� ����� �̸�, �Ի���, �޿�, �μ���ȣ�� ��ȸ
SELECT first_name, hire_date, salary, department_ID
FROM employees
WHERE department_ID IS NULL;

-- 7) �������� �ִ� ������ �̸�, �޿�, Ŀ�̼Ǻ���, ������, �հ踦 ��ȸ�Ͻÿ�. (��Ī�� ����� ��)
SELECT first_name, salary, commission_pct, salary+salary*commission_pct as "�հ�"
FROM employees
WHERE commission_pct IS NOT NULL;

-- 8) �������� �ִ� ������ �̸�, �޿�, ������, �հ踦 ��ȸ�Ͻÿ�. (��Ī�� ����� ��)
--   ��, �������� �ݾ��� 1000 ������ �����鸸 ��ȸ
SELECT first_name as "�̸�", salary as "�޿�", commission_pct as "������", salary+salary*commission_pct as "�հ�"
FROM employees
WHERE commission_pct IS NOT NULL
AND commission_pct<=1000;
