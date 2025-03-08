CREATE TABLE rpt.Brand_OS_Price_Range (
    Brand NVARCHAR(50),
    OperatingSystem NVARCHAR(50),
    Average_Price DECIMAL(10, 2),
    Price_Range DECIMAL(10, 2)
);

CREATE TABLE rpt.Brand_Summary (
    Brand NVARCHAR(50),
    Average_Price DECIMAL(10, 2),
    Median_Price DECIMAL(10, 2),
    Min_Price DECIMAL(10, 2),
    Max_Price DECIMAL(10, 2),
    Price_Range DECIMAL(10, 2),
    Price_Standard_Deviation DECIMAL(10, 2),
    Price_Variance DECIMAL(10, 2),
    Coefficient_of_Variation DECIMAL(10, 2)
);

