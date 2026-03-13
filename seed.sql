USE partyprohub;

INSERT INTO categories(name) VALUES
('Balloons'),('Decorations'),('Tableware');

INSERT INTO products(category_id,name,description,price,stock_qty,image)
VALUES
(1,'Red Balloons Pack','Party balloons',20,500,'balloons.jpg'),
(3,'Plastic Cups Pack','Cups for parties',15,300,'cups.jpg'),
(2,'Birthday Banner','Happy birthday banner',200,50,'banner.jpg');

INSERT INTO bulk_discounts(product_id,min_qty,discount_percent)
VALUES
(1,10,5),
(1,50,10),
(2,20,8);
