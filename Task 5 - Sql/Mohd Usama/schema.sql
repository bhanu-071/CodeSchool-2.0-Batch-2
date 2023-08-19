-- TABLES AND INSERT STATEMENTS ONLY

CREATE TABLE Departments (
  department_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  department_name VARCHAR(50) NOT NULL UNIQUE,
  department_head VARCHAR(255) NOT NULL
);

CREATE TABLE Employees (
  employee_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  employee_name VARCHAR(255) NOT NULL,
  employee_joining_date DATE NOT NULL,
  employee_working_hours INT CHECK (employee_working_hours >= 0),
  employee_address VARCHAR(255) NOT NULL,
  employee_age INT CHECK (employee_age >= 0),
  employee_education VARCHAR(255) NOT NULL,
  employee_department_id INT REFERENCES Departments(department_id) NOT NULL,
  is_active BOOLEAN DEFAULT true,
  is_head BOOLEAN DEFAULT false
);

CREATE TABLE EarningTypes (
  earning_type_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  earning_type_name VARCHAR(255) NOT NULL
);

CREATE TABLE DeductionTypes (
  deduction_type_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  deduction_type_name VARCHAR(255) NOT NULL
);

CREATE TABLE Earnings (
  earning_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  earning_employee_id INT NOT NULL,
  earning_type_id INT REFERENCES EarningTypes(earning_type_id) NOT NULL,
  earning_month INT NOT NULL CHECK (earning_month >= 1 AND earning_month <= 12),
  earning_year INT NOT NULL CHECK (earning_year >= 2020),
  amount INT NOT NULL CHECK (amount >= 0),
  FOREIGN KEY (earning_employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Deductions (
  deduction_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  deduction_employee_id INT NOT NULL,
  deduction_type_id INT REFERENCES DeductionTypes(deduction_type_id) NOT NULL,
  deduction_month INT NOT NULL CHECK (deduction_month >= 1 AND deduction_month <= 12),
  deduction_year INT NOT NULL CHECK (deduction_year >= 2020),
  amount INT NOT NULL CHECK (amount >= 0),
  FOREIGN KEY (deduction_employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Departments (department_name, department_head) VALUES
  ('Sales', 'Amit Sharma'),
  ('Marketing', 'Reena Kapoor'),
  ('IT', 'Vijay Kumar'),
  ('HR', 'Priyanka Singh'),
  ('Finance', 'Rahul Gupta');

INSERT INTO EarningTypes (earning_type_name) VALUES
  ('Basic Pay'),
  ('HRA'),
  ('DA'),
  ('Overtime Pay'),
  ('Bonuses'),
  ('Stock Options'),
  ('Paid Time Off');

INSERT INTO DeductionTypes (deduction_type_name) VALUES
  ('Income Tax'),
  ('Insurance'),
  ('Loan'),
  ('Pension'),
  ('Transportation');

INSERT INTO Employees (employee_name, employee_joining_date, employee_working_hours, employee_address, employee_age, employee_education, employee_department_id, is_active, is_head)
VALUES
  ('Amit Kumar', '2020-01-15', 40, '123 Main St, Bangalore', 35, 'MBA', 1, true, true),
  ('Shweta Gupta', '2022-04-08', 35, '456 Park Rd, Bangalore', 29, 'MBA', 1, true, false),
  ('Rahul Sharma', '2023-01-20', 38, '789 HR Ave, Bangalore', 26, 'MSW', 1, true, false),
  ('Pooja Verma', '2023-03-05', 40, '102 HR St, Bangalore', 30, 'MA', 1, true, false),
  ('Vivek Singh', '2022-07-15', 37, '303 HR Rd, Bangalore', 33, 'MHRM', 1, true, false),
  ('Rajesh Sharma', '2019-11-02', 40, '456 Park Rd, Mumbai', 42, 'CA', 2, true, true),
  ('Neha Mehta', '2021-07-10', 38, '789 Finance Ave, Mumbai', 31, 'M.Com', 2, true, false),
  ('Amit Patel', '2022-02-18', 35, '101 Finance St, Mumbai', 28, 'MBA', 2, true, false),
  ('Smita Shah', '2023-04-25', 40, '202 Finance Rd, Mumbai', 27, 'B.Com', 2, true, false),
  ('Alok Gupta', '2022-09-12', 37, '505 Finance Ave, Mumbai', 35, 'CFA', 2, true, false),
  ('Neha Patel', '2021-03-10', 40, '789 Tech Ave, Pune', 28, 'B.Tech', 3, true, true),
  ('Rahul Desai', '2022-06-15', 38, '456 IT St, Pune', 29, 'B.E.', 3, true, false),
  ('Priya Joshi', '2022-11-20', 35, '101 IT Rd, Pune', 31, 'M.Tech', 3, true, false),
  ('Ravi Kumar', '2023-03-28', 40, '202 IT Ave, Pune', 25, 'B.Sc', 3, true, false),
  ('Mohan Singh', '2022-08-05', 37, '303 IT Rd, Pune', 30, 'MCA', 3, true, false),
  ('Sandeep Singh', '2022-05-20', 40, '101 Marketing St, Delhi', 31, 'MBA', 4, true, true),
  ('Kritika Sharma', '2023-01-10', 38, '202 Marketing Ave, Delhi', 29, 'MBA', 4, true, false),
  ('Ajay Verma', '2023-06-18', 35, '303 Marketing Rd, Delhi', 27, 'BBA', 4, true, false),
  ('Ananya Kapoor', '2022-09-25', 40, '404 Marketing St, Delhi', 26, 'B.Com', 4, true, false),
  ('Vikas Mehta', '2021-12-12', 37, '505 Marketing Rd, Delhi', 32, 'MA', 4, true, false),
  ('Anjali Gupta', '2023-02-08', 40, '555 Operations Rd, Kolkata', 27, 'BBA', 5, true, true),
  ('Rahul Bose', '2022-05-15', 38, '777 Operations St, Kolkata', 29, 'BBA', 5, true, false),
  ('Aparna Das', '2021-11-20', 35, '888 Operations Rd, Kolkata', 30, 'MBA', 5, true, false),
  ('Suresh Menon', '2022-03-28', 40, '999 Operations St, Kolkata', 31, 'MBA', 5, true, false),
  ('Nisha Malhotra', '2023-08-05', 37, '111 Operations Ave, Kolkata', 28, 'MBA', 5, true, false),
  ('Shweta Gupta', '2022-04-08', 35, '456 Park Rd, Bangalore', 29, 'MBA', 1, true, false),
  ('Rahul Sharma', '2023-01-20', 38, '789 HR Ave, Bangalore', 26, 'MSW', 1, true, false),
  ('Pooja Verma', '2023-03-05', 40, '102 HR St, Bangalore', 30, 'MA', 1, true, false),
  ('Vivek Singh', '2022-07-15', 37, '303 HR Rd, Bangalore', 33, 'MHRM', 1, true, false),
  ('Neha Yadav', '2021-11-18', 36, '505 HR St, Bangalore', 28, 'MBA', 1, true, false),
  ('Neha Mehta', '2021-07-10', 38, '789 Finance Ave, Mumbai', 31, 'M.Com', 2, true, false),
  ('Amit Patel', '2022-02-18', 35, '101 Finance St, Mumbai', 28, 'MBA', 2, true, false),
  ('Smita Shah', '2023-04-25', 40, '202 Finance Rd, Mumbai', 27, 'B.Com', 2, true, false),
  ('Alok Gupta', '2022-09-12', 37, '505 Finance Ave, Mumbai', 35, 'CFA', 2, true, false),
  ('Rohit Choudhary', '2023-06-30', 39, '303 Finance St, Mumbai', 29, 'MBA', 2, true, false),
  ('Rahul Desai', '2022-06-15', 38, '456 IT St, Pune', 29, 'B.E.', 3, true, false),
  ('Priya Joshi', '2022-11-20', 35, '101 IT Rd, Pune', 31, 'M.Tech', 3, true, false),
  ('Ravi Kumar', '2023-03-28', 40, '202 IT Ave, Pune', 25, 'B.Sc', 3, true, false),
  ('Mohan Singh', '2022-08-05', 37, '303 IT Rd, Pune', 30, 'MCA', 3, true, false),
  ('Nikhil Verma', '2021-10-12', 39, '505 IT St, Pune', 27, 'B.Tech', 3, true, false),
  ('Kritika Sharma', '2023-01-10', 38, '202 Marketing Ave, Delhi', 29, 'MBA', 4, true, false),
  ('Ajay Verma', '2023-06-18', 35, '303 Marketing Rd, Delhi', 27, 'BBA', 4, true, false),
  ('Ananya Kapoor', '2022-09-25', 40, '404 Marketing St, Delhi', 26, 'B.Com', 4, true, false),
  ('Vikas Mehta', '2021-12-12', 37, '505 Marketing Rd, Delhi', 32, 'MA', 4, true, false),
  ('Neha Sharma', '2022-03-27', 39, '606 Marketing Ave, Delhi', 30, 'MBA', 4, true, false),
  ('Rahul Bose', '2022-05-15', 38, '777 Operations St, Kolkata', 29, 'BBA', 5, true, false),
  ('Aparna Das', '2021-11-20', 35, '888 Operations Rd, Kolkata', 30, 'MBA', 5, true, false),
  ('Suresh Menon', '2022-03-28', 40, '999 Operations St, Kolkata', 31, 'MBA', 5, true, false),
  ('Nisha Malhotra', '2023-08-05', 37, '111 Operations Ave, Kolkata', 28, 'MBA', 5, true, false),
  ('Rajesh Nair', '2023-04-15', 39, '222 Operations Rd, Kolkata', 27, 'BBA', 5, true, false);

INSERT INTO Earnings (earning_employee_id, earning_type_id, earning_month, earning_year, amount)
VALUES
  (1, 1, 7, 2023, 5000),
  (1, 2, 7, 2023, 500),
  (1, 3, 7, 2023, 100),
  (1, 4, 7, 2023, 300),
  (1, 6, 7, 2023, 350),
  (1, 1, 8, 2023, 5000),
  (1, 2, 8, 2023, 500),
  (1, 3, 8, 2023, 100),
  (1, 4, 8, 2023, 300),
  (1, 6, 8, 2023, 350),
  (1, 1, 9, 2023, 5500),
  (1, 2, 9, 2023, 500),
  (1, 3, 9, 2023, 100),
  (1, 5, 9, 2023, 300),
  (1, 6, 9, 2023, 350),
  (2, 1, 7, 2023, 4500),
  (2, 2, 7, 2023, 400),
  (2, 3, 7, 2023, 80),
  (2, 4, 7, 2023, 200),
  (2, 6, 7, 2023, 300),
  (2, 1, 8, 2023, 4500),
  (2, 2, 8, 2023, 400),
  (2, 3, 8, 2023, 80),
  (2, 4, 8, 2023, 200),
  (2, 6, 8, 2023, 300),
  (2, 1, 9, 2023, 5000),
  (2, 2, 9, 2023, 450),
  (2, 3, 9, 2023, 90),
  (2, 5, 9, 2023, 220),
  (2, 6, 9, 2023, 330),
  (3, 1, 7, 2023, 4000),
  (3, 2, 7, 2023, 350),
  (3, 3, 7, 2023, 70),
  (3, 4, 7, 2023, 180),
  (3, 6, 7, 2023, 270),
  (3, 1, 8, 2023, 4000),
  (3, 2, 8, 2023, 350),
  (3, 3, 8, 2023, 70),
  (3, 4, 8, 2023, 180),
  (3, 6, 8, 2023, 270),
  (3, 1, 9, 2023, 4500),
  (3, 2, 9, 2023, 400),
  (3, 3, 9, 2023, 80),
  (3, 5, 9, 2023, 200),
  (3, 6, 9, 2023, 300),
  (4, 1, 7, 2023, 3500),
  (4, 2, 7, 2023, 300),
  (4, 3, 7, 2023, 60),
  (4, 4, 7, 2023, 150),
  (4, 6, 7, 2023, 250),
  (4, 1, 8, 2023, 3500),
  (4, 2, 8, 2023, 300),
  (4, 3, 8, 2023, 60),
  (4, 4, 8, 2023, 150),
  (4, 6, 8, 2023, 250),
  (4, 1, 9, 2023, 4000),
  (4, 2, 9, 2023, 350),
  (4, 3, 9, 2023, 70),
  (4, 5, 9, 2023, 180),
  (4, 6, 9, 2023, 270),
  (5, 1, 7, 2023, 3000),
  (5, 2, 7, 2023, 250),
  (5, 3, 7, 2023, 50),
  (5, 4, 7, 2023, 120),
  (5, 6, 7, 2023, 200),
  (5, 1, 8, 2023, 3000),
  (5, 2, 8, 2023, 250),
  (5, 3, 8, 2023, 50),
  (5, 4, 8, 2023, 120),
  (5, 6, 8, 2023, 200),
  (5, 1, 9, 2023, 3500),
  (5, 2, 9, 2023, 300),
  (5, 3, 9, 2023, 60),
  (5, 5, 9, 2023, 150),
  (5, 6, 9, 2023, 250),
  (6, 1, 7, 2023, 2500),
  (6, 2, 7, 2023, 200),
  (6, 3, 7, 2023, 40),
  (6, 4, 7, 2023, 100),
  (6, 6, 7, 2023, 150),
  (6, 1, 8, 2023, 2500),
  (6, 2, 8, 2023, 200),
  (6, 3, 8, 2023, 40),
  (6, 4, 8, 2023, 100),
  (6, 6, 8, 2023, 150),
  (6, 1, 9, 2023, 2800),
  (6, 2, 9, 2023, 250),
  (6, 3, 9, 2023, 50),
  (6, 5, 9, 2023, 120),
  (6, 6, 9, 2023, 180),
  (7, 1, 7, 2023, 2000),
  (7, 2, 7, 2023, 150),
  (7, 3, 7, 2023, 30),
  (7, 4, 7, 2023, 80),
  (7, 6, 7, 2023, 120),
  (7, 1, 8, 2023, 2000),
  (7, 2, 8, 2023, 150),
  (7, 3, 8, 2023, 30),
  (7, 4, 8, 2023, 80),
  (7, 6, 8, 2023, 120),
  (7, 1, 9, 2023, 2300),
  (7, 2, 9, 2023, 200),
  (7, 3, 9, 2023, 40),
  (7, 5, 9, 2023, 100),
  (7, 6, 9, 2023, 150),
  (8, 1, 7, 2023, 1800),
  (8, 2, 7, 2023, 130),
  (8, 3, 7, 2023, 20),
  (8, 4, 7, 2023, 60),
  (8, 6, 7, 2023, 90),
  (8, 1, 8, 2023, 1800),
  (8, 2, 8, 2023, 130),
  (8, 3, 8, 2023, 20),
  (8, 4, 8, 2023, 60),
  (8, 6, 8, 2023, 90),
  (8, 1, 9, 2023, 2100),
  (8, 2, 9, 2023, 180),
  (8, 3, 9, 2023, 30),
  (8, 5, 9, 2023, 80),
  (8, 6, 9, 2023, 120),
  (9, 1, 7, 2023, 1500),
  (9, 2, 7, 2023, 100),
  (9, 3, 7, 2023, 10),
  (9, 4, 7, 2023, 40),
  (9, 6, 7, 2023, 70),
  (9, 1, 8, 2023, 1500),
  (9, 2, 8, 2023, 100),
  (9, 3, 8, 2023, 10),
  (9, 4, 8, 2023, 40),
  (9, 6, 8, 2023, 70),
  (9, 1, 9, 2023, 1800),
  (9, 2, 9, 2023, 150),
  (9, 3, 9, 2023, 20),
  (9, 5, 9, 2023, 50),
  (9, 6, 9, 2023, 80),
  (10, 1, 7, 2023, 1200),
  (10, 2, 7, 2023, 80),
  (10, 3, 7, 2023, 5),
  (10, 4, 7, 2023, 20),
  (10, 6, 7, 2023, 50),
  (10, 1, 8, 2023, 1200),
  (10, 2, 8, 2023, 80),
  (10, 3, 8, 2023, 5),
  (10, 4, 8, 2023, 20),
  (10, 6, 8, 2023, 50),
  (10, 1, 9, 2023, 1500),
  (10, 2, 9, 2023, 100),
  (10, 3, 9, 2023, 10),
  (10, 5, 9, 2023, 30),
  (10, 6, 9, 2023, 70),
  (11, 1, 7, 2023, 2000),
  (11, 2, 7, 2023, 150),
  (11, 4, 7, 2023, 100),
  (11, 6, 7, 2023, 200),
  (11, 3, 8, 2023, 50),
  (11, 5, 8, 2023, 120),
  (11, 6, 8, 2023, 180),
  (11, 1, 9, 2023, 2500),
  (11, 3, 9, 2023, 70),
  (11, 5, 9, 2023, 180),
  (12, 1, 7, 2023, 1800),
  (12, 4, 7, 2023, 80),
  (12, 6, 7, 2023, 150),
  (12, 2, 8, 2023, 40),
  (12, 3, 8, 2023, 50),
  (12, 5, 8, 2023, 100),
  (12, 1, 9, 2023, 2100),
  (12, 2, 9, 2023, 70),
  (12, 5, 9, 2023, 150),
  (13, 4, 7, 2023, 60),
  (13, 5, 7, 2023, 90),
  (13, 6, 7, 2023, 120),
  (13, 2, 8, 2023, 30),
  (13, 3, 8, 2023, 40),
  (13, 5, 8, 2023, 80),
  (13, 1, 9, 2023, 1800),
  (13, 2, 9, 2023, 50),
  (13, 6, 9, 2023, 100),
  (14, 3, 7, 2023, 20),
  (14, 5, 7, 2023, 40),
  (14, 6, 7, 2023, 70),
  (14, 1, 8, 2023, 10),
  (14, 3, 8, 2023, 20),
  (14, 5, 8, 2023, 30),
  (14, 1, 9, 2023, 1500),
  (14, 2, 9, 2023, 40),
  (14, 6, 9, 2023, 80),
  (15, 1, 7, 2023, 1500),
  (15, 4, 7, 2023, 50),
  (15, 6, 7, 2023, 100),
  (15, 1, 8, 2023, 1000),
  (15, 3, 8, 2023, 10),
  (15, 5, 8, 2023, 30),
  (15, 1, 9, 2023, 1200),
  (15, 2, 9, 2023, 20),
  (15, 6, 9, 2023, 70),
  (16, 1, 7, 2023, 1300),
  (16, 4, 7, 2023, 40),
  (16, 6, 7, 2023, 70),
  (16, 3, 8, 2023, 10),
  (16, 5, 8, 2023, 25),
  (16, 6, 8, 2023, 45),
  (16, 1, 9, 2023, 1500),
  (16, 2, 9, 2023, 30),
  (16, 5, 9, 2023, 60),
  (17, 4, 7, 2023, 30),
  (17, 5, 7, 2023, 50),
  (17, 6, 7, 2023, 80),
  (17, 1, 8, 2023, 600),
  (17, 3, 8, 2023, 5),
  (17, 5, 8, 2023, 15),
  (17, 1, 9, 2023, 900),
  (17, 2, 9, 2023, 10),
  (17, 6, 9, 2023, 40),
  (18, 2, 7, 2023, 100),
  (18, 3, 7, 2023, 20),
  (18, 6, 7, 2023, 40),
  (18, 4, 8, 2023, 40),
  (18, 5, 8, 2023, 60),
  (18, 6, 8, 2023, 80),
  (18, 1, 9, 2023, 1200),
  (18, 2, 9, 2023, 30),
  (18, 6, 9, 2023, 60),
  (19, 4, 7, 2023, 20),
  (19, 5, 7, 2023, 30),
  (19, 6, 7, 2023, 40),
  (19, 1, 8, 2023, 500),
  (19, 3, 8, 2023, 5),
  (19, 5, 8, 2023, 10),
  (19, 1, 9, 2023, 700),
  (19, 2, 9, 2023, 15),
  (19, 6, 9, 2023, 30),
  (20, 2, 7, 2023, 80),
  (20, 3, 7, 2023, 15),
  (20, 6, 7, 2023, 25),
  (20, 4, 8, 2023, 30),
  (20, 5, 8, 2023, 40),
  (20, 6, 8, 2023, 50),
  (20, 1, 9, 2023, 800),
  (20, 2, 9, 2023, 20),
  (20, 6, 9, 2023, 40),
  (21, 4, 7, 2023, 25),
  (21, 5, 7, 2023, 35),
  (21, 6, 7, 2023, 45),
  (21, 1, 8, 2023, 300),
  (21, 3, 8, 2023, 5),
  (21, 5, 8, 2023, 15),
  (21, 1, 9, 2023, 400),
  (21, 2, 9, 2023, 10),
  (21, 6, 9, 2023, 20),
  (22, 2, 7, 2023, 60),
  (22, 3, 7, 2023, 10),
  (22, 6, 7, 2023, 20),
  (22, 4, 8, 2023, 20),
  (22, 5, 8, 2023, 30),
  (22, 6, 8, 2023, 40),
  (22, 1, 9, 2023, 500),
  (22, 2, 9, 2023, 15),
  (22, 6, 9, 2023, 30),
  (23, 5, 7, 2023, 15),
  (23, 6, 7, 2023, 25),
  (23, 1, 7, 2023, 150),
  (23, 4, 8, 2023, 10),
  (23, 5, 8, 2023, 20),
  (23, 6, 8, 2023, 30),
  (23, 1, 9, 2023, 200),
  (23, 2, 9, 2023, 5),
  (23, 6, 9, 2023, 10),
  (24, 4, 7, 2023, 5),
  (24, 5, 7, 2023, 10),
  (24, 6, 7, 2023, 20),
  (24, 1, 8, 2023, 80),
  (24, 3, 8, 2023, 2),
  (24, 5, 8, 2023, 10),
  (24, 1, 9, 2023, 100),
  (24, 2, 9, 2023, 3),
  (24, 6, 9, 2023, 5),
  (25, 2, 7, 2023, 30),
  (25, 3, 7, 2023, 5),
  (25, 6, 7, 2023, 10),
  (25, 4, 8, 2023, 15),
  (25, 5, 8, 2023, 20),
  (25, 6, 8, 2023, 25),
  (25, 1, 9, 2023, 300),
  (25, 2, 9, 2023, 10),
  (25, 6, 9, 2023, 20),
  (26, 1, 7, 2023, 1200),
  (26, 3, 7, 2023, 25),
  (26, 6, 7, 2023, 50),
  (26, 4, 8, 2023, 25),
  (26, 5, 8, 2023, 30),
  (26, 6, 8, 2023, 40),
  (26, 1, 9, 2023, 1500),
  (26, 2, 9, 2023, 30),
  (26, 6, 9, 2023, 60),
  (27, 5, 7, 2023, 35),
  (27, 6, 7, 2023, 45),
  (27, 1, 7, 2023, 800),
  (27, 4, 8, 2023, 20),
  (27, 5, 8, 2023, 30),
  (27, 6, 8, 2023, 40),
  (27, 1, 9, 2023, 1000),
  (27, 2, 9, 2023, 25),
  (27, 6, 9, 2023, 50),
  (28, 4, 7, 2023, 10),
  (28, 5, 7, 2023, 15),
  (28, 6, 7, 2023, 20),
  (28, 1, 8, 2023, 200),
  (28, 3, 8, 2023, 5),
  (28, 5, 8, 2023, 10),
  (28, 1, 9, 2023, 300),
  (28, 2, 9, 2023, 10),
  (28, 6, 9, 2023, 20),
  (29, 2, 7, 2023, 30),
  (29, 3, 7, 2023, 5),
  (29, 6, 7, 2023, 10),
  (29, 4, 8, 2023, 15),
  (29, 5, 8, 2023, 20),
  (29, 6, 8, 2023, 25),
  (29, 1, 9, 2023, 300),
  (29, 2, 9, 2023, 10),
  (29, 6, 9, 2023, 20),
  (30, 1, 7, 2023, 1200),
  (30, 4, 7, 2023, 25),
  (30, 6, 7, 2023, 50),
  (30, 4, 8, 2023, 25),
  (30, 5, 8, 2023, 30),
  (30, 6, 8, 2023, 40),
  (30, 1, 9, 2023, 1500),
  (30, 2, 9, 2023, 30),
  (30, 6, 9, 2023, 60),
  (31, 5, 7, 2023, 35),
  (31, 6, 7, 2023, 45),
  (31, 1, 7, 2023, 800),
  (31, 4, 8, 2023, 20),
  (31, 5, 8, 2023, 30),
  (31, 6, 8, 2023, 40),
  (31, 1, 9, 2023, 1000),
  (31, 2, 9, 2023, 25),
  (31, 6, 9, 2023, 50),
  (32, 4, 7, 2023, 10),
  (32, 5, 7, 2023, 15),
  (32, 6, 7, 2023, 20),
  (32, 1, 8, 2023, 200),
  (32, 3, 8, 2023, 5),
  (32, 5, 8, 2023, 10),
  (32, 1, 9, 2023, 300),
  (32, 2, 9, 2023, 10),
  (32, 6, 9, 2023, 20),
  (33, 2, 7, 2023, 30),
  (33, 3, 7, 2023, 5),
  (33, 6, 7, 2023, 10),
  (33, 4, 8, 2023, 15),
  (33, 5, 8, 2023, 20),
  (33, 6, 8, 2023, 25),
  (33, 1, 9, 2023, 300),
  (33, 2, 9, 2023, 10),
  (33, 6, 9, 2023, 20),
  (34, 1, 7, 2023, 1200),
  (34, 4, 7, 2023, 25),
  (34, 6, 7, 2023, 50),
  (34, 4, 8, 2023, 25),
  (34, 5, 8, 2023, 30),
  (34, 6, 8, 2023, 40),
  (34, 1, 9, 2023, 1500),
  (34, 2, 9, 2023, 30),
  (34, 6, 9, 2023, 60),
  (35, 5, 7, 2023, 35),
  (35, 6, 7, 2023, 45),
  (35, 1, 7, 2023, 800),
  (35, 4, 8, 2023, 20),
  (35, 5, 8, 2023, 30),
  (35, 6, 8, 2023, 40),
  (35, 1, 9, 2023, 1000),
  (35, 2, 9, 2023, 25),
  (35, 6, 9, 2023, 50),
  (36, 4, 7, 2023, 25),
  (36, 5, 7, 2023, 35),
  (36, 6, 7, 2023, 45),
  (36, 1, 8, 2023, 300),
  (36, 3, 8, 2023, 5),
  (36, 5, 8, 2023, 15),
  (36, 1, 9, 2023, 400),
  (36, 2, 9, 2023, 10),
  (36, 6, 9, 2023, 20),
  (37, 5, 7, 2023, 35),
  (37, 6, 7, 2023, 45),
  (37, 1, 7, 2023, 800),
  (37, 4, 8, 2023, 20),
  (37, 5, 8, 2023, 30),
  (37, 6, 8, 2023, 40),
  (37, 1, 9, 2023, 1000),
  (37, 2, 9, 2023, 25),
  (37, 6, 9, 2023, 50),
  (38, 4, 7, 2023, 10),
  (38, 5, 7, 2023, 15),
  (38, 6, 7, 2023, 20),
  (38, 1, 8, 2023, 200),
  (38, 3, 8, 2023, 5),
  (38, 5, 8, 2023, 10),
  (38, 1, 9, 2023, 300),
  (38, 2, 9, 2023, 10),
  (38, 6, 9, 2023, 20),
  (39, 5, 7, 2023, 35),
  (39, 6, 7, 2023, 45),
  (39, 1, 7, 2023, 800),
  (39, 4, 8, 2023, 20),
  (39, 5, 8, 2023, 30),
  (39, 6, 8, 2023, 40),
  (39, 1, 9, 2023, 1000),
  (39, 2, 9, 2023, 25),
  (39, 6, 9, 2023, 50),
  (40, 4, 7, 2023, 25),
  (40, 5, 7, 2023, 35),
  (40, 6, 7, 2023, 45),
  (40, 1, 8, 2023, 300),
  (40, 3, 8, 2023, 5),
  (40, 5, 8, 2023, 15),
  (40, 1, 9, 2023, 400),
  (40, 2, 9, 2023, 10),
  (40, 6, 9, 2023, 20),
  (41, 5, 7, 2023, 35),
  (41, 6, 7, 2023, 45),
  (41, 1, 7, 2023, 800),
  (41, 4, 8, 2023, 20),
  (41, 5, 8, 2023, 30),
  (41, 6, 8, 2023, 40),
  (41, 1, 9, 2023, 1000),
  (41, 2, 9, 2023, 25),
  (41, 6, 9, 2023, 50),
  (42, 4, 7, 2023, 10),
  (42, 5, 7, 2023, 15),
  (42, 6, 7, 2023, 20),
  (42, 1, 8, 2023, 200),
  (42, 3, 8, 2023, 5),
  (42, 5, 8, 2023, 10),
  (42, 1, 9, 2023, 300),
  (42, 2, 9, 2023, 10),
  (42, 6, 9, 2023, 20),
  (43, 5, 7, 2023, 35),
  (43, 6, 7, 2023, 45),
  (43, 1, 7, 2023, 800),
  (43, 4, 8, 2023, 20),
  (43, 5, 8, 2023, 30),
  (43, 6, 8, 2023, 40),
  (43, 1, 9, 2023, 1000),
  (43, 2, 9, 2023, 25),
  (43, 6, 9, 2023, 50),
  (44, 4, 7, 2023, 25),
  (44, 5, 7, 2023, 35),
  (44, 6, 7, 2023, 45),
  (44, 1, 8, 2023, 300),
  (44, 3, 8, 2023, 5),
  (44, 5, 8, 2023, 15),
  (44, 1, 9, 2023, 400),
  (44, 2, 9, 2023, 10),
  (44, 6, 9, 2023, 20),
  (45, 5, 7, 2023, 35),
  (45, 6, 7, 2023, 45),
  (45, 1, 7, 2023, 800),
  (45, 4, 8, 2023, 20),
  (45, 5, 8, 2023, 30),
  (45, 6, 8, 2023, 40),
  (45, 1, 9, 2023, 1000),
  (45, 2, 9, 2023, 25),
  (45, 6, 9, 2023, 50),
  (46, 4, 7, 2023, 25),
  (46, 5, 7, 2023, 35),
  (46, 6, 7, 2023, 45),
  (46, 1, 8, 2023, 300),
  (46, 3, 8, 2023, 5),
  (46, 5, 8, 2023, 15),
  (46, 1, 9, 2023, 400),
  (46, 2, 9, 2023, 10),
  (46, 6, 9, 2023, 20),
  (47, 5, 7, 2023, 35),
  (47, 6, 7, 2023, 45),
  (47, 1, 7, 2023, 800),
  (47, 4, 8, 2023, 20),
  (47, 5, 8, 2023, 30),
  (47, 6, 8, 2023, 40),
  (47, 1, 9, 2023, 1000),
  (47, 2, 9, 2023, 25),
  (47, 6, 9, 2023, 50),
  (48, 4, 7, 2023, 10),
  (48, 5, 7, 2023, 15),
  (48, 6, 7, 2023, 20),
  (48, 1, 8, 2023, 200),
  (48, 3, 8, 2023, 5),
  (48, 5, 8, 2023, 10),
  (48, 1, 9, 2023, 300),
  (48, 2, 9, 2023, 10),
  (48, 6, 9, 2023, 20),
  (49, 5, 7, 2023, 35),
  (49, 6, 7, 2023, 45),
  (49, 1, 7, 2023, 800),
  (49, 4, 8, 2023, 20),
  (49, 5, 8, 2023, 30),
  (49, 6, 8, 2023, 40),
  (49, 1, 9, 2023, 1000),
  (49, 2, 9, 2023, 25),
  (49, 6, 9, 2023, 50),
  (50, 4, 7, 2023, 25),
  (50, 5, 7, 2023, 35),
  (50, 6, 7, 2023, 45),
  (50, 1, 8, 2023, 300),
  (50, 3, 8, 2023, 5),
  (50, 5, 8, 2023, 15),
  (50, 1, 9, 2023, 400),
  (50, 2, 9, 2023, 10),
  (50, 6, 9, 2023, 20);

INSERT INTO Deductions (deduction_employee_id, deduction_type_id, deduction_month, deduction_year, amount)
VALUES
  (1, 1, 7, 2023, 150),
  (1, 2, 7, 2023, 50),
  (1, 3, 7, 2023, 200),
  (1, 4, 7, 2023, 30),
  (1, 1, 8, 2023, 180),
  (1, 2, 8, 2023, 60),
  (1, 3, 8, 2023, 250),
  (1, 4, 8, 2023, 35),
  (1, 1, 9, 2023, 200),
  (1, 2, 9, 2023, 70),
  (1, 3, 9, 2023, 300),
  (1, 4, 9, 2023, 40),
  (2, 1, 7, 2023, 120),
  (2, 2, 7, 2023, 40),
  (2, 3, 7, 2023, 150),
  (2, 4, 7, 2023, 25),
  (2, 1, 8, 2023, 150),
  (2, 2, 8, 2023, 45),
  (2, 3, 8, 2023, 180),
  (2, 4, 8, 2023, 30),
  (2, 1, 9, 2023, 170),
  (2, 2, 9, 2023, 50),
  (2, 3, 9, 2023, 200),
  (2, 4, 9, 2023, 35),
  (3, 1, 7, 2023, 100),
  (3, 2, 7, 2023, 35),
  (3, 3, 7, 2023, 120),
  (3, 4, 7, 2023, 20),
  (3, 1, 8, 2023, 130),
  (3, 2, 8, 2023, 40),
  (3, 3, 8, 2023, 150),
  (3, 4, 8, 2023, 25),
  (3, 1, 9, 2023, 150),
  (3, 2, 9, 2023, 45),
  (3, 3, 9, 2023, 180),
  (3, 4, 9, 2023, 30),
  (4, 1, 7, 2023, 80),
  (4, 2, 7, 2023, 30),
  (4, 3, 7, 2023, 90),
  (4, 4, 7, 2023, 15),
  (4, 1, 8, 2023, 110),
  (4, 2, 8, 2023, 35),
  (4, 3, 8, 2023, 120),
  (4, 4, 8, 2023, 20),
  (4, 1, 9, 2023, 130),
  (4, 2, 9, 2023, 40),
  (4, 3, 9, 2023, 150),
  (4, 4, 9, 2023, 25),
  (5, 1, 7, 2023, 60),
  (5, 2, 7, 2023, 25),
  (5, 3, 7, 2023, 60),
  (5, 4, 7, 2023, 10),
  (5, 1, 8, 2023, 90),
  (5, 2, 8, 2023, 30),
  (5, 3, 8, 2023, 90),
  (5, 4, 8, 2023, 15),
  (5, 1, 9, 2023, 110),
  (5, 2, 9, 2023, 35),
  (5, 3, 9, 2023, 120),
  (5, 4, 9, 2023, 20),
  (6, 1, 7, 2023, 150),
  (6, 2, 7, 2023, 50),
  (6, 3, 7, 2023, 200),
  (6, 4, 7, 2023, 30),
  (6, 1, 8, 2023, 180),
  (6, 2, 8, 2023, 60),
  (6, 3, 8, 2023, 250),
  (6, 4, 8, 2023, 35),
  (6, 1, 9, 2023, 200),
  (6, 2, 9, 2023, 70),
  (6, 3, 9, 2023, 300),
  (6, 4, 9, 2023, 40),
  (7, 1, 7, 2023, 120),
  (7, 2, 7, 2023, 40),
  (7, 3, 7, 2023, 150),
  (7, 4, 7, 2023, 25),
  (7, 1, 8, 2023, 150),
  (7, 2, 8, 2023, 45),
  (7, 3, 8, 2023, 180),
  (7, 4, 8, 2023, 30),
  (7, 1, 9, 2023, 170),
  (7, 2, 9, 2023, 50),
  (7, 3, 9, 2023, 200),
  (7, 4, 9, 2023, 35),
  (8, 1, 7, 2023, 100),
  (8, 2, 7, 2023, 35),
  (8, 3, 7, 2023, 120),
  (8, 4, 7, 2023, 20),
  (8, 1, 8, 2023, 130),
  (8, 2, 8, 2023, 40),
  (8, 3, 8, 2023, 150),
  (8, 4, 8, 2023, 25),
  (8, 1, 9, 2023, 150),
  (8, 2, 9, 2023, 45),
  (8, 3, 9, 2023, 180),
  (8, 4, 9, 2023, 30),
  (9, 1, 7, 2023, 80),
  (9, 2, 7, 2023, 30),
  (9, 3, 7, 2023, 90),
  (9, 4, 7, 2023, 15),
  (9, 1, 8, 2023, 110),
  (9, 2, 8, 2023, 35),
  (9, 3, 8, 2023, 120),
  (9, 4, 8, 2023, 20),
  (9, 1, 9, 2023, 130),
  (9, 2, 9, 2023, 40),
  (9, 3, 9, 2023, 150),
  (9, 4, 9, 2023, 25),
  (10, 1, 7, 2023, 60),
  (10, 2, 7, 2023, 25),
  (10, 3, 7, 2023, 60),
  (10, 4, 7, 2023, 10),
  (10, 1, 8, 2023, 90),
  (10, 2, 8, 2023, 30),
  (10, 3, 8, 2023, 90),
  (10, 4, 8, 2023, 15),
  (10, 1, 9, 2023, 110),
  (10, 2, 9, 2023, 35),
  (10, 3, 9, 2023, 120),
  (10, 4, 9, 2023, 20),
  (11, 1, 7, 2023, 100),
  (11, 3, 7, 2023, 50),
  (11, 2, 8, 2023, 150),
  (11, 1, 9, 2023, 30),
  (12, 2, 7, 2023, 80),
  (12, 3, 7, 2023, 40),
  (12, 1, 8, 2023, 120),
  (12, 2, 9, 2023, 25),
  (13, 1, 7, 2023, 70),
  (13, 2, 7, 2023, 35),
  (13, 1, 8, 2023, 100),
  (13, 3, 9, 2023, 20),
  (14, 3, 7, 2023, 60),
  (14, 1, 7, 2023, 30),
  (14, 2, 8, 2023, 90),
  (14, 1, 9, 2023, 15),
  (15, 1, 7, 2023, 50),
  (15, 2, 7, 2023, 25),
  (15, 3, 8, 2023, 80),
  (15, 2, 9, 2023, 10),
  (16, 1, 7, 2023, 100),
  (16, 3, 7, 2023, 50),
  (16, 2, 8, 2023, 150),
  (16, 1, 9, 2023, 30),
  (17, 2, 7, 2023, 80),
  (17, 3, 7, 2023, 40),
  (17, 1, 8, 2023, 120),
  (17, 2, 9, 2023, 25),
  (18, 1, 7, 2023, 70),
  (18, 2, 7, 2023, 35),
  (18, 1, 8, 2023, 100),
  (18, 3, 9, 2023, 20),
  (19, 3, 7, 2023, 60),
  (19, 1, 7, 2023, 30),
  (19, 2, 8, 2023, 90),
  (19, 1, 9, 2023, 15),
  (20, 1, 7, 2023, 50),
  (20, 2, 7, 2023, 25),
  (20, 3, 8, 2023, 80),
  (20, 2, 9, 2023, 10),
  (21, 2, 7, 2023, 80),
  (21, 4, 7, 2023, 50),
  (21, 1, 7, 2023, 150),
  (21, 3, 8, 2023, 30),
  (21, 2, 8, 2023, 90),
  (21, 1, 9, 2023, 15),
  (22, 1, 7, 2023, 70),
  (22, 2, 7, 2023, 40),
  (22, 3, 7, 2023, 120),
  (22, 4, 8, 2023, 25),
  (22, 1, 8, 2023, 100),
  (22, 3, 9, 2023, 20),
  (23, 3, 7, 2023, 60),
  (23, 4, 7, 2023, 30),
  (23, 1, 7, 2023, 90),
  (23, 2, 8, 2023, 20),
  (23, 3, 8, 2023, 80),
  (23, 1, 9, 2023, 10),
  (24, 2, 7, 2023, 50),
  (24, 3, 7, 2023, 25),
  (24, 1, 7, 2023, 70),
  (24, 4, 8, 2023, 15),
  (24, 1, 8, 2023, 60),
  (24, 2, 9, 2023, 5),
  (25, 1, 7, 2023, 80),
  (25, 4, 7, 2023, 50),
  (25, 2, 7, 2023, 150),
  (25, 3, 8, 2023, 30),
  (25, 2, 8, 2023, 90),
  (25, 1, 9, 2023, 15),
  (26, 1, 7, 2023, 70),
  (26, 2, 7, 2023, 40),
  (26, 3, 7, 2023, 120),
  (26, 4, 8, 2023, 25),
  (26, 1, 8, 2023, 100),
  (26, 3, 9, 2023, 20),
  (27, 3, 7, 2023, 60),
  (27, 4, 7, 2023, 30),
  (27, 1, 7, 2023, 90),
  (27, 2, 8, 2023, 20),
  (27, 3, 8, 2023, 80),
  (27, 1, 9, 2023, 10),
  (28, 2, 7, 2023, 50),
  (28, 3, 7, 2023, 25),
  (28, 1, 7, 2023, 70),
  (28, 4, 8, 2023, 15),
  (28, 1, 8, 2023, 60),
  (28, 2, 9, 2023, 5),
  (29, 1, 7, 2023, 80),
  (29, 4, 7, 2023, 50),
  (29, 2, 7, 2023, 150),
  (29, 3, 8, 2023, 30),
  (29, 2, 8, 2023, 90),
  (29, 1, 9, 2023, 15),
  (30, 1, 7, 2023, 70),
  (30, 2, 7, 2023, 40),
  (30, 3, 7, 2023, 120),
  (30, 4, 8, 2023, 25),
  (30, 1, 8, 2023, 100),
  (30, 3, 9, 2023, 20),
  (31, 2, 7, 2023, 80),
  (31, 4, 7, 2023, 50),
  (31, 1, 7, 2023, 150),
  (31, 3, 8, 2023, 30),
  (31, 2, 8, 2023, 90),
  (31, 1, 9, 2023, 15),
  (32, 1, 7, 2023, 70),
  (32, 2, 7, 2023, 40),
  (32, 3, 7, 2023, 120),
  (32, 4, 8, 2023, 25),
  (32, 1, 8, 2023, 100),
  (32, 3, 9, 2023, 20),
  (33, 3, 7, 2023, 60),
  (33, 4, 7, 2023, 30),
  (33, 1, 7, 2023, 90),
  (33, 2, 8, 2023, 20),
  (33, 3, 8, 2023, 80),
  (33, 1, 9, 2023, 10),
  (34, 2, 7, 2023, 50),
  (34, 3, 7, 2023, 25),
  (34, 1, 7, 2023, 70),
  (34, 4, 8, 2023, 15),
  (34, 1, 8, 2023, 60),
  (34, 2, 9, 2023, 5),
  (35, 1, 7, 2023, 80),
  (35, 4, 7, 2023, 50),
  (35, 2, 7, 2023, 150),
  (35, 3, 8, 2023, 30),
  (35, 2, 8, 2023, 90),
  (35, 1, 9, 2023, 15),
  (36, 1, 7, 2023, 70),
  (36, 2, 7, 2023, 40),
  (36, 3, 7, 2023, 120),
  (36, 4, 8, 2023, 25),
  (36, 1, 8, 2023, 100),
  (36, 3, 9, 2023, 20),
  (37, 3, 7, 2023, 60),
  (37, 4, 7, 2023, 30),
  (37, 1, 7, 2023, 90),
  (37, 2, 8, 2023, 20),
  (37, 3, 8, 2023, 80),
  (37, 1, 9, 2023, 10),
  (38, 2, 7, 2023, 50),
  (38, 3, 7, 2023, 25),
  (38, 1, 7, 2023, 70),
  (38, 4, 8, 2023, 15),
  (38, 1, 8, 2023, 60),
  (38, 2, 9, 2023, 5),
  (39, 1, 7, 2023, 80),
  (39, 4, 7, 2023, 50),
  (39, 2, 7, 2023, 150),
  (39, 3, 8, 2023, 30),
  (39, 2, 8, 2023, 90),
  (39, 1, 9, 2023, 15),
  (40, 1, 7, 2023, 70),
  (40, 2, 7, 2023, 40),
  (40, 3, 7, 2023, 120),
  (40, 4, 8, 2023, 25),
  (40, 1, 8, 2023, 100),
  (40, 3, 9, 2023, 20),
  (41, 2, 7, 2023, 80),
  (41, 4, 7, 2023, 50),
  (41, 1, 7, 2023, 150),
  (41, 3, 8, 2023, 30),
  (41, 2, 8, 2023, 90),
  (41, 1, 9, 2023, 15),
  (42, 1, 7, 2023, 70),
  (42, 2, 7, 2023, 40),
  (42, 3, 7, 2023, 120),
  (42, 4, 8, 2023, 25),
  (42, 1, 8, 2023, 100),
  (42, 3, 9, 2023, 20),
  (43, 3, 7, 2023, 60),
  (43, 4, 7, 2023, 30),
  (43, 1, 7, 2023, 90),
  (43, 2, 8, 2023, 20),
  (43, 3, 8, 2023, 80),
  (43, 1, 9, 2023, 10),
  (44, 2, 7, 2023, 50),
  (44, 3, 7, 2023, 25),
  (44, 1, 7, 2023, 70),
  (44, 4, 8, 2023, 15),
  (44, 1, 8, 2023, 60),
  (44, 2, 9, 2023, 5),
  (45, 1, 7, 2023, 80),
  (45, 4, 7, 2023, 50),
  (45, 2, 7, 2023, 150),
  (45, 3, 8, 2023, 30),
  (45, 2, 8, 2023, 90),
  (45, 1, 9, 2023, 15),
  (46, 1, 7, 2023, 70),
  (46, 2, 7, 2023, 40),
  (46, 3, 7, 2023, 120),
  (46, 4, 8, 2023, 25),
  (46, 1, 8, 2023, 100),
  (46, 3, 9, 2023, 20),
  (47, 3, 7, 2023, 60),
  (47, 4, 7, 2023, 30),
  (47, 1, 7, 2023, 90),
  (47, 2, 8, 2023, 20),
  (47, 3, 8, 2023, 80),
  (47, 1, 9, 2023, 10),
  (48, 2, 7, 2023, 50),
  (48, 3, 7, 2023, 25),
  (48, 1, 7, 2023, 70),
  (48, 4, 8, 2023, 15),
  (48, 1, 8, 2023, 60),
  (48, 2, 9, 2023, 5),
  (49, 1, 7, 2023, 80),
  (49, 4, 7, 2023, 50),
  (49, 2, 7, 2023, 150),
  (49, 3, 8, 2023, 30),
  (49, 2, 8, 2023, 90),
  (49, 1, 9, 2023, 15),
  (50, 1, 7, 2023, 70),
  (50, 2, 7, 2023, 40),
  (50, 3, 7, 2023, 120),
  (50, 4, 8, 2023, 25),
  (50, 1, 8, 2023, 100),
  (50, 3, 9, 2023, 20);
