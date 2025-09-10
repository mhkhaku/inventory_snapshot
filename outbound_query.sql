CREATE TABLES ORDERS AS
SELECT 
ROUND(im.standard_cost_cad,2) 					AS AVERAGE_ITEM_COST_CAD,
ROUND((im.standard_cost_cad * 0.73),2) 			AS AVERAGE_ITEM_COST_USD,
o.customer_name 								AS CUSTOMER_NAME,
o.customer_type 								AS CUSTOMER_TYPE,
im.country_of_origin 							AS COUNTRY_OF_ORIGIN,
ROUND(osh.freight_cost_cad,2) 					AS FREIGHT_COST_CAD,
ROUND((osh.freight_cost_cad * 0.73),2) 			AS FREIGHT_COST_USD,
o.item_id 										AS ITEM_ID,
im.item_name 									AS ITEM_DESCRIPTION,
im.category 									AS ITEM_CATEGORY,
im.brand 										AS ITEM_BRAND, 
o.order_uom 									AS ORDER_QTY_UOM,
o.ordered_qty_pcs 								AS ORDER_QTY_PCS,
o.order_status 									AS ORDER_STATUS,
osh.outbound_shipment_id 						AS ORDER_SHIPMENT_ID,
o.order_id 										AS ORDER_ID,
o.order_date 									AS ORDER_DATE,
o.channel 										AS ORDER_CHANNEL,
osh.carrier 									AS OUTBOUND_CARRIER,
osh.service_level 								AS OUTBOUND_SERVICE_LEVEL,
osh.ship_date 									AS ORDER_SHIP_DATE,
osh.tracking_number 							AS OUTBOUND_TRACKING_NUMBER,
osh.delivery_date 								AS ORDER_DELIVERY_DATE,
osh.shipped_qty_pcs 							AS SHIPPED_QTY_PCS,
o.province 										AS SHIP_TO_PROVINCE,
im.units_per_carton 							AS UNITS_PER_CARTON,
im.unit_weight_kg 								AS UNIT_NET_WEIGHT,
im.unit_volume_cbm 								AS UNIT_CBM,
o.unit_sell_price_cad 							AS UNIT_SELLING_PRICE_CAD,
ROUND((o.unit_sell_price_cad * 0.73),2) 		AS UNIT_SELLING_PRICE_USD,
o.warehouse 									AS WAREHOUSE_CODE
FROM outbound_orders_data o
	LEFT JOIN outbound_shipping_data osh
		ON o.order_id = osh.order_id
			AND o.item_id = osh.item_id
	LEFT JOIN item_master im
		ON o.item_id = im.item_id