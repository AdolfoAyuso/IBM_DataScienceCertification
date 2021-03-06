CREATE PROCEDURE TRANSACTION_JAMES 
AS
	BEGIN TRY
		BEGIN TRAN
			UPDATE BANKACCOUNTS
			SET BALANCE=BALANCE-4*300
			WHERE ACCOUNTNAME='James';

			UPDATE BANKACCOUNTS
			SET BALANCE=BALANCE+4*300
			WHERE LOWER(ACCOUNTNAME) LIKE '%SHOE%';

			UPDATE SHOESHOP
			SET STOCK=STOCK-3
			WHERE PRODUCT='Trainers';
		
			UPDATE BANKACCOUNTS
			SET BALANCE=BALANCE-300
			WHERE ACCOUNTNAME='James';

			UPDATE BANKACCOUNTS
			SET BALANCE=BALANCE+300
			WHERE LOWER(ACCOUNTNAME) LIKE '%SHOE%';

			UPDATE SHOESHOP
			SET STOCK=STOCK-1
			WHERE PRODUCT='Trainers';	
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK;
	END CATCH

	
