SELECT R.name as rubriek, 
       S.name as supplier, S.straat, S.huisnr, S.postcode, C.name city,
       PR.name as main
  FROM mhl_suppliers_mhl_rubriek_view AS SR
 INNER JOIN mhl_suppliers  AS S  ON SR.mhl_suppliers_ID=S.ID
 INNER JOIN mhl_rubrieken  AS R  ON SR.mhl_rubriek_view_ID= R.ID  
  LEFT JOIN  mhl_rubrieken AS PR ON R.parent=PR.ID
 INNER JOIN mhl_cities AS C ON S.city_ID=C.ID
 WHERE C.name= "Amsterdam"
   AND (R.name= "drank" OR PR.name = "drank")
 ORDER BY R.name, S.name