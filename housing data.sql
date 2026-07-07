-- Populate Property address 
SELECT * 
	FROM housing_data
WHERE property_address IS NULL

SELECT a.parcel_id, a.property_address, b.parcel_id, b.property_address,
	COALESCE(a.property_address, b.property_address)
	FROM housing_data AS a
JOIN housing_data AS b
ON a.parcel_id = b.parcel_id
AND (a.unique_id) != (b.unique_id)
WHERE a.property_address IS NULL

UPDATE housing_data
SET property_address = COALESCE(a.property_address, b.property_address)
	FROM housing_data AS a
JOIN housing_data AS b
ON a.parcel_id = b.parcel_id
AND (a.unique_id) != (b.unique_id)
WHERE a.property_address IS NULL

-- BREAKING OUT THE ADDRESS INTO INDIVIDUAL COLUMNS i.e address, city, state

SELECT SUBSTRING(
    property_address,
    1,
    POSITION(',' IN property_address) - 1
) AS address,
	SUBSTRING(
    property_address,
    POSITION(',' IN property_address) + 1, LENGTH(property_address)
) AS city
FROM housing_data;

ALTER TABLE housing_data
ADD property_split_address TEXT

ALTER TABLE housing_data
ADD property_city TEXT
	
UPDATE housing_data
SET property_split_address = SUBSTRING(
    property_address,
    1,
    POSITION(',' IN property_address) - 1
)

UPDATE housing_data
SET property_city = SUBSTRING(
    property_address,
    POSITION(',' IN property_address) + 1, LENGTH(property_address)
)

	
-- BREAKING OUT THE OWNER ADDRESS INTO INDIVIDUAL COLUMNS 

SELECT 
	SPLIT_PART(owner_address, ',', 1) AS owner_split_address,
	SPLIT_PART(owner_address, ',', 2) AS owner_split_state,
	SPLIT_PART(owner_address, ',', 3) AS owner_split_city
FROM housing_data;

ALTER TABLE housing_data
ADD owner_split_address TEXT

	UPDATE housing_data
	SET owner_split_address = SPLIT_PART(owner_address, ',', 1)

	SELECT * FROM housing_data

ALTER TABLE housing_data
ADD owner_split_state TEXT

	UPDATE housing_data
	SET owner_split_state = SPLIT_PART(owner_address, ',', 3)

ALTER TABLE housing_data
ADD owner_split_city TEXT

	UPDATE housing_data
	SET owner_split_city = SPLIT_PART(owner_address, ',', 2)

-- CHANGE Y AND N TO YES AND NO IN "SOLD_AS_VACANT" FIELD.
	SELECT * 
	FROM housing_data
	
SELECT DISTINCT(sold_as_vacant), COUNT(sold_as_vacant)
FROM housing_data
GROUP BY sold_as_vacant
ORDER BY 2

SELECT sold_as_vacant,
CASE
	WHEN sold_as_vacant = 'Y' THEN 'Yes'
	WHEN sold_as_vacant = 'N' THEN 'No'
		ELSE sold_as_vacant
		END
FROM housing_data

UPDATE housing_data
SET sold_as_vacant =
CASE
	WHEN sold_as_vacant = 'Y' THEN 'Yes'
	WHEN sold_as_vacant = 'N' THEN 'No'
		ELSE sold_as_vacant
		END

-- REMOVE DUPLICATE VALUES
WITH row_num_cte AS
	(
SELECT *,
	ROW_NUMBER () OVER (PARTITION BY 
	parcel_id, 
	property_address, 
	sale_price, 
	sale_date, 
	legal_reference
	ORDER BY unique_id) AS row_num
FROM housing_data
	WHERE row_num > 1
-- ORDER BY parcel_id
	)

-- SELECT * FROM row_num_cte WHERE row_num > 1
	
DELETE 
	FROM housing_data
WHERE unique_id 
	IN (
    SELECT unique_id
    FROM row_num_cte
    WHERE row_num > 1
	):

-- DELETE COLUMNS WE DONT NEED

	SELECT * 
	FROM housing_data
	
ALTER TABLE housing_data
DROP COLUMN owner_address, 
DROP COLUMN tax_district, 
DROP COLUMN property_address 

ALTER TABLE housing_data
DROP COLUMN sale_date