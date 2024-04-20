permissionset 50100 BCDayPermission
{
    Assignable = true;
    Permissions = tabledata ItemLedgerEntryBCDay = RIMD,
        table ItemLedgerEntryBCDay = X,
        codeunit DemoPerformance = X,
        codeunit "Procesos BCDay" = X,
        query "Item Movements Query" = X;
}