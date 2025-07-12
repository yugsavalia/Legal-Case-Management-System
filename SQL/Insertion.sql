--G4-T15

--TOPIC : LEGAL CASE MANAGEMENT SYSTEM

--TEAM MEMBERS
--FARZAN BHALARA : 202301248
--MAHEK JIKKAR   : 202301260
--PRIYANKA GARG  : 202301262
--YUG SAVALIA    : 202301263
	

--INSERT SCRIPTS


INSERT INTO myadmin (admin_id) VALUES 
(1),
(2),
(3);

INSERT INTO myuser (user_id, name) VALUES
(1, 'Riya Sharma'),
(2, 'Amit Patel'),
(3, 'Neha Kumar'),
(4, 'Rohit Mehra'),
(5, 'Sneha Roy'),
(6, 'Kunal Das'),
(7, 'Vikram Sethi'),
(8, 'Pooja Verma'),
(9, 'Rahul Bhatia'),
(10, 'Anjali Nair'),
(11, 'Manish Kaul'),
(12, 'Divya Singh'),
(13, 'Aarav Joshi'),
(14, 'Isha Malhotra'),
(15, 'Sameer Khan'),
(16, 'Nisha Kapoor'),
(17, 'Deepak Sen'),
(18, 'Radhika Menon'),
(19, 'Arjun Saxena'),
(20, 'Simran Kaur');


INSERT INTO petitioner (petitioner_id, city, state_, pincode) VALUES
(1, 'Delhi', 'Delhi', '110001'),
(2, 'Delhi', 'Delhi', '110002'),
(3, 'Delhi', 'Delhi', '110003'),
(4, 'Surat', 'Gujarat', '395003'),
(5, 'Ahmedabad', 'Gujarat', '380001'),
(6, 'Surat', 'Gujarat', '395004'),
(7, 'Surat', 'Gujarat', '395002'),
(8, 'Lucknow', 'Uttar Pradesh', '226001'),
(9, 'Kanpur', 'Uttar Pradesh', '208001'),
(10, 'Jaipur', 'Rajasthan', '302001'),
(11, 'Indore', 'Madhya Pradesh', '452001'),
(12, 'Bhopal', 'Madhya Pradesh', '462001');

INSERT INTO lawyer (lawyer_id, specialisation, experience, email, phone_no) VALUES
(13, 'Criminal Law', 7, 'adv.riya@example.com', '9123456780'),
(14, 'Criminal Law', 5, 'adv.amit@example.com', '9234567891'),
(15, 'Family Law', 10, 'adv.neha@example.com', '9345678902'),
(16, 'Corporate Law', 8, 'adv.rohit@example.com', '9456789013'),
(17, 'Intellectual Property Law', 6, 'adv.sneha@example.com', '9567890124');


INSERT INTO judge (judge_id, court_id, email) VALUES
(18, 0, 'judge.arjun@example.com'),
(19, 0, 'judge.simran@example.com'),
(20, 0, 'judge.deepak@example.com');


INSERT INTO court (court_id, place, court_type) VALUES
(1, 'Delhi', 'Supreme Court'),
(2, 'Delhi', 'High Court'),
(3, 'Ahmedabad', 'High Court'),
(4, 'Surat', 'District Court'),
(5, 'Lucknow', 'District Court'),
(6, 'Kanpur', 'District Court'),
(7, 'Jaipur', 'District Court');


INSERT INTO petitioner_email (petitioner_id, email_id) VALUES
(1, 'riya.sharma01@example.com'),
(2, 'amit.patel01@example.com'),
(2, 'amit.patel02@example.com'),
(2, 'amit.patel03@example.com'),
(3, 'neha.kumar@example.com'),
(4, 'rohit.mehra@example.com'),
(5, 'sneha.roy01@example.com'),
(5, 'sneha.roy02@example.com'),
(6, 'kunal.das@example.com'),
(7, 'vikram.sethi01@example.com'),
(7, 'vikram.sethi02@example.com'),
(8, 'pooja.verma@example.com'),
(9, 'rahul.bhatia01@example.com'),
(9, 'rahul.bhatia02@example.com'),
(10, 'anjali.nair@example.com'),
(11, 'manish.kaul@example.com'),
(12, 'divya.singh@example.com'),
(6, 'kunal.das02@example.com'),
(8, 'pooja.verma02@example.com'),
(11, 'manish.kaul02@example.com');


INSERT INTO petitioner_phone (petitioner_id, phone_no) VALUES
(1, '9123456701'),
(1, '9123456702'),
(2, '9234567810'),
(3, '9345678920'),
(4, '9456789030'),
(4, '9456789031'),
(4, '9456789032'),
(5, '9567890140'),
(6, '9678901250'),
(7, '9789012360'),
(8, '9890123470'),
(8, '9890123471'),
(9, '9001234580'),
(10, '9112345690'),
(10, '9112345691'),
(11, '9223456700'),
(12, '9334567811'),
(5, '9567890141'),
(7, '9789012361'),
(9, '9001234581');


INSERT INTO myuser (user_id, name) VALUES
(21, 'Manish Khanna'),
(22, 'Alka Rani'),
(23, 'Rajiv Bhatia'),
(24, 'Neha Sinha');

INSERT INTO judge (judge_id, court_id, email) VALUES
(21, 4, 'manish.khanna@court.gov.in'),
(22, 5, 'alka.rani@court.gov.in'),
(23, 6, 'rajiv.bhatia@court.gov.in'),
(24, 7, 'neha.sinha@court.gov.in');

UPDATE judge SET court_id = 1 WHERE judge_id = 18;
UPDATE judge SET court_id = 2 WHERE judge_id = 19;
UPDATE judge SET court_id = 3 WHERE judge_id = 20;
UPDATE judge SET court_id = 4 WHERE judge_id = 21;
UPDATE judge SET court_id = 5 WHERE judge_id = 22;
UPDATE judge SET court_id = 6 WHERE judge_id = 23;
UPDATE judge SET court_id = 7 WHERE judge_id = 24;


INSERT INTO case (case_id, case_type, case_status, filing_date, next_hearing_date, petitioner_id, judge_id, court_id) VALUES
(1, 'Civil', 'In Progress', '2024-01-15', '2024-06-10', 1, 18, 1),
(2, 'Criminal', 'Closed', '2023-12-05', '2024-01-20', 2, 19, 2),
(3, 'Family', 'In Progress', '2024-02-20', '2024-07-15', 4, 20, 3),
(4, 'Property', 'In Progress', '2024-03-10', '2024-07-30', 4, 21, 4),
(5, 'Contract', 'In Progress', '2024-04-05', '2024-08-10', 5, 22, 5),
(6, 'Civil', 'Closed', '2023-11-11', '2024-01-15', 8, 23, 6),
(7, 'Criminal', 'In Progress', '2024-01-25', '2024-05-05', 11, 24, 7),
(8, 'Family', 'In Progress', '2024-02-05', '2024-08-20', 3, 18, 2),
(9, 'Property', 'Closed', '2023-09-20', '2024-02-15', 5, 20, 3),
(10, 'Contract', 'In Progress', '2024-03-01', '2024-07-01', 6, 21, 4),
(11, 'Civil', 'In Progress', '2024-01-30', '2024-06-25', 7, 21, 4),
(12, 'Criminal', 'Closed', '2024-02-10', '2024-06-30', 9, 23, 6),
(13, 'Family', 'Closed', '2023-10-05', '2024-03-20', 12, 24, 7),
(14, 'Property', 'In Progress', '2024-01-18', '2024-05-10', 4, 21, 4),
(15, 'Contract', 'Closed', '2024-02-28', '2024-07-05', 1, 18, 1),
(16, 'Civil', 'Closed', '2023-08-15', '2024-02-10', 3, 19, 2),
(17, 'Criminal', 'In Progress', '2024-01-05', '2024-05-20', 7, 21, 4),
(18, 'Family', 'In Progress', '2024-03-15', '2024-09-01', 6, 21, 4),
(19, 'Property', 'In Progress', '2024-02-12', '2024-07-20', 5, 22, 5),
(20, 'Contract', 'Closed', '2023-12-25', '2024-04-15', 8, 23, 6);


INSERT INTO document (doc_id, doc_type, file_path, upload_date, case_id) VALUES
(1, 'Petition Copy', '/docs/case1/petition.pdf', '2024-01-16', 1),
(2, 'Evidence', '/docs/case1/evidence1.pdf', '2024-01-18', 1),
(3, 'Petition Copy', '/docs/case2/petition.pdf', '2023-12-06', 2),
(4, 'Evidence', '/docs/case2/evidence1.pdf', '2023-12-10', 2),
(5, 'Final Decision', '/docs/case2/final_decision.pdf', '2024-01-21', 2),
(6, 'Petition Copy', '/docs/case3/petition.pdf', '2024-02-21', 3),
(7, 'Hearing Notes', '/docs/case3/hearing_notes.pdf', '2024-03-01', 3),
(8, 'Petition Copy', '/docs/case4/petition.pdf', '2024-03-11', 4),
(9, 'Evidence', '/docs/case4/evidence2.pdf', '2024-03-15', 4),
(10, 'Petition Copy', '/docs/case5/petition.pdf', '2024-04-06', 5),
(11, 'Hearing Notes', '/docs/case5/hearing_notes.pdf', '2024-04-20', 5),
(12, 'Petition Copy', '/docs/case6/petition.pdf', '2023-11-12', 6),
(13, 'Final Decision', '/docs/case6/final_decision.pdf', '2024-01-16', 6),
(14, 'Petition Copy', '/docs/case7/petition.pdf', '2024-01-26', 7),
(15, 'Evidence', '/docs/case7/evidence3.pdf', '2024-02-01', 7),
(16, 'Petition Copy', '/docs/case8/petition.pdf', '2024-02-06', 8),
(17, 'Hearing Notes', '/docs/case8/hearing_notes.pdf', '2024-02-20', 8),
(18, 'Petition Copy', '/docs/case9/petition.pdf', '2023-09-21', 9),
(19, 'Final Decision', '/docs/case9/final_decision.pdf', '2024-02-16', 9),
(20, 'Petition Copy', '/docs/case10/petition.pdf', '2024-03-02', 10),
(21, 'Evidence', '/docs/case10/evidence4.pdf', '2024-03-10', 10),
(22, 'Petition Copy', '/docs/case11/petition.pdf', '2024-01-31', 11),
(23, 'Hearing Notes', '/docs/case11/hearing_notes.pdf', '2024-02-15', 11),
(24, 'Petition Copy', '/docs/case12/petition.pdf', '2024-02-11', 12),
(25, 'Final Decision', '/docs/case12/final_decision.pdf', '2024-07-01', 12),
(26, 'Petition Copy', '/docs/case13/petition.pdf', '2023-10-06', 13),
(27, 'Final Decision', '/docs/case13/final_decision.pdf', '2024-03-21', 13),
(28, 'Petition Copy', '/docs/case14/petition.pdf', '2024-01-19', 14),
(29, 'Hearing Notes', '/docs/case14/hearing_notes.pdf', '2024-03-01', 14),
(30, 'Petition Copy', '/docs/case15/petition.pdf', '2024-02-28', 15),
(31, 'Final Decision', '/docs/case15/final_decision.pdf', '2024-07-06', 15),
(32, 'Petition Copy', '/docs/case16/petition.pdf', '2023-08-16', 16),
(33, 'Final Decision', '/docs/case16/final_decision.pdf', '2024-02-11', 16),
(34, 'Petition Copy', '/docs/case17/petition.pdf', '2024-01-06', 17),
(35, 'Evidence', '/docs/case17/evidence5.pdf', '2024-01-15', 17),
(36, 'Petition Copy', '/docs/case18/petition.pdf', '2024-03-16', 18),
(37, 'Hearing Notes', '/docs/case18/hearing_notes.pdf', '2024-04-01', 18),
(38, 'Petition Copy', '/docs/case19/petition.pdf', '2024-02-13', 19),
(39, 'Hearing Notes', '/docs/case19/hearing_notes.pdf', '2024-03-05', 19),
(40, 'Petition Copy', '/docs/case20/petition.pdf', '2023-12-26', 20),
(41, 'Final Decision', '/docs/case20/final_decision.pdf', '2024-04-16', 20);


INSERT INTO hearing (hearing_no, case_id, hearing_date) VALUES
(1, 1, '2024-01-20'),
(2, 1, '2024-02-10'),
(1, 2, '2023-12-10'),
(2, 2, '2024-01-10'),
(1, 3, '2024-02-25'),
(2, 3, '2024-03-10'),
(3, 3, '2024-04-05'),
(1, 4, '2024-03-15'),
(2, 4, '2024-04-05'),
(1, 5, '2024-04-10'),
(2, 5, '2024-04-25'),
(1, 6, '2023-11-20'),
(2, 6, '2023-12-10'),
(3, 6, '2024-01-05'),
(1, 7, '2024-02-01'),
(2, 7, '2024-02-15'),
(1, 8, '2024-02-10'),
(2, 8, '2024-02-25'),
(1, 9, '2023-09-25'),
(2, 9, '2023-10-10'),
(3, 9, '2023-12-01'),
(1, 10, '2024-03-05'),
(2, 10, '2024-03-20'),
(1, 11, '2024-02-05'),
(2, 11, '2024-02-25'),
(3, 11, '2024-03-10'),
(1, 12, '2024-02-15'),
(2, 12, '2024-03-10'),
(3, 12, '2024-06-20'),
(1, 13, '2023-10-10'),
(2, 13, '2023-11-15'),
(3, 13, '2024-01-30'),
(1, 14, '2024-01-30'),
(2, 14, '2024-02-15'),
(1, 15, '2024-03-10'),
(2, 15, '2024-05-05'),
(1, 16, '2023-08-25'),
(2, 16, '2023-09-15'),
(3, 16, '2023-11-10'),
(1, 17, '2024-01-12'),
(2, 17, '2024-01-28'),
(1, 18, '2024-03-20'),
(2, 18, '2024-04-05'),
(1, 19, '2024-02-20'),
(2, 19, '2024-03-01'),
(1, 20, '2023-12-30'),
(2, 20, '2024-01-15');

INSERT INTO appeal (appeal_id, case_id, current_court, higher_court, appeal_status) VALUES
(1, 2, 3, 5, 'Pending'),
(2, 3, 4, 5, 'Accepted'),
(3, 6, 5, 1, 'Rejected'),
(4, 9, 3, 5, 'Pending'),
(5, 11, 6, 1, 'Accepted'),
(6, 14, 4, 5, 'Pending'),
(7, 16, 7, 5, 'Rejected');

INSERT INTO represents (case_id, lawyer_id, role) VALUES
(1, 13, 'Proposition'),
(1, 14, 'Opposition'),
(2, 14, 'Proposition'),
(2, 15, 'Opposition'),
(3, 15, 'Proposition'),
(3, 16, 'Opposition'),
(4, 16, 'Proposition'),
(4, 17, 'Opposition'),
(5, 17, 'Proposition'),
(5, 13, 'Opposition'),
(6, 13, 'Proposition'),
(6, 15, 'Opposition'),
(7, 14, 'Proposition'),
(7, 16, 'Opposition'),
(8, 15, 'Proposition'),
(8, 17, 'Opposition'),
(9, 16, 'Proposition'),
(9, 13, 'Opposition'),
(10, 17, 'Proposition'),
(10, 14, 'Opposition'),
(11, 13, 'Proposition'),
(11, 15, 'Opposition'),
(12, 14, 'Proposition'),
(12, 16, 'Opposition'),
(13, 15, 'Proposition'),
(13, 17, 'Opposition'),
(14, 16, 'Proposition'),
(14, 13, 'Opposition'),
(15, 17, 'Proposition'),
(15, 14, 'Opposition'),
(16, 13, 'Proposition'),
(16, 15, 'Opposition'),
(17, 14, 'Proposition'),
(17, 16, 'Opposition'),
(18, 15, 'Proposition'),
(18, 17, 'Opposition'),
(19, 16, 'Proposition'),
(19, 13, 'Opposition'),
(20, 17, 'Proposition'),
(20, 14, 'Opposition');


INSERT INTO petitioner (petitioner_id, city, state_, pincode) VALUES 
(14, 'Jaipur', 'Rajasthan', '302001'),
(22, 'Jaipur', 'Rajasthan', '302001');


INSERT INTO lawyer (lawyer_id, specialisation, experience, email, phone_no)
VALUES (1, 'Civil Law', 5, 'user1lawyer@example.com', '9123456789');


INSERT INTO judge (judge_id, email, court_id)
VALUES (2, 'user2judge@example.com', 8); 


INSERT INTO court (court_id, place, court_type)
VALUES (8, 'Jaipur', 'High'); 


INSERT INTO case_ (case_id, case_type, case_status, filing_date, next_hearing_date, court_id, judge_id, petitioner_id) VALUES
(21, 'Civil', 'In Progress', '2025-03-10', '2025-04-20', 4, 18, 14),
(22, 'Criminal', 'In Progress', '2025-03-15', '2025-04-25', 4, 19, 22);


INSERT INTO represents (lawyer_id, case_id, role_) VALUES
(15, 21, 'Proposition'),
(16, 21, 'Opposition'),
(17, 22, 'Proposition'),
(14, 22, 'Opposition');

INSERT INTO document (doc_id, doc_type, file_path, upload_date, case_id) VALUES
(47, 'Petition Copy', '/docs/petition_17.pdf', '2025-03-10', 21),
(42, 'Supporting Document', '/docs/support_17.pdf', '2025-03-12', 21),
(43, 'Affidavit', '/SELECdocs/affidavit_17.pdf', '2025-03-13', 21),
(44, 'FIR Copy', '/docs/fir_18.pdf', '2025-03-15', 22),
(45, 'Charge Sheet', '/docs/charge_18.pdf', '2025-03-16', 22),
(46, 'Witness List', '/docs/witness_18.pdf', '2025-03-18', 22);

INSERT INTO hearing (case_id, hearing_no, hearing_date) VALUES
(21, 1, '2025-04-20'),
(21, 2, '2025-05-10'),
(21, 3, '2025-05-25'),
(22, 1, '2025-04-25'),
(22, 2, '2025-05-15'),
(22, 3, '2025-06-05');

INSERT INTO Verdict (Verdict_id, Verdict_type, Verdict_date, Case_id, Hearing_no, Court_id) VALUES
(1, 'Requested more time', '2024-01-20', 1, 1, 2),
(2, 'Waiting for evidence report', '2024-02-10', 1, 2, 2),
(3, 'Requested more time', '2023-12-10', 2, 1, 3),
(4, 'Not Guilty', '2024-01-10', 2, 2, 3),
(5, 'Hearing adjourned', '2024-02-25', 3, 1, 4),
(6, 'Awaiting witness statement', '2024-03-10', 3, 2, 4),
(7, 'Guilty', '2024-04-05', 3, 3, 4),
(8, 'Court rescheduled', '2024-03-15', 4, 1, 2),
(9, 'Not Guilty', '2024-04-05', 4, 2, 2),
(10, 'Awaiting forensic report', '2024-04-10', 5, 1, 1),
(11, 'Guilty', '2024-04-25', 5, 2, 1),
(12, 'Postponed due to judge absence', '2023-11-20', 6, 1, 5),
(13, 'Requested more time', '2023-12-10', 6, 2, 5),
(14, 'Not Guilty', '2024-01-05', 6, 3, 5),
(15, 'Awaiting documentation', '2024-02-01', 7, 1, 3),
(16, 'Guilty', '2024-02-15', 7, 2, 3),
(17, 'Requested more time', '2024-02-10', 8, 1, 4),
(18, 'Not Guilty', '2024-02-25', 8, 2, 4),
(19, 'Postponed due to strike', '2023-09-25', 9, 1, 1),
(20, 'Awaiting witness statement', '2023-10-10', 9, 2, 1),
(21, 'Guilty', '2023-12-01', 9, 3, 1),
(22, 'Courtroom technical issue', '2024-03-05', 10, 1, 2),
(23, 'Not Guilty', '2024-03-20', 10, 2, 2),
(24, 'Requested more time', '2024-02-05', 11, 1, 5),
(25, 'Awaiting forensic report', '2024-02-25', 11, 2, 5),
(26, 'Guilty', '2024-03-10', 11, 3, 5),
(27, 'Hearing adjourned', '2024-02-15', 12, 1, 1),
(28, 'Awaiting documentation', '2024-03-10', 12, 2, 1),
(29, 'Not Guilty', '2024-06-20', 12, 3, 1),
(30, 'Postponed due to judge absence', '2023-10-10', 13, 1, 4),
(31, 'Awaiting witness statement', '2023-11-15', 13, 2, 4),
(32, 'Guilty', '2024-01-30', 13, 3, 4),
(33, 'Requested more time', '2024-01-30', 14, 1, 3),
(34, 'Not Guilty', '2024-02-15', 14, 2, 3),
(35, 'Awaiting evidence', '2024-03-10', 15, 1, 2),
(36, 'Guilty', '2024-05-05', 15, 2, 2),
(37, 'Court closed due to emergency', '2023-08-25', 16, 1, 1),
(38, 'Awaiting forensic report', '2023-09-15', 16, 2, 1),
(39, 'Not Guilty', '2023-11-10', 16, 3, 1),
(40, 'Requested more time', '2024-01-12', 17, 1, 5),
(41, 'Not Guilty', '2024-01-28', 17, 2, 5),
(42, 'Awaiting documentation', '2024-03-20', 18, 1, 2),
(43, 'Guilty', '2024-04-05', 18, 2, 2),
(44, 'Requested more time', '2024-02-20', 19, 1, 3),
(45, 'Not Guilty', '2024-03-01', 19, 2, 3),
(46, 'Awaiting witness statement', '2023-12-30', 20, 1, 4),
(47, 'Guilty', '2024-01-15', 20, 2, 4),
(48, 'Hearing adjourned', '2025-04-20', 21, 1, 5),
(49, 'Awaiting evidence report', '2025-05-10', 21, 2, 5),
(50, 'Not Guilty', '2025-05-25', 21, 3, 5),
(51, 'Requested more time', '2025-04-25', 22, 1, 2),
(52, 'Awaiting forensic report', '2025-05-15', 22, 2, 2),
(53, 'Guilty', '2025-06-05', 22, 3, 2);


INSERT INTO manages (user_id, admin_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(14, 1),  
(5, 2),
(11, 2),
(12, 2),
(13, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(22, 2),  
(20, 3),
(21, 3),
(23, 3),
(24, 3);


UPDATE appeal SET higher_court = 1 WHERE current_court = 3;
UPDATE appeal SET higher_court = 3 WHERE current_court = 4;
UPDATE appeal SET higher_court = 2 WHERE current_court = 5;
UPDATE appeal SET higher_court = 2 WHERE current_court = 6;
UPDATE appeal SET higher_court = 8 WHERE current_court = 7;