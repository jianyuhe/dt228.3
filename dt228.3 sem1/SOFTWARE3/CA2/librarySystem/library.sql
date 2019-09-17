CREATE TABLE `Student` (
  `studentId` varchar(11) NOT NULL unique,
  `studentName` varchar(50) NOT NULL,
  `borrow` char(1),
  `returned` char(1),
 PRIMARY KEY  (`studentId`)
  );
 
  CREATE TABLE `Librarian` (
  `librarianId` varchar(11) NOT NULL unique,
  `librarianName` varchar(50) NOT NULL,
  `isStudent` char(1),
PRIMARY KEY  (`librarianId`)
  );

  CREATE TABLE `Library` (
  `bookId` varchar(11) NOT NULL unique,
  `bookTitle` varchar(50) NOT NULL,
  `bookStock` int(50) NOT NULL,
  `borrower` varchar(50),
  PRIMARY KEY  (`bookId`)
  );
  
  ALTER TABLE Student
ADD CONSTRAINT check_b
  CHECK (borrow IN ('F', 'T'));
  
  ALTER TABLE Student
ADD CONSTRAINT check_r
  CHECK (returned IN ('F', 'T'));
  
  ALTER TABLE Librarian
ADD CONSTRAINT check_is
  CHECK (isStudent IN ('F', 'T'));
  

  insert into Student value("d343", "fruent", "F", "F" ),("d455", "fgg","F", "F" );
  insert into Student value("d333", "leona", "F", "F"  ),("d555", "lux","F", "F" );
update Student set borrow = 'F', returned = 'F';
  insert into Librarian value ("L34", "draven", null), ("L22", "thresh", null);
   insert into Librarian value ("L44", "d", null), ("L32", "thresh", null);
  insert into Library value("b544", "world", 20, null), ("b765", "animal", 15, null);
    insert into Library value("b554", "dest", 20, null), ("b535", "dog", 15, null);
      insert into Library value("b344", "bird", 20, null), ("b565", "cat", 15, null);