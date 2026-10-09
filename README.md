# Uber Trip Analytics — End-to-End Data Analytics Project

## Project Overview

This project analyzes Uber trip-level data to understand trip demand,
revenue performance, vehicle utilization, payment behavior, time-based
patterns, and geographic trends.

The project follows an end-to-end data analytics workflow:

Raw Data → SQL Validation → SQL Transformation → Power BI Data Model
→ DAX Measures → Interactive Dashboard → Business Insights

---

## Business Problem

Uber trip data contains detailed information about individual trips,
including timestamps, locations, vehicle types, payment methods,
distance, fare and passenger information.

The objective of this analysis is to identify meaningful patterns in
trip demand, revenue, vehicle performance, payment behavior and
geographic activity that can support operational decision-making.

---

## Project Objectives

- Analyze overall trip demand and revenue
- Identify high-demand days and hours
- Compare vehicle category performance
- Analyze payment method usage
- Identify high-volume pickup and drop-off locations
- Analyze trip distance and duration
- Calculate revenue efficiency using revenue per mile
- Provide actionable operational recommendations

---

## Dataset

The project uses two raw datasets:

### Trip Details

Each row represents one Uber trip.

Key fields include:

- Trip ID
- Pickup Time
- Drop-off Time
- Passenger Count
- Trip Distance
- Pickup Location ID
- Drop-off Location ID
- Fare Amount
- Surge Fee
- Vehicle
- Payment Type

### Location Table

Each row represents one location.

Key fields include:

- Location ID
- Location
- City

### Dataset Size

| Dataset | Records |
|---|---:|
| Trip Details | 103,728 |
| Location Table | 265 |

---

## Technology Stack

- SQL Server
- SQL
- Power Query
- Power BI
- DAX
- Microsoft Excel

---

## Data Pipeline


Raw Excel Files
      ↓
SQL Server
      ↓
Data Quality Validation
      ↓
Standardized SQL Views
      ↓
Enriched Analytical View
      ↓
Power Query
      ↓
Fact & Dimension Model
      ↓
DAX Measures
      ↓
Power BI Dashboard
      ↓
Business Insights