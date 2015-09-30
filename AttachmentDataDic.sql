Create table DocMaster
(
DocID	numeric identity,
DocDesc	nvarchar(50),
UserID	nvarchar(15),
UpdatedOn	DateTime
)

-- NOTE:  the DocID in DocTrans table refers to the DocMaster Table.

create table DocTrans
(
DTID	numeric identity,
DocID	Numeric,
DocDate	DateTime,	
Title	nvarchar(70),
DocDetail	nvarchar(200),
UpdatedBy	nvarchar(15),
UpdatedOn	DateTime	
)

-- NOTE:  The DTID in DocTrans table refers to the DocTrans Table.

create table DocAttach
(
DAID	numeric identity,
DTID	Numeric,
DocFilename nvarchar(50) ,	
DocFilepath	nvarchar(200),
UpdatedBy	nvarchar(15),
UpdatedOn	DateTime	
)


-- NOTE:  The DTID in DocTrans table refers to the DocTrans Table.
--        The MemberID refers to the MemberMaster table
create table DocHistory
(
DHID	  numeric identity,
DTID	  Numeric,
MemberID  numeric, 
MailSentDate Datetime ,	
MailSentFlag nvarchar(1),
UpdatedBy	nvarchar(15),
UpdatedOn	DateTime	
)



