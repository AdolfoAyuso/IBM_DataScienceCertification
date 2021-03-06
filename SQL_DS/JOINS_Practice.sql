SELECT CC.CASE_NUMBER, CC.PRIMARY_TYPE, CD.COMMUNITY_AREA_NAME 
FROM CHICAGO_CRIME_DATA AS CC
INNER JOIN CENSUS_DATA AS CD
ON CD.COMMUNITY_AREA_NUMBER=CC.COMMUNITY_AREA_NUMBER
WHERE CC.COMMUNITY_AREA_NUMBER=18;

SELECT CC.CASE_NUMBER, CC.PRIMARY_TYPE, CD.COMMUNITY_AREA_NAME 
FROM CHICAGO_CRIME_DATA AS CC
LEFT JOIN CENSUS_DATA AS CD
ON CD.COMMUNITY_AREA_NUMBER=CC.COMMUNITY_AREA_NUMBER
WHERE UPPER(CC.LOCATION_DESCRIPTION) LIKE '%SCHOOL%';	

SELECT CD.COMMUNITY_AREA_NUMBER, CC.CASE_NUMBER 
FROM CENSUS_DATA CD
FULL JOIN CHICAGO_CRIME_DATA CC
ON CC.COMMUNITY_AREA_NUMBER=CD.COMMUNITY_AREA_NUMBER
WHERE CD.COMMUNITY_AREA_NAME IN ('Oakland', 'Armour Square', 'Edgewater ', 'CHICAGO'); 