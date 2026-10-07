CREATE TABLE classroom
	(building		VARCHAR(15),
	 room_number		VARCHAR(7),
	 capacity		NUMERIC(4,0),
	CONSTRAINT classroom_pk PRIMARY KEY (building, room_number)
	);

CREATE TABLE department
	(dept_name		VARCHAR(20), 
	 building		VARCHAR(15), 
	 budget		        NUMERIC(12,2) CHECK (budget > 0),
	 CONSTRAINT department_pk PRIMARY KEY (dept_name)
	);

CREATE TABLE course
	(course_id		VARCHAR(8), 
	 title			VARCHAR(50), 
	 dept_name		VARCHAR(20),
	 credits		NUMERIC(2,0) CHECK (credits > 0),
	 CONSTRAINT course_pk PRIMARY KEY (course_id),
	 CONSTRAINT course_dept_fk FOREIGN KEY  (dept_name) REFERENCES department
		on delete set null
	);

CREATE TABLE instructor
	(ID			VARCHAR(5), 
	 name			VARCHAR(20) not null, 
	 dept_name		VARCHAR(20), 
	 salary			NUMERIC(8,2) CHECK (salary > 29000),
	 CONSTRAINT instructor_pk PRIMARY KEY (ID),
	 CONSTRAINT instr_dept_pk FOREIGN KEY  (dept_name) REFERENCES department
		on delete set null
	);

CREATE TABLE section
	(course_id		VARCHAR(8), 
         sec_id			VARCHAR(8),
	 semester		VARCHAR(6)
		CHECK (semester in ('Fall', 'Winter', 'Spring', 'Summer')), 
	 year			NUMERIC(4,0) CHECK (year > 1701 and year < 2100), 
	 building		VARCHAR(15),
	 room_number		VARCHAR(7),
	 time_slot_id		VARCHAR(4),
	 CONSTRAINT section_pk PRIMARY KEY (course_id, sec_id, semester, year),
	 CONSTRAINT section_course_fk foreign key (course_id) REFERENCES course
		on delete cascade,
	 CONSTRAINT section_classroom_fk foreign key (building, room_number) REFERENCES classroom
		on delete set null
	);

CREATE TABLE teaches
	(ID			VARCHAR(5), 
	 course_id		VARCHAR(8),
	 sec_id			VARCHAR(8), 
	 semester		VARCHAR(6),
	 year			NUMERIC(4,0),
	 CONSTRAINT teaches_pk PRIMARY KEY (ID, course_id, sec_id, semester, year),
	 CONSTRAINT teach_section_fk foreign key (course_id,sec_id, semester, year) REFERENCES section
		on delete cascade,
	 CONSTRAINT teaches_section_fk foreign key (ID) REFERENCES instructor
		on delete cascade
	);

CREATE TABLE student
	(ID			VARCHAR(5), 
	 name			VARCHAR(20) not null, 
	 dept_name		VARCHAR(20), 
	 tot_cred		NUMERIC(3,0) CHECK (tot_cred >= 0),
	 CONSTRAINT student_pk  PRIMARY KEY (ID),
	 CONSTRAINT student_dept_fk foreign key (dept_name) REFERENCES department
		on delete set null
	);

CREATE TABLE takes
	(ID			VARCHAR(5), 
	 course_id		VARCHAR(8),
	 sec_id			VARCHAR(8), 
	 semester		VARCHAR(6),
	 year			NUMERIC(4,0),
	 grade		        VARCHAR(2),
	CONSTRAINT takes_pk PRIMARY KEY (ID, course_id, sec_id, semester, year),
	CONSTRAINT takes_section_fk foreign key (course_id,sec_id, semester, year) REFERENCES section
		on delete cascade,
	CONSTRAINT takes_student_fk foreign key (ID) REFERENCES student
		on delete cascade
	);

CREATE TABLE advisor
	(s_ID			VARCHAR(5),
	 i_ID			VARCHAR(5),
	CONSTRAINT advisor_pk PRIMARY KEY (s_ID),
	 CONSTRAINT advisor_instr_fk foreign key (i_ID) REFERENCES instructor (ID)
		on delete set null,
	CONSTRAINT advisor_student_fk  foreign key (s_ID) REFERENCES student (ID)
		on delete cascade
	);

CREATE TABLE time_slot
	(time_slot_id		VARCHAR(4),
	 day			VARCHAR(1),
	 start_hr		NUMERIC(2) CHECK (start_hr >= 0 and start_hr < 24),
	 start_min		NUMERIC(2) CHECK (start_min >= 0 and start_min < 60),
	 end_hr			NUMERIC(2) CHECK (end_hr >= 0 and end_hr < 24),
	 end_min		NUMERIC(2) CHECK (end_min >= 0 and end_min < 60),
	CONSTRAINT time_slot_pk PRIMARY KEY (time_slot_id, day, start_hr, start_min)
	);

CREATE TABLE prereq
	(course_id		VARCHAR(8), 
	 prereq_id		VARCHAR(8),
	 CONSTRAINT prereq_pk PRIMARY KEY (course_id, prereq_id),
	CONSTRAINT prereq_course_fk  foreign key (course_id) REFERENCES course
		on delete cascade,
	 CONSTRAINT prereq_self_fk foreign key (prereq_id) REFERENCES course
	);

