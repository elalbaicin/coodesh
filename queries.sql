-- Listar todos Clientes que nao tenham realizado uma compra
SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
);
-- Listar os Produtos que nao tenham sido comprados
SELECT *
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM order_items
);
-- Listar os Produtos sem Estoque
SELECT *
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM stocks
    WHERE quantity = 0
);
-- Agrupar a quantidade de vendas de uma determinada Marca por Loja
WITH prod_brands AS ( -- Relacao marca-produto
    SELECT p.product_id, b.brand_id, b.brand_name
    FROM products AS p
    INNER JOIN brands AS b
    ON p.brand_id = b.brand_id
),
order_brands AS ( -- Relacao marca-pedido
    SELECT DISTINCT pb.brand_name, o.order_id
    FROM order_items AS o
    INNER JOIN prod_brands AS pb
    ON o.product_id = pb.product_id
    GROUP BY pb.brand_name, o.order_id
),
order_store AS ( -- Relacao loja-pedido
    SELECT DISTINCT order_id, store_name
    FROM orders AS e
    INNER JOIN stores AS l
    ON e.store_id = l.store_id
)
SELECT os.store_name, ob.brand_name, COUNT(DISTINCT order_id) AS orders
FROM order_store AS os
INNER JOIN order_brands AS ob
ON os.order_id = ob.order_id
GROUP BY os.store_name, ob.brand_name
-- Listar os Funcionarios que nao estejam relacionados a um Pedido.
SELECT *
FROM staffs
WHERE staff_id NOT IN (
    SELECT staff_id
    FROM orders
)
