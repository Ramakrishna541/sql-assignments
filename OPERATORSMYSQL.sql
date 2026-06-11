
 MySQL  localhost:3306 ssl  student  SQL > SELECT *
                                        -> FROM emp1
                                        -> WHERE SAL > 50000
                                        ->   AND (DEPTNO = 20 OR DEPTNO = 30);
+-------+------------+-----------+------+------------+-------+------+--------+------+
| EMPNO | EMPNAME    | JOB       | MGR  | HIREDATE   | SAL   | COMM | DEPTNO | age  |
+-------+------------+-----------+------+------------+-------+------+--------+------+
|  1004 | Sneha Iyer | Developer | 1002 | 1923-02-11 | 52000 | 2000 |     30 | NULL |
+-------+------------+-----------+------+------------+-------+------+--------+------+

 MySQL  localhost:3306 ssl  student  SQL > SELECT
                                        ->  EMPNO,
                                        ->  EMPNAME,
                                        ->  SAL,
                                        ->  SAL + (SAL * 0.10) AS Total_Salary
                                        -> FROM emp1;
+-------+--------------+-------+--------------+
| EMPNO | EMPNAME      | SAL   | Total_Salary |
+-------+--------------+-------+--------------+
|  1001 | Aarav Sharma | 80000 |     88000.00 |
|  1002 | Priya Reddy  | 45000 |     49500.00 |
|  1003 | Vikram Rao   | 55000 |     60500.00 |
|  1004 | Sneha Iyer   | 52000 |     57200.00 |
|  1005 | Rahul Verma  | 40000 |     44000.00 |
|  1006 | Kavya Nair   | 60000 |     66000.00 |
|  1007 | Arjun Mehta  | 58000 |     63800.00 |
|  1008 | Pooja Singh  | 47000 |     51700.00 |
|  1009 | Manoj Kumar  | 35000 |     38500.00 |
|  1010 | Neha Gupta   | 42000 |     46200.00 |
|  NULL | NULL         |  NULL |         NULL |
|  NULL | NULL         |  NULL |         NULL |
|  NULL | NULL         |  NULL |         NULL |
|  NULL | NULL         |  NULL |         NULL |
|  NULL | NULL         |  NULL |         NULL |
|  NULL | NULL         |  NULL |         NULL |
|  NULL | NULL         |  NULL |         NULL |
|  NULL | NULL         |  NULL |         NULL |
|  NULL | NULL         |  NULL |         NULL |
|  NULL | NULL         |  NULL |         NULL |
+-------+--------------+-------+--------------+
SELECT *
-> FROM emp1
-> WHERE HIREDATE BETWEEN '2018-01-01' AND '2020-12-31';
Empty set (0.0063 sec)
 SELECT *
 -> FROM emp1
 -> WHERE EMPNAME LIKE 'A%'
 ->    OR EMPNAME LIKE 'B%'
 -> ORDER BY EMPNAME ASC;
+-------+--------------+-----------+------+------------+-------+------+--------+------+
| EMPNO | EMPNAME      | JOB       | MGR  | HIREDATE   | SAL   | COMM | DEPTNO | age  |
+-------+--------------+-----------+------+------------+-------+------+--------+------+
|  1001 | Aarav Sharma | Manager   | NULL | 1920-01-15 | 80000 | NULL |     10 | NULL |
|  1007 | Arjun Mehta  | Developer | 1003 | 1923-08-25 | 58000 | 2500 |     10 | NULL |
+-------+--------------+-----------+------+------------+-------+------+--------+------+

  > SELECT EMPNAME, DEPTNAME, DEPTNO
           
  -> FROM emp1
                                        
  -> WHERE DEPTNO IN (10, 40);
+--------------+-----------+--------+
| EMPNAME      | DEPTNAME  | DEPTNO |
+--------------+-----------+--------+
| Aarav Sharma | Manager   |     10 |
| Vikram Rao   | Developer |     10 |
| Kavya Nair   | HR        |     40 |
| Arjun Mehta  | Developer |     10 |
| Manoj Kumar  | Support   |     40 |
+--------------+-----------+--------+