CREATE SCHEMA rpt

CREATE OR ALTER VIEW rpt.dimBrand
WITH SCHEMABINDING
AS 
SELECT BrandID
      ,Brand
  FROM dim.brand;
GO
CREATE UNIQUE CLUSTERED INDEX
idx_dimBrand
ON rpt.dimBrand (BrandID);
GO

CREATE OR ALTER VIEW rpt.dimGPU
WITH SCHEMABINDING
AS 
SELECT GPUID
      ,GPU
  FROM dim.GPU;
GO
CREATE UNIQUE CLUSTERED INDEX
idx_dimGPU
ON rpt.dimGPU (GPUID);
GO

CREATE OR ALTER VIEW rpt.dimProcessor
WITH SCHEMABINDING
AS 
SELECT ProcessorID
      ,Processor
  FROM dim.Processor;
GO
CREATE UNIQUE CLUSTERED INDEX
idx_dimProcessor
ON rpt.dimProcessor (ProcessorID);
GO

CREATE OR ALTER VIEW rpt.dimRAM
WITH SCHEMABINDING
AS 
SELECT RAMID
      ,RAM
  FROM dim.RAM;
GO
CREATE UNIQUE CLUSTERED INDEX
idx_dimRAM
ON rpt.dimRAM (RAMID);
GO

CREATE OR ALTER VIEW rpt.dimStorage
WITH SCHEMABINDING
AS 
SELECT StorageID
      ,Storage
  FROM dim.Storage;
GO
CREATE UNIQUE CLUSTERED INDEX
idx_dimStorage
ON rpt.dimStorage (StorageID);
GO

CREATE OR ALTER VIEW rpt.dimOperating_System
WITH SCHEMABINDING
AS 
SELECT OperatingSystemID
      ,OperatingSystem
  FROM dim.Operating_System;
GO
CREATE UNIQUE CLUSTERED INDEX
idx_dimOperating_System
ON rpt.dimOperating_System (OperatingSystemID);
GO

CREATE OR ALTER VIEW rpt.factLaptop
WITH SCHEMABINDING
AS
SELECT BrandID
      ,OperatingSystemID
      ,GPUID
      ,ProcessorID
      ,RAMID
      ,StorageID
      ,Price
FROM fact.Laptop;



