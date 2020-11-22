DElETE FROM dbo.EmpInsurance  WHERE code = 'UHC';
DElETE FROM dbo.EmpInsurance;

TRUNCATE TABLE EmpInsurance;


PRINT 'Inserting data...'
GO
INSERT INTO  dbo.EmpInsurance (Code, Description) VALUES ('UHC', 'United Health Care')
GO
INSERT INTO  dbo.EmpInsurance (Code, Description) SELECT 'UHC', 'United Health Care' FROM dbo.EmploymentType et WHERE et.Code = 'FT'
GO
INSERT INTO dbo.EmpInsurance (Code, Description) SELECT 'CHC', 'Cigna' FROM dbo.EmploymentType et WHERE et.Code = 'PT'
GO  
INSERT INTO dbo.EmpInsurance (Code, Description) SELECT 'MC', 'Medicare' FROM dbo.EmploymentType et WHERE et.Code = 'CON'
GO
PRINT 'Inserted data...'


UPDATE dbo.EmpInsurance
SET Code = 'MCHC', Description = 'Medicare Health Care'
WHERE ID = 3;
GO



SELECT * 
FROM dbo.EmploymentType

SELECT * 
FROM dbo.State

SELECT * 
FROM dbo.EmpInsurance

