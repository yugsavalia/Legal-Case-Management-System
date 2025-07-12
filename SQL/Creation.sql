-- LEGAL CASE MANAGEMENT SYSTEM
-- TEAM MEMBERS:
-- FARZAN BHALARA : 202301248
-- MAHEK JIKKAR   : 202301260
-- PRIYANKA GARG  : 202301262
-- YUG SAVALIA    : 202301263

-- 1. Admin Table
CREATE TABLE admin (
    admin_id INT PRIMARY KEY
);

-- 2. User Table
CREATE TABLE user (
    user_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- 3. Manages Table - Relationship between Admin and User
CREATE TABLE manages (
    admin_id INT,
    user_id INT,
    PRIMARY KEY (admin_id, user_id),
    FOREIGN KEY (admin_id) REFERENCES admin(admin_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- 4. Lawyer Table
CREATE TABLE lawyer (
    lawyer_id INT PRIMARY KEY,
    specialisation VARCHAR(50),
    experience INT,
    email VARCHAR(100),
    phone_no VARCHAR(15)
);

-- 5. Judge Table
CREATE TABLE judge (
    judge_id INT PRIMARY KEY,
    court_id INT,
    email VARCHAR(100),
    FOREIGN KEY (court_id) REFERENCES court(court_id)
);

-- 6. Petitioner Table
CREATE TABLE petitioner (
    petitioner_id INT PRIMARY KEY,
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10)
);

-- 7. Petitioner Email Table
CREATE TABLE petitioner_email (
    email_id VARCHAR(50),
    petitioner_id INT,
    PRIMARY KEY (email_id, petitioner_id),
    FOREIGN KEY (petitioner_id) REFERENCES petitioner(petitioner_id)
);

-- 8. Petitioner Phone Table
CREATE TABLE petitioner_phone (
    phone_no VARCHAR(15),
    petitioner_id INT,
    PRIMARY KEY (phone_no, petitioner_id),
    FOREIGN KEY (petitioner_id) REFERENCES petitioner(petitioner_id)
);

-- 9. Court Table
CREATE TABLE court (
    court_id INT PRIMARY KEY,
    location VARCHAR(100),
    court_type VARCHAR(50)
);

-- 10. Case Table
CREATE TABLE case (
    case_id INT PRIMARY KEY,
    case_type VARCHAR(50),
    case_status VARCHAR(30),
    filing_date DATE,
    next_hearing_date DATE,
    petitioner_id INT,
    judge_id INT,
    court_id INT,
    FOREIGN KEY (petitioner_id) REFERENCES petitioner(petitioner_id),
    FOREIGN KEY (judge_id) REFERENCES judge(judge_id),
    FOREIGN KEY (court_id) REFERENCES court(court_id)
);

-- 11. Represents Table - Relationship between Lawyer and Case
CREATE TABLE represents (
    lawyer_id INT,
    case_id INT,
    role VARCHAR(50),
    PRIMARY KEY (lawyer_id, case_id),
    FOREIGN KEY (lawyer_id) REFERENCES lawyer(lawyer_id),
    FOREIGN KEY (case_id) REFERENCES case(case_id)
);

-- 12. Document Table
CREATE TABLE document (
    doc_id INT PRIMARY KEY,
    doc_type VARCHAR(100),
    file_path VARCHAR(255),
    upload_date DATE,
    case_id INT,
    FOREIGN KEY (case_id) REFERENCES case(case_id)
);

-- 13. Hearing Table
CREATE TABLE hearing (
    hearing_no INT PRIMARY KEY,
    hearing_date DATE,
    case_id INT,
    FOREIGN KEY (case_id) REFERENCES case(case_id)
);

-- 14. Verdict Table
CREATE TABLE verdict (
    verdict_id INT PRIMARY KEY,
    verdict_type VARCHAR(50),
    verdict_date DATE,
    case_id INT,
    court_id INT,
    hearing_no INT,
    FOREIGN KEY (court_id) REFERENCES court(court_id),
    FOREIGN KEY (case_id) REFERENCES case(case_id),
    FOREIGN KEY (hearing_no) REFERENCES hearing(hearing_no)
);

-- 15. Appeal Table
CREATE TABLE appeal (
    appeal_id INT PRIMARY KEY,
    current_court INT,
    higher_court INT,
    appeal_status VARCHAR(30),
    case_id INT,
    FOREIGN KEY (current_court) REFERENCES court(court_id),
    FOREIGN KEY (higher_court) REFERENCES court(court_id),
    FOREIGN KEY (case_id) REFERENCES case(case_id)
);
