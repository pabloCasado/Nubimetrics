
-- Desafio 11
select A.CountryRegionCode as country_region_code, 
	   AVG(B.TaxRate) as average_taxRate 
from Person.StateProvince A 
	 inner join Sales.SalesTaxRate B on A.StateProvinceID = B.StateProvinceID
group by A.CountryRegionCode 


-- Desafio 12
SELECT D.Name as country_name, 
	   E.Name as currency_name,
	   ROUND(MAX(F.AverageRate),2) as currency_rate,
	   ROUND(AVG(B.TaxRate),2) as average_taxRate 
FROM Person.StateProvince A 
	 inner join Sales.SalesTaxRate B on A.StateProvinceID = B.StateProvinceID
	 inner join Sales.CountryRegionCurrency C on A.CountryRegionCode = C.CountryRegionCode
	 inner join Person.CountryRegion D on C.CountryRegionCode = D.CountryRegionCode
	 inner join Sales.Currency E on C.CurrencyCode = E.CurrencyCode
	 inner join Sales.CurrencyRate F on C.CurrencyCode = F.ToCurrencyCode
GROUP BY D.Name, E.Name
ORDER BY country_name