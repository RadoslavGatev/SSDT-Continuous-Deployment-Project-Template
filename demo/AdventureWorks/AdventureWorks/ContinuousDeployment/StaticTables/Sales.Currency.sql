SET NOCOUNT ON

MERGE INTO [Sales].[Currency] AS Target
USING (VALUES
  (N'AED',N'Emirati Dirham','2008-04-30T00:00:00')
 ,(N'AFA',N'Afghani','2008-04-30T00:00:00')
 ,(N'ALL',N'Lek','2008-04-30T00:00:00')
 ,(N'AMD',N'Armenian Dram','2008-04-30T00:00:00')
 ,(N'ANG',N'Netherlands Antillian Guilder','2008-04-30T00:00:00')
 ,(N'AOA',N'Kwanza','2008-04-30T00:00:00')
 ,(N'ARS',N'Argentine Peso','2008-04-30T00:00:00')
 ,(N'ATS',N'Shilling','2008-04-30T00:00:00')
 ,(N'AUD',N'Australian Dollar','2008-04-30T00:00:00')
 ,(N'AWG',N'Aruban Guilder','2008-04-30T00:00:00')
 ,(N'AZM',N'Azerbaijanian Manat','2008-04-30T00:00:00')
 ,(N'BBD',N'Barbados Dollar','2008-04-30T00:00:00')
 ,(N'BDT',N'Taka','2008-04-30T00:00:00')
 ,(N'BEF',N'Belgian Franc','2008-04-30T00:00:00')
 ,(N'BGN',N'Bulgarian Lev','2008-04-30T00:00:00')
 ,(N'BHD',N'Bahraini Dinar','2008-04-30T00:00:00')
 ,(N'BND',N'Brunei Dollar','2008-04-30T00:00:00')
 ,(N'BOB',N'Boliviano','2008-04-30T00:00:00')
 ,(N'BRL',N'Brazilian Real','2008-04-30T00:00:00')
 ,(N'BSD',N'Bahamian Dollar','2008-04-30T00:00:00')
 ,(N'BTN',N'Ngultrum','2008-04-30T00:00:00')
 ,(N'CAD',N'Canadian Dollar','2008-04-30T00:00:00')
 ,(N'CHF',N'Swiss Franc','2008-04-30T00:00:00')
 ,(N'CLP',N'Chilean Peso','2008-04-30T00:00:00')
 ,(N'CNY',N'Yuan Renminbi','2008-04-30T00:00:00')
 ,(N'COP',N'Colombian Peso','2008-04-30T00:00:00')
 ,(N'CRC',N'Costa Rican Colon','2008-04-30T00:00:00')
 ,(N'CYP',N'Cyprus Pound','2008-04-30T00:00:00')
 ,(N'CZK',N'Czech Koruna','2008-04-30T00:00:00')
 ,(N'DEM',N'Deutsche Mark','2008-04-30T00:00:00')
 ,(N'DKK',N'Danish Krone','2008-04-30T00:00:00')
 ,(N'DOP',N'Dominican Peso','2008-04-30T00:00:00')
 ,(N'DZD',N'Algerian Dinar','2008-04-30T00:00:00')
 ,(N'EEK',N'Kroon','2008-04-30T00:00:00')
 ,(N'EGP',N'Egyptian Pound','2008-04-30T00:00:00')
 ,(N'ESP',N'Spanish Peseta','2008-04-30T00:00:00')
 ,(N'EUR',N'EURO','2008-04-30T00:00:00')
 ,(N'FIM',N'Markka','2008-04-30T00:00:00')
 ,(N'FJD',N'Fiji Dollar','2008-04-30T00:00:00')
 ,(N'FRF',N'French Franc','2008-04-30T00:00:00')
 ,(N'GBP',N'United Kingdom Pound','2008-04-30T00:00:00')
 ,(N'GHC',N'Cedi','2008-04-30T00:00:00')
 ,(N'GRD',N'Drachma','2008-04-30T00:00:00')
 ,(N'GTQ',N'Quetzal','2008-04-30T00:00:00')
 ,(N'HKD',N'Hong Kong Dollar','2008-04-30T00:00:00')
 ,(N'HRK',N'Croatian Kuna','2008-04-30T00:00:00')
 ,(N'HUF',N'Forint','2008-04-30T00:00:00')
 ,(N'IDR',N'Rupiah','2008-04-30T00:00:00')
 ,(N'IEP',N'Irish Pound','2008-04-30T00:00:00')
 ,(N'ILS',N'New Israeli Shekel','2008-04-30T00:00:00')
 ,(N'INR',N'Indian Rupee','2008-04-30T00:00:00')
 ,(N'ISK',N'Iceland Krona','2008-04-30T00:00:00')
 ,(N'ITL',N'Italian Lira','2008-04-30T00:00:00')
 ,(N'JMD',N'Jamaican Dollar','2008-04-30T00:00:00')
 ,(N'JOD',N'Jordanian Dinar','2008-04-30T00:00:00')
 ,(N'JPY',N'Yen','2008-04-30T00:00:00')
 ,(N'KES',N'Kenyan Shilling','2008-04-30T00:00:00')
 ,(N'KRW',N'Won','2008-04-30T00:00:00')
 ,(N'KWD',N'Kuwaiti Dinar','2008-04-30T00:00:00')
 ,(N'LBP',N'Lebanese Pound','2008-04-30T00:00:00')
 ,(N'LKR',N'Sri Lankan Rupee','2008-04-30T00:00:00')
 ,(N'LTL',N'Lithuanian Litas','2008-04-30T00:00:00')
 ,(N'LVL',N'Latvian Lats','2008-04-30T00:00:00')
 ,(N'MAD',N'Moroccan Dirham','2008-04-30T00:00:00')
 ,(N'MTL',N'Maltese Lira','2008-04-30T00:00:00')
 ,(N'MUR',N'Mauritius Rupee','2008-04-30T00:00:00')
 ,(N'MVR',N'Rufiyaa','2008-04-30T00:00:00')
 ,(N'MXN',N'Mexican Peso','2008-04-30T00:00:00')
 ,(N'MYR',N'Malaysian Ringgit','2008-04-30T00:00:00')
 ,(N'NAD',N'Namibia Dollar','2008-04-30T00:00:00')
 ,(N'NGN',N'Naira','2008-04-30T00:00:00')
 ,(N'NLG',N'Netherlands Guilder','2008-04-30T00:00:00')
 ,(N'NOK',N'Norwegian Krone','2008-04-30T00:00:00')
 ,(N'NPR',N'Nepalese Rupee','2008-04-30T00:00:00')
 ,(N'NZD',N'New Zealand Dollar','2008-04-30T00:00:00')
 ,(N'OMR',N'Omani Rial','2008-04-30T00:00:00')
 ,(N'PAB',N'Balboa','2008-04-30T00:00:00')
 ,(N'PEN',N'Nuevo Sol','2008-04-30T00:00:00')
 ,(N'PHP',N'Philippine Peso','2008-04-30T00:00:00')
 ,(N'PKR',N'Pakistan Rupee','2008-04-30T00:00:00')
 ,(N'PLN',N'Zloty','2008-04-30T00:00:00')
 ,(N'PLZ',N'Polish Zloty(old)','2008-04-30T00:00:00')
 ,(N'PTE',N'Portuguese Escudo','2008-04-30T00:00:00')
 ,(N'PYG',N'Guarani','2008-04-30T00:00:00')
 ,(N'ROL',N'Leu','2008-04-30T00:00:00')
 ,(N'RUB',N'Russian Ruble','2008-04-30T00:00:00')
 ,(N'RUR',N'Russian Ruble(old)','2008-04-30T00:00:00')
 ,(N'SAR',N'Saudi Riyal','2008-04-30T00:00:00')
 ,(N'SEK',N'Swedish Krona','2008-04-30T00:00:00')
 ,(N'SGD',N'Singapore Dollar','2008-04-30T00:00:00')
 ,(N'SIT',N'Tolar','2008-04-30T00:00:00')
 ,(N'SKK',N'Slovak Koruna','2008-04-30T00:00:00')
 ,(N'SVC',N'El Salvador Colon','2008-04-30T00:00:00')
 ,(N'THB',N'Baht','2008-04-30T00:00:00')
 ,(N'TND',N'Tunisian Dinar','2008-04-30T00:00:00')
 ,(N'TRL',N'Turkish Lira','2008-04-30T00:00:00')
 ,(N'TTD',N'Trinidad and Tobago Dollar','2008-04-30T00:00:00')
 ,(N'TWD',N'New Taiwan Dollar','2008-04-30T00:00:00')
 ,(N'USD',N'US Dollar','2008-04-30T00:00:00')
 ,(N'UYU',N'Uruguayan Peso','2008-04-30T00:00:00')
 ,(N'VEB',N'Bolivar','2008-04-30T00:00:00')
 ,(N'VND',N'Dong','2008-04-30T00:00:00')
 ,(N'XOF',N'CFA Franc BCEAO','2008-04-30T00:00:00')
 ,(N'ZAR',N'Rand','2008-04-30T00:00:00')
 ,(N'ZWD',N'Zimbabwe Dollar','2008-04-30T00:00:00')
) AS Source ([CurrencyCode],[Name],[ModifiedDate])
ON (Target.[CurrencyCode] = Source.[CurrencyCode])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL OR 
	NULLIF(Source.[ModifiedDate], Target.[ModifiedDate]) IS NOT NULL OR NULLIF(Target.[ModifiedDate], Source.[ModifiedDate]) IS NOT NULL) THEN
 UPDATE SET
  [Name] = Source.[Name], 
  [ModifiedDate] = Source.[ModifiedDate]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([CurrencyCode],[Name],[ModifiedDate])
 VALUES(Source.[CurrencyCode],Source.[Name],Source.[ModifiedDate])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [Sales].[Currency]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[Sales].[Currency] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO

SET NOCOUNT OFF
GO