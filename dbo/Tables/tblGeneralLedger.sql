CREATE TABLE [dbo].[tblGeneralLedger] (
    [GeneralLedgerID]  BIGINT        IDENTITY (1, 1) NOT NULL,
    [Dated]            DATETIME      NULL,
    [TransactionMonth] AS            (datepart(month,[Dated])),
    [TransactionYear]  AS            (datepart(year,[dated])),
    [TransType]        NVARCHAR (50) NULL,
    [ReferenceType]    NVARCHAR (50) NULL,
    [DebitAmount]      MONEY         NULL,
    [CreditAmount]     MONEY         NULL,
    [NetAmount]        AS            (isnull([DebitAmount],(0))-isnull([CreditAmount],(0))),
    [ServiceID]        BIGINT        NULL,
    [DepartmentID]     INT           NULL,
    CONSTRAINT [PK_tblGeneralLedger] PRIMARY KEY CLUSTERED ([GeneralLedgerID] ASC)
);

