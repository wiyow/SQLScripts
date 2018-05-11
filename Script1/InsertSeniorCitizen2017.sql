--- 2018
--- 2019
--- 2020

INSERT INTO [HISReport].[dbo].[rpt_scd_chargesDUMP]
			   ([item_desc]
			   ,[charge_date]
			   ,[PriceVATEx]
			   ,[quantity]
			   ,[charge_amount]
			   ,[osca_id]
			   ,[hospital_nr]
			   ,[patient_name]
			   ,[vendor]
			   ,[month_rcd]
			   ,[year_rcd]
			   ,[principal]
			   ,[source]
			   ,[item_type_rcd]
			   ,[vendor_code]
			   ,[main_item_group_code])

/*
select item_code,
	   item_desc,
	   charge_date,
	   transaction_no,
	   '' as PriceVATIn,
	   unit_cost as PriceVATEx,
	   quantity,
	   charge_amount,
	   discount_amount,
	   CASE WHEN senior_id IS NULL THEN '' ELSE senior_id END AS osca_id,
	   hospital_nr, 
	   patient_name, 
	   vendor, 
	   month_rcd,
	   year_rcd,
	   principal,
	   'Lab' as source,
	   item_type_rcd,
	   vendor_code,
	   main_item_group_code
FROM dbo.rpt_vw_scd_charges2 as scd_charges2
where     month_rcd = 10
	  and year_rcd = 2017
	  
	  and patient_name like '%Bautista Jr., Eleuterio Magnabijon%'
      and item_desc = 'Acetylcysteine (FLUIMUCIL) 600mg tab*'
      and charge_date = '2017-01-15 11:55:59.610'
      --and transaction_no = 'PINV-2017-015685'
      
      
      and (select count(patient_name)
		   from rpt_scd_chargesDUMP
		   where     charge_date = scd_charges2.charge_date
				 and patient_name = rtrim(scd_charges2.patient_name)
				 and item_desc = rtrim(scd_charges2.item_desc)) = 0
				 
     
select count(patient_name)
from rpt_scd_chargesDUMP
where     charge_date = '2017-01-15 11:55:59.610'
	 and patient_name = 'Bautista Jr., Eleuterio Magnabijon'
	 and item_desc = 'Acetylcysteine (FLUIMUCIL) 600mg tab*'



*/


select distinct(item_desc),
	   charge_date,
	   unit_cost as PriceVATEx,
	   quantity,
	   charge_amount,
	   CASE WHEN senior_id IS NULL THEN '' ELSE senior_id END AS osca_id,
	   hospital_nr, 
	   patient_name, 
	   vendor, 
	   month_rcd,
	   year_rcd,
	   principal,
	   'Lab',
	   item_type_rcd,
	   vendor_code,
	   main_item_group_code	   	  	   
FROM dbo.rpt_vw_scd_charges2 as scd_charges2
where     month_rcd = 1
	  and year_rcd = 2018
	  
	  
/*

UPDATE rpt_scd_chargesDUMP 
SET rpt_scd_chargesDUMP.item_code = rpt_vw_scd_charges2.item_code,
    rpt_scd_chargesDUMP.transaction_no = rpt_vw_scd_charges2.transaction_no,
    rpt_scd_chargesDUMP.discount_amount = rpt_vw_scd_charges2.discount_amount 
FROM rpt_scd_chargesDUMP  INNER JOIN rpt_vw_scd_charges2  ON rpt_scd_chargesDUMP.patient_name = rpt_vw_scd_charges2.patient_name
WHERE     rpt_scd_chargesDUMP.item_desc = rpt_vw_scd_charges2.item_desc
      and rpt_scd_chargesDUMP.charge_date = rpt_vw_scd_charges2.charge_date     
      and rpt_scd_chargesDUMP.month_rcd = 11
      and rpt_scd_chargesDUMP.year_rcd = 2017
      
*/      	  