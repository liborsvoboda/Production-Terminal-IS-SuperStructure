WINDOWNAME:Br�na-Bez DL.V�era:
INPUT:DATE:USR_DATE_FROM:Datum Pr�jezdu od :Value/Now:CustomFormat/dd.MM.yyyy:
INPUT:DATE:USR_DATE_TO:Datum Pr�jezdu do :Value/Now:CustomFormat/dd.MM.yyyy:
INPUT:CHECKBOX:USR_CHBTVD:Bez vozidel TVD:Checked/True:
INPUT:CHECKBOX:USR_CHBPGI:Bez vozidel PGI:Checked/True:
INPUT:CHECKBOX:USR_CHBCORRECT_REC:Dod v IS KARAT:Checked/false:
INPUT:BUTTON:USR_BUTTON:ODESLAT:Enabled/True:Submit/True:
INPUT:XLS_EXPORT:USR_BTN:Export do XLS:Export/True:
SQL:SELECT dg.name AS Br�na,rgm.document_nr as 'Dodac� List', dc.name AS Dopravce, CASE WHEN dmt.movement_type = 'ingoing' THEN 'P��jezd' ELSE 'Odjezd' END AS [Sm�r J�zdy], rgm.movement_date AS Datum, rgm.movement_time AS �as, rgm.number_plate AS SPZ, rgm.carrier_name AS �idi�, rgm.destination AS [C�l Cesty] FROM [DBNAME].[CMP_PORTER].dbo.record_gateway_movement rgm INNER JOIN [DBNAME].[CMP_PORTER].dbo.dial_gateway dg ON rgm.gateway_id = dg.id INNER JOIN [DBNAME].[CMP_PORTER].dbo.dial_carrier dc ON rgm.carrier_id = dc.id INNER JOIN [DBNAME].[CMP_PORTER].dbo.dial_movement_type dmt ON rgm.movement_type_id = dmt.id WHERE ((ISNULL((*USR_CHBCORRECT_REC*),0) = 1) OR (rgm.document_nr = '' OR (rgm.document_nr <> '' AND ((ISNULL((SELECT TOP 1 1 FROM [DNBAME].dba.pl_zahlavi pl_zah WHERE (CHARINDEX(','+REPLACE(pl_zah.dl,' ','')+',',','+rgm.document_nr+',') <> 0) AND pl_zah.dl <>''), 0) = 0 AND rgm.destination like '%TVD%' ) OR (ISNULL((SELECT TOP 1 1 FROM [KARAT_PGI].dba.pl_zahlavi pl_zah WHERE (CHARINDEX(','+REPLACE(pl_zah.dl,' ','')+',',','+rgm.document_nr+',') <> 0) AND pl_zah.dl <>''), 0) = 0 AND rgm.destination like '%PGI%' ) OR (ISNULL((SELECT TOP 1 1 FROM [KARAT_ROZAM].dba.pl_zahlavi pl_zah WHERE (CHARINDEX(','+REPLACE(pl_zah.dl,' ','')+',',','+rgm.document_nr+',') <> 0) AND pl_zah.dl <>''), 0) = 0 AND rgm.destination like '%ROZAM%' ))))) AND dmt.movement_type ='ingoing' AND (rgm.[status] = 'active') AND (rgm.movement_date >= CONVERT(DATE,*USR_DATE_FROM*,105)) AND (rgm.movement_date <= CONVERT(DATE,*USR_DATE_TO*,105)) AND (CHARINDEX(','+dc.name+',',',TVD,') = 0 OR (ISNULL((*USR_CHBTVD*),0) = 0)) AND (CHARINDEX(','+dc.name+',',',PGI,') = 0 OR (ISNULL((*USR_CHBPGI*),0) = 0)) 
MULTISELECT:True
NOAUTOSUM:True