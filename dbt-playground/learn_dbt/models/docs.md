{% docs __overview__ %}

## Project Overview

This project implements a modern data warehouse architecture using dbt to transform the classic DVD rental sample database into analytics-ready datasets. The project follows dimensional modeling best practices with clearly defined staging, intermediate, and mart layers.

## Quick Start

### Getting Started Commands
Try running the following commands to explore the project:
- `dbt run` - Execute all transformations and build the data models
- `dbt test` - Run data quality tests to ensure data integrity
- `dbt docs generate && dbt docs serve` - Generate and serve this documentation

### Data Architecture

**Staging Layer (`staging/`):**
- Raw data cleaning and standardization
- One-to-one mapping with source tables
- Basic data type casting and column renaming

**Intermediate Layer (`intermediate/`):**
- Business logic transformations
- Data enrichment and calculated fields
- Preparation for final dimensional models

**Marts Layer (`marts/`):**
- Final analytics-ready models
- Dimensional models (facts and dimensions)
- Optimized for business intelligence tools

## Business Context

The DVD rental dataset represents a fictional movie rental business with the following key business processes:

- **Customer Management**: Track customer information and rental behavior
- **Inventory Management**: Manage film catalog and store inventory
- **Rental Transactions**: Process rental payments and returns
- **Performance Analytics**: Analyze revenue trends and customer patterns

## Key Models

This project includes several key analytical models:

- `dim_customer`: Customer dimension with enriched customer attributes
- `dim_film`: Film dimension with movie details and categories
- `fct_payments`: Fact table aggregating payment transactions by rental

## Data Quality

All models include comprehensive data quality tests including:
- Not null constraints on primary keys
- Referential integrity checks between facts and dimensions
- Custom business rule validations

---
*This documentation is automatically generated and served through dbt docs.*
{% enddocs %}

{% docs fct_payments_doc %}
**Fact table: Payments by rental (1 row per rental).**

**Grain:** `rental_id`

**Business definition:**
- `amount_paid` is the total payment amount aggregated for the rental.
- Joins to `dim_customer` and `dim_film` provide stable surrogate keys for downstream BI tools.

**Common use cases:**
- Revenue trends by film rating / title
- Customer spend over time
- Store performance
{% enddocs %}
