SELECT TOP (1000) [Prodcut]
      ,[Quantity]
      ,[Price]
  FROM [Commerce].[dbo].[Products]

  alter table Products
  add Price int

  truncate table Products

  exec sp_configure 'show advanced options',1
  reconfigure

  exec sp_configure 'ad hoc distributed queries',1
  reconfigure

  exec master.sys.sp_MSset_oledb_prop 'Microsoft.ACE.OLEDB.12.0','AllowInProcess',1

  USE [master]
GO
EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DisallowAdHocAccess', 0
GO

SELECT * 
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0', 
   'Excel 12.0 Xml;Database=C:\Temp\Data.xlsx;', Sheet1$);

   Select * FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0', 'Excel 12.0; Database=C:\Temp\Data.xlsx;','select * from [Sheet1$]' )