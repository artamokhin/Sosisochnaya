CREATE INDEX idx_order_product ON order_product(product_id, order_id);
CREATE INDEX idx_order_id ON orders (id);
CREATE INDEX idx_id ON product(id);