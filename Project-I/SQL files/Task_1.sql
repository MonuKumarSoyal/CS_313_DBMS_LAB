-- creating the tables

-- 1. book table 

create table book
	(book_id		int,
	 title		    varchar(50),
	 category		varchar(30),
     author         varchar(30),
	 primary key (book_id)
	);

-- 2. student table

create table student
	(student_id     int, 
     name           varchar(30),
     dept_name      varchar(30),
     year           int,
     semester       varchar(15),
	 primary key (student_id)
	);

-- 3. issue table 

create table issue
    ( student_id    int,
      book_id       int,
      issue_date    date not null,
      return_date   date not null check (return_date >= issue_date),
      primary key (student_id, book_id, issue_date),
      foreign key (student_id) references student(student_id)
		on delete cascade,
      foreign key (book_id) references book(book_id)
		on delete cascade
    )