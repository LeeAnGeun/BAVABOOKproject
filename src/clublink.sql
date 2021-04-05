DROP TABLE CLUBLINK
CASCADE CONSTRAINTS;

CREATE TABLE CLUBLINK (
    CLUBSEQ NUMBER,
    CONSTRAINT FK_CLUBLINK_01 FOREIGN KEY(CLUBSEQ) 
    REFERENCES CLUB(CLUBSEQ),
    MEMBERNUM NUMBER,
    CONSTRAINT FK_CLUBLINK_02 FOREIGN KEY(MEMBERNUM) 
    REFERENCES MEMBERS(MEMBERNUM)
);

INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1000, 103);
 
  INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1000, 104);
 
  INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1001, 105);
 
  INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1001, 103);
 
  INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1001, 104);
 
  INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1002, 101);
 
 INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1002, 103);
 
  INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1002, 100);
 
  INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1003, 100);
 
 INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1003, 101);
 
  INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1003, 102);
 
 INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1003, 103);
  INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1003, 104);
 
 INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1004, 102);
 
  INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1004, 103);
 
  INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1004, 101);
 
 
 
 
 
  INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1012, 100);
   INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1013, 100);
   INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1014, 100);
   INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1015, 100);
   INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM)
 VALUES (1016, 127);
 
 
 
 SELECT COUNT(*) 
 FROM CLUBLINK 
 WHERE MEMBERNUM = 100
 
 SELECT COUNT(*)
 FROM CLUBLINK
 WHERE CLUBSEQ=1000 AND MEMBERNUM=105
 
 

SELECT * FROM CLUBLINK;