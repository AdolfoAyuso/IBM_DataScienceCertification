SELECT CS.NAME_OF_SCHOOL, CD.COMMUNITY_AREA_NAME, 
CS.AVERAGE_STUDENT_ATTENDANCE, CS.Average_Teacher_Attendance 
FROM CENSUS_DATA CD
FULL JOIN CHICAGO_PUBLIC_SCHOOLS CS
ON CS.COMMUNITY_AREA_NUMBER=CD.COMMUNITY_AREA_NUMBER
WHERE CD.HARDSHIP_INDEX=98;

SELECT CC.CASE_NUMBER, CC.PRIMARY_TYPE, CD.COMMUNITY_AREA_NAME 
FROM CHICAGO_CRIME_DATA AS CC
LEFT JOIN CENSUS_DATA AS CD
ON CD.COMMUNITY_AREA_NUMBER=CC.COMMUNITY_AREA_NUMBER
WHERE UPPER(CC.LOCATION_DESCRIPTION) LIKE '%SCHOOL%';

SELECT TOP 10 School_Name, Leaders_Rating FROM CPS_VIEW;

CREATE PROCEDURE UPDATE_LEADERS_SCORE 
@in_School_ID INTEGER, @in_Leader_Score INTEGER 
AS
	BEGIN TRAN T1
			UPDATE CHICAGO_PUBLIC_SCHOOLS
			SET Leaders_Score = @in_Leader_Score
			WHERE School_ID = @in_School_ID;

			IF @in_Leader_Score>=0 AND @in_Leader_Score<=19
				UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET Leaders_Icon = 'Very weak'
				WHERE School_ID = @in_School_ID;
			ELSE IF @in_Leader_Score>=20 AND @in_Leader_Score<=39
				UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET Leaders_Icon = 'Weak'
				WHERE School_ID = @in_School_ID;
			ELSE IF @in_Leader_Score>=40 AND @in_Leader_Score<=59
				UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET Leaders_Icon = 'Average'
				WHERE School_ID = @in_School_ID;
			ELSE IF @in_Leader_Score>=60 AND @in_Leader_Score<=79
				UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET Leaders_Icon = 'Strong'
				WHERE School_ID = @in_School_ID;
			ELSE IF @in_Leader_Score>=80 AND @in_Leader_Score<=99
				UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET Leaders_Icon = 'Very strong'
				WHERE School_ID = @in_School_ID;
			ELSE
				ROLLBACK TRAN T1;
	COMMIT TRAN T1;