#1. 없어진 기록 찾기

SELECT ANIMAL_OUTS.ANIMAL_ID AS ANIMAL_ID
        , ANIMAL_OUTS.NAME AS NAME
FROM ANIMAL_INS
    RIGHT JOIN ANIMAL_OUTS ON ANIMAL_OUTS.ANIMAL_ID = ANIMAL_INS.ANIMAL_ID
WHERE ANIMAL_INS.NAME IS NULL AND ANIMAL_OUTS.NAME IS NOT NULL
ORDER BY ANIMAL_ID, NAME


#2. 있었는데요 없었습니다

SELECT ANIMAL_INS.ANIMAL_ID AS ANIMAL_ID
        , ANIMAL_INS.NAME AS NAME
FROM ANIMAL_INS
    INNER JOIN ANIMAL_OUTS ON ANIMAL_INS.ANIMAL_ID = ANIMAL_OUTS.ANIMAL_ID
WHERE ANIMAL_INS.DATETIME > ANIMAL_OUTS.DATETIME
ORDER BY ANIMAL_INS.DATETIME


#3. 오랜 기간 보호한 동물(1)

SELECT ANIMAL_INS.NAME AS NAME
        , ANIMAL_INS.DATETIME AS DATETIME
FROM ANIMAL_INS 
    LEFT JOIN ANIMAL_OUTS ON ANIMAL_INS.ANIMAL_ID = ANIMAL_OUTS.ANIMAL_ID
WHERE ANIMAL_OUTS.DATETIME IS NULL
ORDER BY DATETIME
LIMIT 3


#4. 보호소에서 중성화한 동물

SELECT ANIMAL_INS.ANIMAL_ID AS ANIMAL_ID
        , ANIMAL_INS.ANIMAL_TYPE AS ANIMAL_TYPE
        , ANIMAL_INS.NAME AS NAME
FROM ANIMAL_INS
    LEFT JOIN ANIMAL_OUTS ON ANIMAL_INS.ANIMAL_ID = ANIMAL_OUTS.ANIMAL_ID
WHERE ANIMAL_INS.SEX_UPON_INTAKE != ANIMAL_OUTS.SEX_UPON_OUTCOME
ORDER BY ANIMAL_ID
