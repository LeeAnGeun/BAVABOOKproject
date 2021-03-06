DROP TABLE SCHEDULE
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_SCHEDULE;

CREATE TABLE SCHEDULE (
    SCHEDULESEQ NUMBER CONSTRAINT PK_SCHEDULE_01 PRIMARY KEY,
    BOOKNUM NUMBER,
    CONSTRAINT FK_SCHEDULE_01 FOREIGN KEY(BOOKNUM) 
    REFERENCES BOOK(BOOKNUM), 
    MEMBERNUM NUMBER,
    CONSTRAINT FK_SCHEDULE_02 FOREIGN KEY(MEMBERNUM) 
    REFERENCES MEMBERS(MEMBERNUM),
    SUBSCRIBE NUMBER,
    SCHSTART VARCHAR2(12),
    SCHEND VARCHAR2(12)
);

CREATE SEQUENCE SEQ_SCHEDULE
START WITH 1
INCREMENT BY 1;

SELECT * FROM SCHEDULE;

SELECT SCHEDULESEQ, SC.BOOKNUM, MEMBERNUM, SUBSCRIBE, SCHSTART, SCHEND, BO.BOOKTITLE, RNUM, STARTDATE, ENDDATE
FROM (SELECT ROW_NUMBER()OVER(PARTITION BY SUBSTR(SCHSTART, 1, 8)ORDER BY SCHSTART ASC) AS RNUM,
			SCHEDULESEQ, BOOKNUM, MEMBERNUM, SUBSCRIBE, SCHSTART, SCHEND,
			ROW_NUMBER()OVER(PARTITION BY SCHSTART ORDER BY SCHSTART ASC) AS STARTDATE,
			ROW_NUMBER()OVER(PARTITION BY SCHEND ORDER BY SCHEND ASC) AS ENDDATE
			
			FROM SCHEDULE
			WHERE MEMBERNUM=104 AND SUBSTR(SCHSTART, 1, 7)='2021/04' OR SUBSTR(SCHEND, 1, 7)='2021/04') SC, BOOK BO
WHERE SC.BOOKNUM = BO.BOOKNUM
	AND STARTDATE <= 1
		AND ENDDATE <= 1;