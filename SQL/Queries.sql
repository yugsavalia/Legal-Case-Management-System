--G4-T15

--TOPIC : LEGAL CASE MANAGEMENT SYSTEM


--TEAM MEMBERS
--FARZAN BHALARA : 202301248
--MAHEK JIKKAR   : 202301260
--PRIYANKA GARG  : 202301262
--YUG SAVALIA    : 202301263
	



--Admin queries

--1)List all users under a particular admin
	SELECT u.user_id, u.name
	FROM user_ u
	JOIN manages m ON u.user_id = m.user_id
	WHERE m.admin_id = 1;


--2) list all Petitioners, Judges, Lawyers in a particular admin
	-- Petitioners
	SELECT u.user_id, u.name, 'Petitioner' AS Role
	FROM user_ u
	JOIN manages m ON u.user_id = m.user_id
	JOIN petitioner p ON u.user_id = p.petitioner_id
	WHERE m.admin_id = 1

	UNION

	-- Judges
	SELECT u.user_id, u.name, 'Judge' AS Role
	FROM user_ u
	JOIN manages m ON u.user_id = m.user_id
	JOIN judge j ON u.user_id = j.judge_id
	WHERE m.admin_id = 1

	UNION

	-- Lawyers
	SELECT u.user_id, u.name, 'Lawyer' AS Role
	FROM user_ u
	JOIN manages m ON u.user_id = m.user_id
	JOIN lawyer l ON u.user_id = l.lawyer_id
	WHERE m.admin_id = 1;


--3)List all users who are both Petitioners and Judges under a particular admin
SELECT u.user_id, u.name
	FROM user_ u
	JOIN manages m ON u.user_id = m.user_id
	JOIN petitioner p ON u.user_id = p.petitioner_id
	JOIN judge j ON u.user_id = j.judge_id
	WHERE m.admin_id = 1;


--4)Users who are both Petitioners and Lawyers under a particular Admin
	SELECT u.user_id, u.name
	FROM user_  u
	JOIN manages m ON u.user_id = m.user_id
	JOIN petitioner p ON u.user_id = p.petitioner_id
	JOIN lawyer l ON u.user_id = l.lawyer_id
	WHERE m.admin_id = 1;











--Petitioner Queries 

--5) Basic Petitioner Information Lookup
             SELECT p.petitioner_id, p.city, p.state_, pe.email_id, pp.phone_no
             FROM petitioner p
             LEFT JOIN petitioner_email pe ON p.petitioner_id = pe.petitioner_id
             LEFT JOIN petitioner_phone pp ON p.petitioner_id = pp.petitioner_id
             WHERE p.petitioner_id = 2; -- Replace with actual ID


--6) Active Cases Summary- See all active cases for a petitioner.
            SELECT c.case_id, c.case_type, c.case_status, c.filing_date, c.next_hearing_date
            FROM case c
            JOIN petitioner p ON c.petitioner_id = p.petitioner_id
            WHERE p.petitioner_id = 4 -- Replace with actual ID
            AND c.case_status = 'In Progress';


--7) Petitioner Cases with Assigned Lawyers-View all active cases with their representing lawyers
          SELECT p.petitioner_id,
                          p.city || ', ' || p.state_ AS location,
                          c.case_id, c.case_type, c.case_status,
                          l.lawyer_id, l.specialisation,
                          r.role_ AS lawyer_role
          FROM petitioner p
          JOIN case c ON p.petitioner_id = c.petitioner_id
          JOIN represents r ON c.case_id = r.case_id
          JOIN lawyer l ON r.lawyer_id = l.lawyer_id
          WHERE c.case_status = 'Active'
          ORDER BY p.petitioner_id, c.case_id;


--8) Petitioner Cases with Pending Appeals-Track ongoing appeals for each client
        SELECT p.petitioner_id, c.case_id, c.case_type, a.appeal_id, a.appeal_status,
                         curr_co.place AS current_court,
                         high_co.place AS higher_court
         FROM petitioner p
         JOIN case c ON p.petitioner_id = c.petitioner_id
         JOIN appeal a ON c.case_id = a.case_id
         JOIN court curr_co ON a.current_court = curr_co.court_id
         JOIN court high_co ON a.higher_court = high_co.court_id
         WHERE a.appeal_status = 'Pending'
         ORDER BY p.petitioner_id;


--9) Petitioner Location Analysis-Understand geographical distribution of petitioners
	SELECT 
    	state_,
    	city,
    	COUNT(*) AS petitioner_count,
    	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM petitioner), 2) AS percentage
	FROM petitioner
	GROUP BY state_, city
	ORDER BY petitioner_count DESC;


--10) Petitioner Document Checklist- view all documents submitted by a petitioner
	SELECT 
    	d.doc_id,
    	d.doc_type,
    	d.upload_date,
    	c.case_id
	FROM document d
	JOIN case_ c ON d.case_id = c.case_id
	JOIN petitioner p ON c.petitioner_id = p.petitioner_id
	WHERE p.petitioner_id = 1 -- example 1
	ORDER BY d.upload_date DESC;


--11) Petitioners with Multiple Cases
	SELECT 
    	p.petitioner_id,
    	p.city,
    	p.state_,
    	COUNT(c.case_id) AS case_count
	FROM petitioner p
	JOIN case_ c ON p.petitioner_id = c.petitioner_id
	GROUP BY p.petitioner_id
	HAVING COUNT(c.case_id) > 1
	ORDER BY case_count DESC;


--12) ⁠Average Hearings per Case Type
	SELECT 
    	c.case_type,
    	AVG(h.hearing_count) AS avg_hearings
	FROM case c
	JOIN (
    	SELECT case_id, COUNT(*) AS hearing_count
    	FROM hearing
    	GROUP BY case_id
	) h ON c.case_id = h.case_id
	GROUP BY c.case_type;

--13) Petitioners Whose Cases Were Heard in More Than One Court Type
	SELECT p.petitioner_id, u.name, COUNT(DISTINCT ct.court_type) AS court_types
	FROM petitioner p
	JOIN user_ u ON p.petitioner_id = u.user_id
	JOIN case_ c ON p.petitioner_id = c.petitioner_id
	JOIN court ct ON c.court_id = ct.court_id
	GROUP BY p.petitioner_id, u.name
	HAVING COUNT(DISTINCT ct.court_type) > 1;






--Lawyers Queries

--14) View All Cases Assigned to a Lawyer
	SELECT c.*, r.role_
	FROM case_ c
	JOIN represents r ON c.case_id = r.case_id
	WHERE r.lawyer_id = [LAWYER_ID];


--15) View Active/Open Cases Only
	SELECT c.*
	FROM case_ c
	JOIN represents r ON c.case_id = r.case_id
	WHERE r.lawyer_id = [LAWYER_ID] AND c.case_status = 'In Progress';


--16) Lawyer's Longest-Running Active Case
	SELECT c.*, CURRENT_DATE - c.filing_date AS days_open
	FROM case_ c
	JOIN represents r ON c.case_id = r.case_id
	WHERE r.lawyer_id = [LAWYER_ID]
 	 AND c.case_status = 'In Progress'
	ORDER BY days_open DESC
	LIMIT 1;


--17) Documents Uploaded in a Lawyer's Cases
	SELECT d.doc_id, d.doc_type, d.upload_date, d.file_path
	FROM document d
	JOIN represents r ON d.case_id = r.case_id
	WHERE r.lawyer_id = [LAWYER_ID]
  	AND r.case_id = [CASE_ID];


--18)Get Case Verdict Status after each Hearing for Lawyer
	SELECT v.verdict_id, v.verdict_type, v.verdict_date
	FROM verdict v
	JOIN represents r ON v.case_id = r.case_id
	WHERE r.lawyer_id = [LAWYER_ID]
 	 AND r.case_id = [CASE_ID];


--19) Verdicts for Closed Cases Represented by the Lawyer
	SELECT v.*
	FROM verdict v
	JOIN case_ c ON c.case_id = v.case_id
	JOIN represents r ON c.case_id = r.case_id
	WHERE r.lawyer_id = [LAWYER_ID] 
  	AND c.case_status = 'Closed';


--20) Number of Cases by Status for the Lawyer
	SELECT c.case_status, COUNT(*) AS total
	FROM case_ c
	JOIN represents r ON c.case_id = r.case_id
	WHERE r.lawyer_id = [LAWYER_ID]
	GROUP BY c.case_status;


--21) Get Lawyer's Performance Report - number of cases won and lost
	SELECT 
 	(SELECT COUNT(*) 
  	FROM represents r 
   	WHERE r.lawyer_id = [LAWYER_ID] AS total_cases,
  	(SELECT COUNT(*) 
   	FROM hearing h 
	JOIN represents r ON h.case_id = r.case_id 
	WHERE r.lawyer_id = [LAWYER_ID] AS total_hearings,
  	(SELECT COUNT(*) 
   	FROM represents r
   	JOIN verdict v ON r.case_id = v.case_id
   	WHERE r.lawyer_id = [LAWYER_ID]
     	AND (
       		(r.role_ = 'Proposition' AND v.verdict_type = 'Guilty') OR
       		(r.role_ = 'Opposition' AND v.verdict_type = 'Not Guilty')
     	)
  	) AS cases_won,
  	(SELECT COUNT(*) 
   	FROM represents r
   	JOIN verdict v ON r.case_id = v.case_id
   	WHERE r.lawyer_id = [LAWYER_ID]
     	AND (
       		(r.role_ = 'Proposition' AND v.verdict_type = 'Not Guilty') OR
       		(r.role_ = 'Opposition' AND v.verdict_type = 'Guilty')
     	)
  	) AS cases_lost;


--22) Find Opposition Lawyer in a Case
	SELECT l.lawyer_id, l.email
	FROM lawyer l
	JOIN represents r ON l.lawyer_id = r.lawyer_id
	WHERE r.case_id = [CASE_ID]
  	AND l.lawyer_id != [LAWYER_ID]
	LIMIT 1;


--23) Lawyer's Cases That Are Eligible for Appeal 
	WITH court_hierarchy AS (
  	SELECT 'District Court' AS court_type, 1 AS rank UNION ALL
  	SELECT 'High Court', 2 UNION ALL
  	SELECT 'Supreme Court', 3
	),
	case_details AS (
  	SELECT 
   	 c.case_id,
    	ct.court_id AS current_court_id,
    	ct.court_type AS current_court_type,
    	ch.rank AS current_rank,
    	a.appeal_id
  	FROM case_ c
  	JOIN verdict v ON c.case_id = v.case_id
  	JOIN represents r ON c.case_id = r.case_id
  	JOIN court ct ON v.court_id = ct.court_id
  	JOIN court_hierarchy ch ON ct.court_type = ch.court_type
  	LEFT JOIN appeal a ON c.case_id = a.case_id
  	WHERE r.lawyer_id = [LAWYER_ID]
    	AND c.case_status = 'Closed'
	),
	possible_appeals AS (
  	SELECT 
    	cd.*,
    	ch2.court_type AS higher_court_type
  	FROM case_details cd
  	LEFT JOIN court_hierarchy ch2 ON ch2.rank = cd.current_rank + 1
	)
	SELECT 
  	case_id,
  	current_court_id,
  	current_court_type,
  	higher_court_type,
  	CASE
    	WHEN appeal_id IS NOT NULL THEN 'Already Appealed'
    	WHEN higher_court_type IS NOT NULL THEN 'Appeal Possible'
    	ELSE 'No Higher Court'
  	END AS can_appeal
	FROM possible_appeals;
 

--24) To Check Appeal Status for a given appeal id
	SELECT 
	  a.appeal_id,
	  a.appeal_status,           
	  ct.court_id AS current_court_id,
	  ct.court_type AS current_court_type,
	  ht.court_id AS higher_court_id,
	  ht.court_type AS higher_court_type
	FROM appeal a
	JOIN court ct ON a.current_court = ct.court_id     
	LEFT JOIN court ht ON a.higher_court = ht.court_id 
	WHERE a.appeal_id = [APPEAL_ID];


--25) total Count Hearings in March 2024
	SELECT COUNT(*) AS total_hearings_in_march
	FROM hearing h
	JOIN case_ c ON h.case_id = c.case_id
	JOIN represents r ON c.case_id = r.case_id
	WHERE EXTRACT(MONTH FROM h.hearing_date) = 3
	AND EXTRACT(YEAR FROM h.hearing_date) = 2024
  	AND r.lawyer_id = [LAWYER_ID];  
	





--Judge Queries

--26) All cases handled by judge 
	SELECT u.name AS judge_name, j.email, c.case_id, c.case_type, c.case_status, c.filing_date
	FROM judge j
	JOIN user_ u ON j.judge_id = u.user_id
	JOIN case_ c ON j.judge_id = c.judge_id
	WHERE j.judge_id = 18;

 
--27) Count of cases handled by judge 
	SELECT u.name AS judge_name, j.email, COUNT(c.case_id) AS total_cases
	FROM judge j
	JOIN user_ u ON j.judge_id = u.user_id
	LEFT JOIN case_ c ON j.judge_id = c.judge_id
	WHERE j.judge_id = 19
	GROUP BY u.name, j.email;
 

--28) All documents in cases judged by judge 
	SELECT u.name AS judge_name, c.case_id, d.doc_id, d.doc_type, d.upload_date
	FROM judge j
	JOIN user_ u ON j.judger_id = u.user_id
	JOIN case_ c ON j.judge_id = c.judge_id
	JOIN document d ON c.case_id = d.case_id
	WHERE j.judge_id = 21;
 

--29) Average case duration for judge
	WITH latest_verdict AS (
    	SELECT 
        case_id,
        MAX(verdict_date) AS final_verdict_date
    	FROM 
        verdict
    	GROUP BY 
        case_id
	)
	SELECT 
   	AVG(final_verdict_date - c.filing_date) AS average_case_duration_days
	FROM 
    	case_ c
	JOIN 
    	latest_verdict lv ON c.case_id = lv.case_id
	WHERE 
    	c.judge_id = 22;


--30) Court info for judge 
	SELECT u.name AS judge_name, ct.place, ct.court_type
	FROM judge j
	JOIN user_ u ON j.judge_id = u.user_id
	JOIN court ct ON j.court_id = ct.court_id
	WHERE j.judge_id = 24;


--31) Appeales approved and denied by judge 
	SELECT 
    	v.verdict_type,
    	COUNT(DISTINCT a.appeal_id) AS total_appeals
	FROM judge j
	JOIN case_ c ON j.judge_id = c.judge_id
	JOIN verdict v ON c.case_id = v.case_id
	JOIN appeal a ON c.case_id = a.case_id
	WHERE j.judge_id = 19
  	AND v.verdict_type IN ('approved', 'denied')
	GROUP BY v.verdict_type;


--32) Number of hearings for judge 
	SELECT u.name AS judge_name, COUNT(h.hearing_no) AS total_hearings
	FROM judge j
	JOIN user_ u ON j.judge_id = u.user_id
	JOIN case_ c ON j.judge_id = c.judge_id
	JOIN hearing h ON c.case_id = h.case_id
	WHERE j.judge_id = 20
	GROUP BY u.name;


--33) Unique petitioners under judge 
	SELECT u.name AS judge_name, COUNT(DISTINCT c.petitioner_id) AS unique_petitioners
	FROM judge j
	JOIN user_ u ON j.judge_id = u.user_id
	JOIN case_ c ON j.judge_id = c.judge_id
	WHERE j.judge_id = 18
	GROUP BY u.name;


--34) Hearing Schedule Along with Judge and Petitioner Info
	SELECT 
    	h.case_id,
    	h.hearing_no,
   	h.hearing_date,
    	c.filing_date,
    	p.petitioner_id,
    	u.name AS petitioner_name,
    	j.judge_id,
    	u.name AS judge_name	
	FROM 
  	hearing h
	JOIN 
    	case_ c ON h.case_id = c.case_id
	JOIN 
    	petitioner p ON c.petitioner_id = p.petitioner_id
	JOIN 
    	user_ u ON p.petitioner_id = u.user_id
	JOIN 
    	judge j ON c.judge_id = j.judge_id
	JOIN 
    	user_ u ON j.judge_id = u.user_id;


--35)average number of hearings per case, court-wise.
	SELECT 
    	crt.court_type,
    	crt.place,
    	AVG(h.hearing_count) AS avg_hearings
	FROM 
    	(SELECT case_id, COUNT(*) AS hearing_count FROM hearing GROUP BY case_id) h
	JOIN 
    	case_ c ON h.case_id = c.case_id
	JOIN 
    	court crt ON c.court_id = crt.court_id
	GROUP BY 
    	crt.court_type, crt.place;

