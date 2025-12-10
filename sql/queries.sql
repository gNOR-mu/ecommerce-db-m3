-- -- Búsqueda de productos por nombre y por categoría.
CREATE OR REPLACE FUNCTION FIND_PRODUCT_BY_NAME_AND_CATEGORY (IN P_NAME VARCHAR(40), IN C_NAME VARCHAR(25)) 
RETURNS SETOF PRODUCTS LANGUAGE PLPGSQL 
AS $$
BEGIN
	RETURN QUERY
	SELECT P.ID, P.CATEGORY_ID,P.NAME, P.PRICE
	FROM PRODUCTS P
	JOIN CATEGORIES C ON P.CATEGORY_ID = C.ID
	WHERE P.NAME = P_NAME
	AND C.NAME = C_NAME;
END;
$$;

SELECT
	*
FROM
	FIND_PRODUCT_BY_NAME_AND_CATEGORY ('Parka invierno', 'Ropa');

-- Top N productos por ventas (cantidad o monto).
-- Ventas por mes y por categoría (sumas y conteos).
-- Ticket promedio en rango de fechas.
-- Stock bajo (umbral configurable)
CREATE OR REPLACE PROCEDURE PRODUCTS_WITH_LOW_STOCK (IN UMBRAL INTEGER) LANGUAGE PLPGSQL AS $$
DECLARE
    LOW_STOCK CURSOR IS 
		SELECT P.NAME, I.QUANTITY
        FROM PRODUCTS P
        JOIN INVENTORY I ON P.ID = I.PRODUCT_ID
        WHERE I.QUANTITY <= UMBRAL;
BEGIN
	FOR LS IN LOW_STOCK LOOP
		RAISE NOTICE 'Stock bajo: Producto: %, cantidad: %',LS.NAME,LS.QUANTITY;
	END LOOP;
END;
$$;

CALL PRODUCTS_WITH_LOW_STOCK (20);
-- Productos sin ventas.
SELECT
	P.ID,
	P.CATEGORY_ID,
	P.NAME,
	P.PRICE
FROM
	PRODUCTS P
	LEFT JOIN (
		-- excluir productos con ventas
		SELECT DISTINCT
			OI.PRODUCT_ID
		FROM
			ORDERS_ITEM OI
			JOIN ORDERS O ON OI.ORDER_ID = O.ID
			JOIN PAYMENTS PAY ON O.PAYMENT_ID = PAY.ID
		WHERE
			PAY.PAID = TRUE
	) AS V ON P.ID = V.PRODUCT_ID
WHERE
	V.PRODUCT_ID IS NULL;
    
-- Clientes frecuentes (≥ X órdenes).
-- Cualquier consulta que estime relevante para su proyecto.
