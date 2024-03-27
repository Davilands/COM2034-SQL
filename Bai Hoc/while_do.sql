DECLARE @dem INT = 0;
WHILE @dem < 10
BEGIN
	PRINT 'Quan trong la...'
	SET @dem = @dem + 1;
	IF @dem = 5
		BREAK;
END
PRINT 'hoc lap trinh'

DECLARE @d INT = 0;
WHILE @d < 10
BEGIN
	SET @d = @d + 1;
	IF @d % 2 = 0
		PRINT 'So chan'
	ELSE 
		PRINT 'so le'
END

BEGIN TRY 
	SELECT 1 + 'SQL';
END TRY
BEGIN CATCH
	SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_MESSAGE() AS ErrorMassage;
END CATCH