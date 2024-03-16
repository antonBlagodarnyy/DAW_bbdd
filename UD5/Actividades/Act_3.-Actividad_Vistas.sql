SELECT * FROM EMPLE;
SELECT * FROM DEPART;
SELECT * FROM LIBRERIA;
SELECT * FROM ALUMNOS;
SELECT * FROM ASIGNATURAS;
SELECT * FROM NOTAS;

--1)
SELECT * FROM EMPLE;

CREATE VIEW vista1 
AS SELECT apellido,salario,fecha_alt FROM EMPLE;

SELECT * FROM vista1;
--2)
SELECT * FROM EMPLE;

CREATE VIEW vista2 (apellido, salario,fecha_alt)
AS SELECT apellido, salario, TO_CHAR(fecha_alt,'DD/MM/YYYY') FROM EMPLE;

SELECT * FROM vista2;

--3)
SELECT * FROM DEPART;
SELECT * FROM EMPLE;

CREATE VIEW vista3
AS SELECT dept_no, dnombre, loc FROM DEPART DE
WHERE dept_no IN (SELECT dept_no FROM EMPLE);

SELECT * FROM vista3;

--4)
SELECT * FROM ALUM0405;

CREATE VIEW vista4 (nombre, apellidos, faltas_totales)
AS SELECT nombre, apellidos ,faltas1 + faltas2 + faltas3 FROM ALUM0405;

SELECT * FROM vista4;

--5)
SELECT * FROM ALUMNOS;
SELECT * FROM NOTAS; 
SELECT * FROM ASIGNATURAS;
SELECT * FROM NOTAS_ALUMNOS;

--sin funciones de agrupacion
CREATE VIEW vista5 (apenom, nota_media)
AS SELECT apenom, AVG(nota) FROM ALUMNOS AL 
JOIN NOTAS NO ON NO.dni = AL.dni
WHERE NO.nota IS NOT NULL
GROUP BY apenom;

SELECT * FROM vista5;

CREATE OR REPLACE VIEW NOTAS_ALUMNOS_PROMEDIO
AS SELECT NOMBRE_ALUMNO, ((NOTA1+NOTA2+NOTA3)/3) AS MEDIA
FROM NOTAS_ALUMNOS WHERE NOTA1 IS NOT NULL AND NOTA2 IS NOT NULL AND NOTA3 IS NOT NULL;

SELECT * FROM NOTAS_ALUMNOS_PROMEDIO;

--6)
SELECT * FROM LIBRERIA;

CREATE VIEW vista6 (tema, ejemplares)
AS SELECT tema,ejemplares FROM LIBRERIA;

SELECT * FROM vista6;

--7)
SELECT * FROM EMPLE;
SELECT * FROM DEPART;

CREATE VIEW vista7 (emp_no, apellido, dept_no, dnombre)
AS SELECT emp.emp_no, emp.apellido, emp.dept_no, de.dnombre FROM EMPLE EMP
JOIN DEPART DE ON DE.dept_no = EMP.dept_no;     

SELECT * FROM vista7;

--8)
SELECT * FROM EMPLE;
SELECT * FROM DEPART;

CREATE VIEW PAGOS (nombre, sal_mes, sal_an, dept_no)
AS SELECT INITCAP(apellido),salario,salario*12,dept_no FROM EMPLE EM;

SELECT * FROM PAGOS;