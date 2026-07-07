# Nashville Housing Data Cleaning Using PostgreSQL

## Project Overview

This project focuses on cleaning and transforming a Nashville housing dataset using **PostgreSQL** to produce a high-quality, analysis-ready dataset. Real-world datasets often contain missing values, duplicate records, inconsistent formatting, and redundant information that can negatively impact reporting and analysis. The objective of this project was to address these data quality issues through SQL-based data cleaning techniques.

The project demonstrates how PostgreSQL can be used to efficiently clean, standardize, and restructure raw housing data while preserving data integrity. By applying a series of transformation steps, the dataset was optimized for accurate reporting, visualization, and future analytical tasks.

---

## Project Objectives

* Improve overall data quality by cleaning inconsistent and incomplete records.
* Populate missing property address values using related records.
* Standardize text fields for consistency across the dataset.
* Separate combined address fields into individual components.
* Detect and remove duplicate records.
* Eliminate redundant columns to create a streamlined dataset.
* Prepare the data for business intelligence, reporting, and further analysis.

---

## Dataset

The dataset contains housing transaction records with information such as:

* Parcel ID
* Property Address
* Owner Address
* Sale Date
* Sale Price
* Legal Reference
* Sold As Vacant
* Tax District
* Property Attributes

---

## Data Cleaning Tasks Performed

The following data preparation steps were completed:

### Handling Missing Values

* Filled missing **Property Address** values by matching records with identical **Parcel IDs** using self-joins and `COALESCE()`.

### Data Standardization

* Standardized categorical values by converting:

  * `Y` → `Yes`
  * `N` → `No`
* Improved consistency for easier reporting and filtering.

### String Manipulation

* Split the **Property Address** into separate columns:

  * Street Address
  * City
* Split the **Owner Address** into:

  * Street Address
  * City
  * State

### Duplicate Removal

* Identified duplicate records using:

  * Common Table Expressions (CTEs)
  * `ROW_NUMBER()` Window Function
* Removed duplicate rows while preserving unique housing records.

### Schema Optimization

* Removed unnecessary and redundant columns after transformation.
* Improved table readability and reduced storage redundancy.

---

## SQL Concepts Demonstrated

This project showcases a broad range of SQL skills, including:

* Data Cleaning
* Data Transformation
* Self Joins
* `COALESCE()`
* `CASE` Statements
* String Functions
* `SPLIT_PART()`
* Common Table Expressions (CTEs)
* Window Functions (`ROW_NUMBER()`)
* Duplicate Detection
* Conditional Logic
* `ALTER TABLE`
* `UPDATE`
* `DELETE`
* Column Management
* Table Optimization

---

## Business Value

This project demonstrates how effective data cleaning improves the reliability and usability of data for downstream analytics. The cleaned dataset can be used for:

* Housing market analysis
* Property price reporting
* Geographic trend analysis
* Dashboard development
* Business intelligence reporting
* Predictive analytics and machine learning

---

## Technologies Used

* PostgreSQL
* SQL
* pgAdmin
* Git & GitHub

---

## Skills Demonstrated

* SQL Programming
* Data Cleaning
* Data Transformation
* Data Wrangling
* Data Quality Management
* Window Functions
* String Manipulation
* Database Management
* Analytical Thinking
* Problem Solving
* Data Preparation for Analytics

---

## Conclusion

This project demonstrates practical experience in preparing real-world datasets for analysis using PostgreSQL. By addressing missing values, removing duplicates, standardizing inconsistent data, restructuring columns, and optimizing the database schema, the project showcases essential data cleaning techniques that form the foundation of every successful data analytics workflow. It highlights the importance of high-quality data in generating accurate insights and reflects the SQL skills commonly required in data analyst, business intelligence, and data engineering roles.

