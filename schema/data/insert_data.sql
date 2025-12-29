INSERT INTO customers VALUES
(1, 'Alice', 'North', '2023-01-10'),
(2, 'Bob', 'South', '2023-02-15'),
(3, 'Charlie', 'East', '2023-03-05');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 800),
(102, 'Phone', 'Electronics', 500),
(103, 'Headphones', 'Accessories', 100);

INSERT INTO orders VALUES
(1001, 1, '2023-06-01'),
(1002, 1, '2023-06-20'),
(1003, 2, '2023-07-05');

INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1003, 103, 3);
