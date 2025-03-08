CREATE SCHEMA stg;
GO


CREATE TABLE stg.import (
    Brand NVARCHAR(50),
    Processor NVARCHAR(50),
    RAM_GB BIGINT,
    Storage NVARCHAR(50),
    GPU NVARCHAR(100),
    Screen_Size FLOAT,
    Resolution NVARCHAR(20),
    Battery_Life FLOAT,
    Weight_KG FLOAT,
    Operating_System NVARCHAR(50),
    Price FLOAT
);

CREATE SCHEMA fact;
GO
CREATE TABLE fact.Laptop (
  BrandID INT,                
  OperatingSystemID INT,               
  GPUID INT,
  ProcessorID INT,
  RAMID INT,
  StorageID INT,
  Price FLOAT
);
-- Create foreign key for BrandID referencing dim.Brand
ALTER TABLE fact.Laptop
ADD CONSTRAINT fk_brand
FOREIGN KEY (BrandID)
REFERENCES dim.Brand (BrandID);

-- Create foreign key for OperatingSystemID referencing dim.Island
ALTER TABLE fact.Laptop
ADD CONSTRAINT fk_operatingsystem
FOREIGN KEY (OperatingSystemID)
REFERENCES dim.Operating_System (OperatingSystemID);

-- Create foreign key for GPUID referencing the appropriate GPU dimension table
ALTER TABLE fact.Laptop
ADD CONSTRAINT fk_gpu
FOREIGN KEY (GPUID)
REFERENCES dim.GPU (GPUID);

-- Create foreign key for ProcessorID referencing the appropriate Processor dimension table
ALTER TABLE fact.Laptop
ADD CONSTRAINT fk_processor
FOREIGN KEY (ProcessorID)
REFERENCES dim.Processor (ProcessorID);


-- ALTER TABLE fact.Laptop
 DROP CONSTRAINT fk_processor;

-- Create foreign key for RAMID referencing the appropriate RAM dimension table
ALTER TABLE fact.Laptop
ADD CONSTRAINT fk_ram
FOREIGN KEY (RAMID)
REFERENCES dim.RAM (RAMID);

-- Create foreign key for StorageID referencing the appropriate Storage dimension table
ALTER TABLE fact.Laptop
ADD CONSTRAINT fk_storage
FOREIGN KEY (StorageID)
REFERENCES dim.Storage (StorageID);



CREATE TABLE dim.Brand(
  BrandID int IDENTITY(100, 1),
  Brand NVARCHAR(50) not null
);
ALTER TABLE dim.Brand
ADD CONSTRAINT pk_BrandID PRIMARY KEY (BrandID);
TRUNCATE TABLE dim.Brand


DROP TABLE dim.Processor
CREATE TABLE dim.Processor(
  ProcessorID int IDENTITY(1000, 1),
  Processor NVARCHAR(50) not null
);
ALTER TABLE dim.Processor
ADD CONSTRAINT pk_processorID PRIMARY KEY (ProcessorID);
TRUNCATE TABLE dim.Processor

CREATE TABLE dim.RAM(
  RAMID int IDENTITY(10000, 1),
  RAM BIGINT not null
);
ALTER TABLE dim.RAM
ADD CONSTRAINT pk_ramID PRIMARY KEY (RAMID);
TRUNCATE TABLE dim.RAM

CREATE TABLE dim.Storage(
  StorageID int IDENTITY(100000, 1),
  Storage NVARCHAR(50) not null
);
ALTER TABLE dim.Storage
ADD CONSTRAINT pk_storageID PRIMARY KEY (StorageID);
TRUNCATE TABLE dim.Storage

CREATE TABLE dim.GPU(
  GPUID int IDENTITY(1000000, 1),
  GPU NVARCHAR(100) not null
);
ALTER TABLE dim.GPU
ADD CONSTRAINT pk_gpuID PRIMARY KEY (GPUID);
TRUNCATE TABLE dim.GPU

CREATE TABLE dim.Operating_System(
  OperatingSystemID int IDENTITY(10000000, 1),
  OperatingSystem NVARCHAR(50) not null
);
ALTER TABLE dim.Operating_System
ADD CONSTRAINT pk_operatingsystemID PRIMARY KEY (OperatingSystemID);
TRUNCATE TABLE dim.Operating_System



CREATE TABLE [Error] (
    [Flat File Source Error Output Column] varchar(max),
    [ErrorCode] int,
    [ErrorColumn] int,
)
DROP TABLE Error





