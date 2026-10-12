# College Placement Management and Recruitment Database

A relational database project built using **MySQL 8.0+** to manage college placement activities, student profiles, company recruitment, job applications, interview rounds, selections, and job offers.

## 📌 Project Overview

The College Placement Management and Recruitment Database provides a structured way to organize and analyze campus recruitment information.

The database connects students and departments with their skills, companies, job roles, placement drives, applications, interviews, selections, and offers. It also includes reporting queries to help analyze student performance, recruitment activity, and placement statistics.

## 🎯 Project Objectives

- Design a relational database for college placement management.
- Maintain student, department, skill, and company information.
- Manage job roles, placement drives, and student applications.
- Track interview performance, selection status, and job offers.
- Apply primary keys, foreign keys, unique constraints, and check constraints.
- Use indexes, views, stored procedures, and triggers.
- Generate reports using SQL joins, aggregate functions, subqueries, and conditional expressions.

## 🛠️ Technologies Used

- **Database:** MySQL 8.0+
- **Database Management Tool:** MySQL Workbench
- **Language:** SQL

## 🗂️ Database Structure

The database is named `college_placement_db` and contains the following 12 tables:

| Table | Purpose |
|---|---|
| `departments` | Stores department details. |
| `students` | Stores student information, CGPA, backlogs, and placement status. |
| `skills` | Maintains the available skills and their categories. |
| `student_skills` | Maps students to their skills and proficiency levels. |
| `companies` | Stores company and contact information. |
| `job_roles` | Maintains job descriptions, eligibility criteria, locations, and salary packages. |
| `placement_drives` | Stores placement drive schedules and details. |
| `company_drives` | Connects companies with placement drives and eligibility criteria. |
| `applications` | Tracks student applications and eligibility status. |
| `interview_rounds` | Records interview schedules, scores, status, and feedback. |
| `selections` | Stores student selection details and final scores. |
| `offers` | Records job offers, annual CTC, joining dates, and offer status. |

## 🗺️ Entity-Relationship Diagram (ERD)

The ER diagram represents the entities, attributes, primary keys, foreign keys, and relationships in the College Placement Management and Recruitment Database. It uses Chen notation to illustrate how the database entities are connected.

### ER Diagram




**Diagram format:** Chen notation  
**Database:** MySQL 8.0+
## 🔗 Relationships

The database uses primary keys and foreign keys to maintain relationships between related tables.

- A department can have multiple students.
- A student can have multiple skills through `student_skills`.
- A company can offer multiple job roles.
- A placement drive can include multiple companies through `company_drives`.
- Students can submit applications for job roles associated with company drives.
- An application can have multiple interview rounds.
- An application can have one selection record.
- A selection can have one offer record.

## ⚙️ Project Modules

### Part 1: Database and Table Creation
Creates the `college_placement_db` database and its 12 relational tables, including primary keys, foreign keys, unique constraints, and check constraints.

### Part 2: Sample Data
Inserts sample records for departments, students, skills, companies, job roles, placement drives, applications, interviews, selections, and offers.

### Part 3: Indexes
Creates indexes on frequently searched and filtered columns, such as department, CGPA, placement status, application status, interview date, and offer CTC.

### Part 4: Views
Creates reusable views for common reporting requirements, including:

- Student placement summary
- Company job role details
- Placement drive participation
- Application tracking
- Interview performance
- Selection and offer details
- Department-wise placement statistics
- Company recruitment statistics
- Student skill profile
- Open job roles

### Part 5: Stored Procedures
Includes stored procedures for retrieving student details, counting students by department, calculating average CGPA, checking job eligibility, and generating recruitment summaries.

### Part 6: Triggers
Implements database triggers for selected validation and status-management operations. These include student validation, interview validation, selection-related status updates, and offer validation.

### Part 7: SQL Queries
Contains reporting queries that demonstrate joins, filtering, grouping, aggregate functions, subqueries, and conditional expressions.

## 📊 Query Bank: 10 Demonstration Queries

The query set includes the following use cases:

1. **Student and Department Details:** Displays students with their department names and placement status.
2. **High-Performing Students:** Finds students with CGPA of 8 or above and no backlogs.
3. **Department Student Count:** Counts students in each department.
4. **Department Average CGPA:** Finds departments whose average CGPA is above 8.
5. **Company Job Roles:** Displays companies, job roles, work locations, and salary packages.
6. **Above-Average Salary Roles:** Finds job roles whose salary package exceeds the overall average.
7. **Application Tracking:** Displays application details with student names, company names, and job roles.
8. **Application Status Analysis:** Counts applications by application status.
9. **Selected Students and Offers:** Displays selection results and associated offer details.
10. **Department-Wise Placement Summary:** Reports total students, placed students, students not placed, and average CGPA for each department.

## 🧠 SQL Concepts Demonstrated

- Database and table creation
- Primary keys and foreign keys
- Unique and check constraints
- `INNER JOIN` and `LEFT JOIN`
- `WHERE`, `ORDER BY`, `GROUP BY`, and `HAVING`
- Aggregate functions: `COUNT()`, `AVG()`, `SUM()`, `MIN()`, `MAX()`
- Subqueries
- `CASE` expressions
- Index creation
- Views
- Stored procedures with parameters
- Triggers and validation logic

## 🚀 How to Run the Project

### Prerequisites
- MySQL Server 8.0 or later
- MySQL Workbench or another compatible MySQL client
- The project SQL script

### Steps
1. Open MySQL Workbench and connect to your MySQL server.
2. Open the main SQL script.
3. Review the database reset section before execution. **The reset section drops existing project tables and database objects**, so back up any data you want to keep.
4. Execute the database and table creation section.
5. Execute the sample data insertion section.
6. Execute the indexes and views sections.
7. Execute the stored procedures and triggers sections.
8. Execute the Part 7 query set to view the reports.

For troubleshooting, execute the script in smaller sections and check the Action Output panel for errors.

## 🔍 Example Queries

**Find students with CGPA of 8 or above and no backlogs**

```sql
USE college_placement_db;

SELECT
    student_name,
    cgpa,
    backlogs
FROM students
WHERE cgpa >= 8.00
  AND backlogs = 0
ORDER BY cgpa DESC;
```

**Count students in each department**

```sql
SELECT
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM departments AS d
LEFT JOIN students AS s
    ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_students DESC;
```

## 📈 Expected Outcomes

This project demonstrates how a relational database can organize recruitment information and support queries for:

- Student academic and placement reporting
- Department-wise student statistics
- Company and job-role analysis
- Application-status tracking
- Interview and selection tracking
- Offer and salary analysis

## 📁 Repository Contents

The repository should contain:

- `README.md` — project overview, database structure, features, and setup instructions.
- `college_placement_management.sql` — the main SQL script containing database objects, sample data, and queries.

Use your actual SQL filename when uploading the script.

## 👨‍💻 Author

**Sai Siva Yashaswi Surige**

GitHub: [Yash301201](https://github.com/Yash301201)
