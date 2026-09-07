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
12. **Trigger & Monitor** – Schedule the pipeline and monitor pipeline/activity runs.
