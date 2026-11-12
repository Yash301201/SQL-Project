-- =====================================================================
-- PART 8: FINAL PROJECT DEMONSTRATION - QUERY SET
-- College Placement Management and Recruitment Database
-- =====================================================================
-- Purpose: Use only these 8 queries during the project review/demo.
-- =====================================================================

USE college_placement_db;

-- QUERY 1: OVERALL DATABASE SUMMARY
SELECT
    (SELECT COUNT(*) FROM students) AS total_students,
    (SELECT COUNT(*) FROM companies) AS total_companies,
    (SELECT COUNT(*) FROM job_roles) AS total_job_roles,
    (SELECT COUNT(*) FROM applications) AS total_applications,
    (SELECT COUNT(*) FROM selections) AS total_selections,
    (SELECT COUNT(*) FROM offers) AS total_offers;

-- QUERY 2: DEPARTMENT-WISE PLACEMENT ANALYSIS
SELECT
    d.department_name,
    COUNT(s.student_id) AS total_students,
    SUM(CASE WHEN s.placement_status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    SUM(CASE WHEN s.placement_status = 'Not Placed' THEN 1 ELSE 0 END) AS not_placed_students,
    ROUND(AVG(s.cgpa), 2) AS average_cgpa,
    MAX(s.cgpa) AS highest_cgpa,
    MIN(s.cgpa) AS lowest_cgpa
FROM departments d
LEFT JOIN students s
    ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY placed_students DESC;

-- QUERY 3: COMPLETE APPLICATION TRACKING
SELECT
    a.application_id,
    s.student_name,
    d.department_name,
    c.company_name,
    j.role_title,
    a.application_date,
    a.application_status,
    a.eligibility_status,
    a.resume_submitted
FROM applications a
INNER JOIN students s
    ON a.student_id = s.student_id
INNER JOIN departments d
    ON s.department_id = d.department_id
INNER JOIN company_drives cd
    ON a.company_drive_id = cd.company_drive_id
INNER JOIN companies c
    ON cd.company_id = c.company_id
INNER JOIN job_roles j
    ON a.role_id = j.role_id
ORDER BY a.application_date, s.student_name;

-- QUERY 4: COMPANY-WISE RECRUITMENT ANALYSIS
SELECT
    c.company_name,
    c.industry,
    COUNT(DISTINCT a.application_id) AS total_applications,
    COUNT(DISTINCT sel.selection_id) AS total_selections,
    COUNT(DISTINCT o.offer_id) AS total_offers,
    ROUND(AVG(sel.final_score), 2) AS average_selection_score,
    MAX(o.annual_ctc) AS highest_ctc
FROM companies c
LEFT JOIN company_drives cd
    ON c.company_id = cd.company_id
LEFT JOIN applications a
    ON cd.company_drive_id = a.company_drive_id
LEFT JOIN selections sel
    ON a.application_id = sel.application_id
LEFT JOIN offers o
    ON sel.selection_id = o.selection_id
GROUP BY c.company_id, c.company_name, c.industry
ORDER BY total_applications DESC;

-- QUERY 5: HIGHEST PACKAGE OFFERED
SELECT
    s.student_name,
    c.company_name,
    j.role_title,
    o.annual_ctc,
    o.offer_status
FROM offers o
INNER JOIN selections sel
    ON o.selection_id = sel.selection_id
INNER JOIN applications a
    ON sel.application_id = a.application_id
INNER JOIN students s
    ON a.student_id = s.student_id
INNER JOIN company_drives cd
    ON a.company_drive_id = cd.company_drive_id
INNER JOIN companies c
    ON cd.company_id = c.company_id
INNER JOIN job_roles j
    ON a.role_id = j.role_id
WHERE o.annual_ctc = (
    SELECT MAX(annual_ctc)
    FROM offers
);

-- QUERY 6: STUDENT SKILL PROFILE
SELECT
    s.student_name,
    sk.skill_name,
    sk.skill_category,
    ss.proficiency_level,
    ss.years_of_experience
FROM students s
INNER JOIN student_skills ss
    ON s.student_id = ss.student_id
INNER JOIN skills sk
    ON ss.skill_id = sk.skill_id
ORDER BY s.student_name, sk.skill_name;

-- QUERY 7: INTERVIEW PERFORMANCE ANALYSIS
SELECT
    s.student_name,
    c.company_name,
    j.role_title,
    ROUND(AVG(ir.score), 2) AS average_interview_score,
    MAX(ir.score) AS highest_interview_score,
    COUNT(ir.round_id) AS interview_rounds
FROM interview_rounds ir
INNER JOIN applications a
    ON ir.application_id = a.application_id
INNER JOIN students s
    ON a.student_id = s.student_id
INNER JOIN company_drives cd
    ON a.company_drive_id = cd.company_drive_id
INNER JOIN companies c
    ON cd.company_id = c.company_id
INNER JOIN job_roles j
    ON a.role_id = j.role_id
WHERE ir.score IS NOT NULL
GROUP BY s.student_id, s.student_name, c.company_id, c.company_name, j.role_id, j.role_title
ORDER BY average_interview_score DESC;

-- QUERY 8: FINAL SELECTED STUDENT + OFFER REPORT
SELECT
    s.student_id,
    s.student_name,
    d.department_name,
    s.cgpa,
    c.company_name,
    j.role_title,
    sel.selection_date,
    sel.final_score,
    o.annual_ctc,
    o.offer_status,
    o.joining_date
FROM selections sel
INNER JOIN applications a
    ON sel.application_id = a.application_id
INNER JOIN students s
    ON a.student_id = s.student_id
INNER JOIN departments d
    ON s.department_id = d.department_id
INNER JOIN company_drives cd
    ON a.company_drive_id = cd.company_drive_id
INNER JOIN companies c
    ON cd.company_id = c.company_id
INNER JOIN job_roles j
    ON a.role_id = j.role_id
LEFT JOIN offers o
    ON sel.selection_id = o.selection_id
WHERE sel.selection_status = 'Selected'
ORDER BY o.annual_ctc DESC, s.student_name;

-- =====================================================================
-- END OF MINIMAL PART 8
-- =====================================================================