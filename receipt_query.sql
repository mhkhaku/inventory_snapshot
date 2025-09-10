CREATE TABLE RECEIPT AS
SELECT 
ishp.atd 										AS ATD,
ishp.ata 										AS ATA,
ROUND(im.standard_cost_cad,2) 					AS AVERAGE_ITEM_COST_CAD,
ROUND((im.standard_cost_cad * 0.73),2) 			AS AVERAGE_ITEM_COST_USD,
ROUND(ip.unit_cost_CAD,2) 						AS COST_PRICE_CAD,
ROUND((ip.unit_cost_CAD * 0.73),2) 				AS COST_PRICE_USD,
im.country_of_origin 							AS COUNTRY_OF_ORIGIN,
ishp.etd 										AS ETD,
ishp.eta 										AS ETA,
ip.planned_ship_date 							AS EXPECTED_SHIP_DATE,
ip.ordered_qty_cartons 							AS EXPECTED_QUANTITY_CARTONS,
ip.ordered_qty_pcs 								AS EXPECTED_QUANTITY_UNITS,
ishp.carrier 									AS INBOUND_CARRIER,
ishp.incoterms 									AS INCOTERMS,
ishp.container_type 							AS INBOUND_CONTAINER_TYPE,
ishp.container_number 							AS INBOUND_CONTAINER_NUMBER,
ishp.bill_of_lading 							AS INBOUND_BILL_OF_LADING,
ip.item_id 										AS ITEM_ID,
im.item_name 									AS ITEM_DESCRIPTION,
im.category 									AS ITEM_CATEGORY,
im.brand 										AS ITEM_BRAND,
ROUND(im.msrp_cad,2) 							AS MSRP_CAD,
ROUND((im.msrp_cad * 0.73),2) 					AS MSRP_USD,
ip.po_id 										AS PURCHASE_ORDER,
ip.po_date 										AS PURCHASE_ORDER_DATE,
ishp.port_of_loading 							AS PORT_OF_LOADING,
ishp.port_of_discharge 							AS PORT_OF_DISCHARGE,
ishp.inbound_shipment_id 						AS RECEIPT_ID,
ishp.received_qty_pcs 							AS RECEIVED_QTY_UNITS,
ip.supplier_name 								AS SUPPLIER_NAME,
ishp.transit_days_expected 						AS TRANSIT_DAYS_EXPECTED,
ishp.delay_days 								AS TRANSIT_DAYS_DELAYED,
im.units_per_carton 							AS UNITS_PER_CARTON,
im.unit_weight_kg 								AS UNIT_NET_WEIGHT,
im.unit_volume_cbm 								AS UNIT_CBM,
ip.warehouse_destination 						AS WAREHOUSE_CODE
FROM inbound_purchase_data ip
	LEFT JOIN inbound_shipping_data ishp
		ON ip.po_id = ishp.po_id
			AND ip.item_id = ishp.item_id
	LEFT JOIN item_master im
		ON ip.item_id = im.item_id
