# Multi-Source-Data-Integration-on-Azure
This is an end-to-end ADF pipeline that extracts data from different sources by using Azure Data Factory, ADLS Gen2, and Mapping Data Flows.

This project demonstrates a multi-source data integration and cloud migration solution using Azure Data Factory. Data is ingested from multiple sources such as Azure SQL Database, CSV files and GitHub Repositories into Azure Data Lake Storage Gen2. Azure Data Factory pipelines are used for ingestion, transformation, validation, and automated processing. 

### Flow
1. **Source** **Container** – Detect and process new files uploaded to the source.
2. **Delete** – Delete the source file after successful copying to the destination.
3. **GitHub Source** – Extract files from GitHub and load them into ADLS Gen2.
4. **Validation** – Validate whether the required file exists before processing.
5. **Get Metadata** – Retrieve the list of files from the source.
6. **ForEach** – Iterate through the files dynamically.
7. **If Condition** – Check the file name using startsWith().
8. **Copy Activity** – Copy matching files using parameterized datasets.
9. **Destination Container** – Store the copied source data.
10. **Data Flow** – Transform data using Select, Filter, Aggregate, Join, Conditional Split, and Derived Column.
11. **Sink** – Load the transformed data into the Reporting container.
12. **Parent Pipeline & Execute Pipeline** – Created a parent pipeline to orchestrate the end-to-end workflow. The parent pipeline uses Execute Pipeline activities to invoke:
Pipeline 1: Source Container, Delete, and GitHub Source activities.
Pipeline 2: Validation, Get Metadata, ForEach, If Condition, Copy Activity, Destination Container, Data Flow, and Sink.
13. Trigger & Monitor – Configured a trigger on the parent pipeline to schedule the end-to-end execution and monitor pipeline/activity runs.

| Parent Pipeline |
|--------|
| <img width="598" height="229" alt="Image" src="https://github.com/user-attachments/assets/9c1c822b-d5f4-4dfb-8ca4-9b67509240f7" />| 

| Pipeline 1|
|--------|
| <img width="764" height="165" alt="Image" src="https://github.com/user-attachments/assets/63db0e05-04b3-4569-9706-e0df74a54c98" />|

| Pipeline 2|
|--------|
| <img width="964" height="258" alt="Image" src="https://github.com/user-attachments/assets/d63dc88e-5ec7-4320-b214-067558c0af7e" />|  
