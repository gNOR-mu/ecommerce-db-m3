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
    ('Parka invierno', 74990, 1),
    ('Carpa para 4 personas', 90000, 2),
    ('Lentes con filtro UV', 15990, 3),
    ('Cantimplora 1L', 24990, 4),
    ('Gorro de lana XL', 24990, 1);


INSERT INTO
    INVENTORY (PRODUCT_ID, QUANTITY)
VALUES
    (1, 75),
    (2, 8),
    (3, 50),
    (4, 13);

INSERT INTO
    PAYMENTS (METHOD, PAYDAY, PAID)
VALUES
    ('CARD', '2023-10-01', TRUE),
    ('CASH', '2023-10-02', TRUE),
    ('CARD', '2023-10-03', FALSE);

INSERT INTO
    ORDERS (CUSTOMER_ID, PAYMENT_ID, CREATION_DATE, TOTAL)
VALUES
    (1, 1, '2023-10-01', 25.50),
    (2, 2, '2023-10-02', 40.00),
    (1, 3, '2023-10-03', 15.75);

INSERT INTO
    ORDERS_ITEM (ORDER_ID, PRODUCT_ID, PRICE, QUANTITY)
VALUES
    (1, 3, 19.99, 1),
    (1, 4, 5.51, 1),
    (2, 1, 599.99, 1),
    (3, 2, 1200.50, 1);