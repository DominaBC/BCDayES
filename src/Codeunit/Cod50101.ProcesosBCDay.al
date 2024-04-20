codeunit 50101 "Procesos BCDay"
{
    trigger OnRun()
    var
        ItemLedgEntryBCDay: Record ItemLedgerEntryBCDay;
        ItemLedgEntry: Record "Item Ledger Entry";
        Contador: Integer;
    begin
        for Contador := 0 to 1000 do begin
            ItemLedgEntry.Reset();
            ItemLedgEntry.FindSet();
            repeat
                ItemLedgEntryBCDay.Init();
                ItemLedgEntryBCDay.TransferFields(ItemLedgEntry);
                ItemLedgEntryBCDay."Entry No." := 0;
                ItemLedgEntryBCDay.Insert(false);
            until ItemLedgEntry.Next() = 0;
        end;
        Message('Finalizado');
    end;
}
