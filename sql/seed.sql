INSERT INTO
    CUSTOMERS (NAME, RUT, EMAIL, CELLPHONE, PASS_HASH)
VALUES
    (
        'Juan',
        '12345678-9',
        'correo1@seed.cl',
        '+56911111111',
        '3$2#alskd2#G'
    ),
    (
        'Angela',
        '22345678-9',
        'correo2@seed.cl',
        '+56900002222',
        '3$2#alskd2#G'
    ),
    (
        'Catalina',
        '32345678-9',
        'correo3@seed.cl',
        '+56900003333',
        '3$2#alskd2#G'
    ),
    (
        'Esteban',
        '42345678-9',
        'correo4@seed.cl',
        '+56900004444',
        '3$2#alskd2#G'
    );

INSERT INTO
    CATEGORIES (NAME)
VALUES
    ('Ropa'),
    ('Expedición'),
    ('Accesorios'),
    ('Recipientes');

INSERT INTO
    PRODUCTS (NAME, PRICE, CATEGORY_ID)
VALUES
    ('Parka invierno', 50000, 1),
    ('Carpa para 4 personas', 100000, 2),
    ('Lentes con filtro UV', 20000, 3),
    ('Cantimplora 1L', 30000, 4),
    ('Gorro de lana XL', 5000, 1);


INSERT INTO
    INVENTORY (PRODUCT_ID, QUANTITY)
VALUES
    (1, 75),
    (2, 5),
    (3, 50),
    (4, 13),
    (5, 25);

INSERT INTO
    PAYMENTS (METHOD, PAYDAY, PAID)
VALUES
    ('CARD', '2023-10-01', TRUE),
    ('CASH', '2023-10-02', TRUE),
    ('CARD', '2023-10-03', FALSE),
    ('CASH', '2023-12-07', TRUE),
    ('CARD', '2023-12-08', TRUE);

INSERT INTO
    ORDERS (CUSTOMER_ID, PAYMENT_ID, CREATION_DATE, TOTAL)
VALUES
    (1, 1, '2023-10-01', 50000),
    (2, 2, '2023-10-02', 50000),
    (1, 3, '2023-10-03', 105000),
    (1, 4, '2023-12-07', 100000),
    (2, 5, '2023-12-08', 300000);
    

INSERT INTO
    ORDERS_ITEM (ORDER_ID, PRODUCT_ID, PRICE, QUANTITY)
VALUES
    (1, 3, 20000, 1),
    (1, 4, 30000, 1),
    (2, 1, 50000, 1),
    (3, 2, 100000, 1),
    (3, 5, 5000, 1),
    (4, 2, 100000, 1),
    (5, 2, 100000, 3);
    