WINDOWNAME:Z�statek Dovolen�:
INPUT:TEXTBOX:USR_KARTA:KARTA U�IVATELE:MUST:Submit/False:TabStop/True:CharacterCasing-Normal:
INPUT:TEXTBOX:USR_TEXT:��slo:Submit/False:TabStop/True:
#INPUT:COMBOBOX:USR_COMBO:Combo:DropDownStyle/2:TabStop/True:SQLITEMS/SELECT name FROM CMP_CATALOG.dbo.test_tbl:
INPUT:DATE:USR_DATE:Datum V�kazu:TabStop/True:CustomFormat/dd.MM.yyyy:
INPUT:BUTTON:USR_SAVEBTN:ULO�IT:Submit/True:
SQL:INSERT INTO [CMP_CATALOG].[dbo].[test_tbl](name,test,datum,insert_date)VALUES(*USR_KARTA*,CONVERT(FLOAT,REPLACE (*USR_TEXT*, ',', '.' )), CONVERT(DATE,*USR_DATE*,105),GETDATE())
AUTOROOT:60

