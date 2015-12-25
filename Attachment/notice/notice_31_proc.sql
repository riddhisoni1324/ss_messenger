use OVS
go

CREATE PROCEDURE MyBackground
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- The interval between cleanup attempts
    declare @timeToRun nvarchar(50)
    set @timeToRun = '00:00:01'

    while 1 = 1
    begin
        waitfor time @timeToRun
        begin
           update VOTERINFO set attempt = 0
        end
    end
END
GO


//----main procedure

CREATE PROCEDURE MyAttempts
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    

    while 1 = 1
    begin
		update VOTERINFO set attempt = 0
        WAITFOR DELAY '00:00:01';
        
    end
END
GO
