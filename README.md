<h1>Tabla de contenidos</h1>

- [Tecnologías](#tecnologías)
- [Propósito](#propósito)
- [Pasos](#pasos)
- [Evidencias](#evidencias)

# Tecnologías

PostgreSQL: "PostgreSQL 18.1 on x86_64-windows, compiled by msvc-19.44.35219, 64-bit"
pgAdmin 4: 9.10

# Propósito

Diseñar el modelo de datos del e-commerce mediante un diagrama ER y construir el esquema
relacional (DDL) con sus claves y restricciones. Luego, elaborar consultas SQL que respondan
preguntas típicas del negocio (catálogo, stock, ventas).

# Pasos

Para el desarrollo de la presente actividad se siguieron los siguientes pasos:

1. Modelamiento del diagrama ER.
2. Implementación del esquema de tables (DDL).
3. Redacción de consultas SQL.

# Evidencias

<h2>Ventas por mes y por categoría (sumas y conteos).</h2>

```SQL
SELECT
	TO_CHAR(P.PAYDAY, 'YYYY-MM') AS MONTH,
	C.NAME AS CATEGORY,
	SUM(SUB_TOTAL) AS TOTAL,
	COUNT(OI.QUANTITY) AS ORDERS_ITEM_COUNT
FROM
	ORDERS O
	JOIN PAYMENTS P ON P.ID = O.PAYMENT_ID
	JOIN ORDERS_ITEM OI ON OI.ORDER_ID = O.ID
	JOIN PRODUCTS ON PRODUCTS.ID = OI.PRODUCT_ID
	JOIN CATEGORIES C ON PRODUCTS.CATEGORY_ID = C.ID
WHERE
	P.PAID = TRUE
GROUP BY
	TO_CHAR(P.PAYDAY, 'YYYY-MM'),
	C.NAME;
```

| month   | category    | total  | orders_item_count |
| ------- | ----------- | ------ | ----------------- |
| 2023-10 | Ropa        | 50000  | 1                 |
| 2024-12 | Expedición  | 100000 | 1                 |
| 2023-10 | Recipientes | 30000  | 1                 |
| 2023-12 | Expedición  | 400000 | 2                 |
| 2023-10 | Accesorios  | 20000  | 1                 |


<h2>Stock bajo (umbral configurable)</h2>

Umbral = 19

```SQL
SELECT NAME, QUANTITY FROM PRODUCTS_WITH_LOW_STOCK(19);
```


| name                  | quantity |
| --------------------- | -------- |
| Carpa para 4 personas | 5        |
| Cantimplora 1L        | 13       |


<h2>Productos sin ventas.</h2>
  
```SQL
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
```

| id  | category_id | name             | price |
| --- | ----------- | ---------------- | ----- |
| 5   | 1           | Gorro de lana XL | 5000  |

<h2>Clientes frecuentes (≥ X órdenes).</h2>

Clientes con 2 o más órdenes

```SQL
SELECT ID, NAME, QUANTITY FROM FREQUENT_CUSTOMERS(2);
```

| id  | name   | quantity |
| --- | ------ | -------- |
| 2   | Angela | 3        |
| 1   | Juan   | 3        |

<h2>Top N productos por ventas (cantidad o monto).</h2>
<h4>Por monto vendido:</h4>

```SQL
SELECT NAME, TOTAL FROM BEST_SELLERS(3);
```

| name                  | total  |
| --------------------- | ------ |
| Carpa para 4 personas | 500000 |
| Parka invierno        | 50000  |
| Cantimplora 1L        | 30000  |

<h4>Por cantidad vendida</h3>

```SQL
SELECT NAME, TOTAL FROM BEST_SELLERS_AMOUNT(3);
```
| name                  | total |
| --------------------- | ----- |
| Carpa para 4 personas | 5     |
| Cantimplora 1L        | 1     |
| Lentes con filtro UV  | 1     |