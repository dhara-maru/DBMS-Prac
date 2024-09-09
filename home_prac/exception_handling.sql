--simple exception handling
DECLARE @val1 INT
DECLARE @val2 INT
BEGIN TRY
    set @val1 = 8
    set @val2 = @val1/0 --will throw an error bcoz divided by zero
    print @val2
END TRY
BEGIN CATCH
    DECLARE @msg VARCHAR(50)
    set @msg = (SELECT ERROR_MESSAGE())
    print 'Error occured that is : '+ @msg
END CATCH


--exception handling with Stored Procedure SP
CREATE PROCEDURE Samplesp
AS
BEGIN
    BEGIN TRY
        select salary + firstname from person where id=2 --will throw error bcoz datatype of salary & fname are diff and we can't concat them like this
    END TRY
    BEGIN CATCH
        SELECT ERROR_PROCEDURE()
        SELECT ERROR_MESSAGE()
        SELECT ERROR_NUMBER()
        SELECT ERROR_LINE()
        SELECT ERROR_SEVERITY()
        SELECT ERROR_STATE()
    END CATCH
END
EXEC Samplesp

