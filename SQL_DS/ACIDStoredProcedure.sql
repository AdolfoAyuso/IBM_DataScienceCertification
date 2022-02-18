CREATE PROCEDURE M_TRANSACTION @CN nvarchar(20), @PN nvarchar(20)
AS
	BEGIN TRY
		DECLARE @M FLOAT;

		DECLARE @V INT;

		SET @M=(SELECT PRICE FROM SHOESHOP WHERE PRODUCT=@PN);

		UPDATE BANKACCOUNTS
		SET BALANCE=BALANCE-@M
		WHERE ACCOUNTNAME=@CN;

		UPDATE BANKACCOUNTS
		SET BALANCE=BALANCE+@M
		WHERE LOWER(ACCOUNTNAME) LIKE '%SHOE%';

		UPDATE SHOESHOP
		SET STOCK=STOCK-1
		WHERE PRODUCT=@PN;	
		
		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
	END CATCH
