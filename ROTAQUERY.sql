SELECT 
R.ROTA_KOD,R.ROTA_ADI,
(SELECT SUM(PALET_KG) FROM LOGI_DATA.DBO.EXCEL_IMPORT WHERE SEHIR=R.ROTA_ADI) AS ROT_KG_TOPLAM,
SUM(EI.PALET_KG) AS TOPLAM_KG_ROOT,
floor(SUM(cast(EI.PALET_KG AS numeric(18,4)))/25000) AS TIR_ADET
FROM 
LOGI_DATA.DBO.ROTALAR R
INNER JOIN LOGI_DATA.DBO.EXCEL_IMPORT EI ON EI.ROTA_KOD=R.ROTA_KOD
WHERE
R.ROTA_KOD='RUT1'
--R.ROTA_ADI='�ZM�R'
GROUP BY
R.ROTA_KOD,R.ROTA_ADI

--UPDATE LOGI_DATA.DBO.EXCEL_IMPORT SET ROTA_KOD='RUT2' WHERE SEHIR='ANKARA'

--SELECT * FROM LOGI_DATA.DBO.ROTALAR
--SELECT * FROM LOGI_DATA.DBO.EXCEL_IMPORT WHERE SEHIR='�ZM�R'

