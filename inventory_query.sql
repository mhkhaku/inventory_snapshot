CREATE TABLE INVENTORY AS
SELECT
ROUND(im.standard_cost_cad,2) 					AS AVERAGE_ITEM_COST_CAD,
ROUND((im.standard_cost_cad * 0.73),2) 			AS AVERAGE_ITEM_COST_USD,
im.country_of_origin 							AS COUNTRY_OF_ORIGIN,
inv.item_id 									AS ITEM_ID,
im.item_name 									AS ITEM_DESCRIPTION,
im.category 									AS ITEM_CATEGORY,
im.brand 										AS ITEM_BRAND,
ROUND(im.msrp_cad,2) 							AS MSRP_CAD,
ROUND((im.msrp_cad * 0.73),2) 					AS MSRP_USD,
inv.on_hand_pcs 								AS QUANTITY_ON_HAND_PCS,
inv.allocated_pcs 								AS QUANTITY_ALLOCATED_PCS,
inv.available_pcs 								AS QUANTITY_AVAILABLE_PCS,
inv.on_order_pcs 								AS QUANTITY_ORDERED_PCS,
inv.snapshot_date 								AS REPORT_DATE,
im.units_per_carton 							AS UNITS_PER_CARTON,
im.unit_weight_kg 								AS UNIT_NET_WEIGHT,
im.unit_volume_cbm 								AS UNIT_CBM,
inv.warehouse 									AS WAREHOUSE_CODE
FROM inventory_snapshot inv
	LEFT JOIN item_master im
		ON inv.item_id = im.item_id