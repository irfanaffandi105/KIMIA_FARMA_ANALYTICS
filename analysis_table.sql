
-- Membuat atau menggantikan tabel 'analysis_table' di dataset kimia_farma
CREATE OR REPLACE TABLE `rakamin-kf-analytics-459814.kimia_farma.analysis_table` AS

-- Menggunakan CTE (Common Table Expression) bernama transaksi_dengan_margin
WITH transaksi_dengan_margin AS (
  SELECT 
    -- Informasi transaksi
    t.transaction_id,
    t.date,

    -- Informasi cabang
    c.branch_id,
    c.branch_name,
    c.kota,
    c.provinsi,
    c.rating AS rating_cabang,  -- Rating dari kantor cabang

    -- Informasi pelanggan
    t.customer_name,

    -- Informasi produk
    p.product_id,
    p.product_name,

    -- Harga dan diskon
    t.price AS actual_price,
    t.discount_percentage,

    -- Perhitungan nett_sales: harga setelah diskon
    (t.price - (t.price * t.discount_percentage / 100)) AS nett_sales,

    -- Persentase margin keuntungan berdasarkan harga (semakin mahal, margin makin besar)
    CASE 
        WHEN t.price <= 50000 THEN 0.10
        WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
        WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
        WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
        ELSE 0.30
    END AS persentase_gross_laba,

    -- Rating dari sisi transaksi (bisa beda dari rating cabang)
    t.rating AS rating_transaksi

  -- Gabung data transaksi, cabang, dan produk
  FROM `rakamin-kf-analytics-459814.kimia_farma.kf_final_transaction` t
  JOIN `rakamin-kf-analytics-459814.kimia_farma.kf_kantor_cabang` c 
    ON t.branch_id = c.branch_id
  JOIN `rakamin-kf-analytics-459814.kimia_farma.kf_product` p 
    ON t.product_id = p.product_id
)

-- Output akhir dari query
SELECT *,
       -- Perhitungan nett_profit = nett_sales * persentase margin
       ROUND(nett_sales * persentase_gross_laba, 2) AS nett_profit
FROM transaksi_dengan_margin;
