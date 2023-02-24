
CREATE TABLE titles (
	title_id VARCHAR(30) PRIMARY KEY NOT NULL,
	title VARCHAR(30) NOT NULL
);

CREATE TABLE departments (
	dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE employees (
	emp_no int PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR (30) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30) NOT NULL,
	hire_date DATE NOT NULL
);

create TABLE dept_manager (
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE salaries (
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	salary int NOT NULL
);

CREATE TABLE dept_emp (
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);