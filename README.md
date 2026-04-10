# Bright-TV-
This repository contains a comprehensive SQL-based analysis of the Bright TV dataset, focusing on transforming raw user data into meaningful insights. The project explores customer demographics such as age, gender, province, and digital presence to uncover patterns that can support data-driven decision-making.

# 📺 Bright TV Data Analysis

## 📌 What it is about 
This project focuses on analyzing the Bright TV dataset using SQL to transform raw data into meaningful insights. The dataset contains user demographic information such as name, age, gender, province, email, and social media handle.

The goal of this project is to demonstrate data cleaning, transformation, and exploratory data analysis (EDA) skills while generating insights that support data-driven decision-making.

---

## 🎯 Goals
- Clean and prepare raw data for analysis  
- Create meaningful features (e.g., age groups, email domains)  
- Analyze user demographics and distribution  
- Segment users for targeted insights  
- Prepare data for dashboards and reporting  

---

## 🗂️ Dataset Column Descriptions

| Column Name            | Description                          |
|-----------------------|--------------------------------------|
| UserID                | Unique identifier for each user      |
| Name                  | User's first name                    |
| Surname               | User's last name                     |
| Email                 | User's email address                 |
| Gender                | Gender of the user                   |
| Race                  | Race classification                  |
| Age                   | Age of the user                      |
| Province              | User’s location                      |
| Social Media Handle   | User’s social media username         |

---

## 🧹 Data Cleaning
Key cleaning steps performed:
- Handling missing/null values using COALESCE  
- Standardizing text (e.g., lowercase/uppercase formatting)  
- Removing special characters (e.g., “@” from handles)  
- Ensuring consistent data types  

---

## 🔧 Transformations & Feature Engineering

### ✅ Age Group Classification
- Young (0–18)  
- Young Adult (19–30)  
- Adult (31–50)  
- Senior (50+)  

### 📧 Email Domain Extraction
Extracted domains (e.g., gmail.com, yahoo.com) to analyze user preferences.

### 🧍 Full Name Creation
Combined Name and Surname into a single column for readability.

### 📱 Username Extraction
Removed “@” from social media handles to standardize usernames.

---

## 📊 Key Analysis Performed

### 👥 User Distribution
- Total users by province  
- Most populated regions  

### 👨‍👩‍👧 Demographics
- Gender distribution  
- Age group breakdown  

### 📧 Digital Trends
- Most common email providers  
- Users with social media presence  

---

## 💡 Insights
- Certain provinces have higher user concentrations, indicating potential target markets  
- Majority of users fall within specific age groups, useful for marketing strategies  
- Popular email domains suggest preferred communication channels  
- Social media data can support digital engagement strategies  

---

## 🛠️ Tools & Technologies
- SQL  
- Excel / CSV  
  
