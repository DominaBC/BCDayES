codeunit 50100 DemoPerformance
{
    Subtype = Test;

    [Test]
    procedure SinTextBuilder()
    var
        varTextos: Text;
        varContador: Integer;
    begin
        for varContador := 0 to 5000 do begin

            varTextos += 'd7249381-69bb-4333-bd95-8e584d74cad7-d7249381-69bb-4333-bd95-8e584d74cad7-d7249381-69bb-4333-bd95-8e584d74cad7-d7249381-69bb-4333-bd95-8e584d74cad7';
        end;
    end;

    [Test]
    procedure ConTextBuilder()
    var
        varTextos: TextBuilder;
        varContador: Integer;
    begin
        for varContador := 0 to 5000 do begin

            varTextos.Append('d7249381-69bb-4333-bd95-8e584d74cad7-d7249381-69bb-4333-bd95-8e584d74cad7-d7249381-69bb-4333-bd95-8e584d74cad7-d7249381-69bb-4333-bd95-8e584d74cad7');
        end;
    end;

    [Test]
    procedure ConArray()
    var

        varTextos: array[1000] of Code[150];
        varContador: Integer;
    begin
        for varContador := 1 to 1000 do begin

            varTextos[varContador] := 'd7249381-69bb-4333-bd95-8e584d74cad7-d7249381-69bb-4333-bd95-8e584d74cad7-d7249381-69bb-4333-bd95-8e584d74cad7-d7249381-69bb-4333-bd95-8e584d74cad7';
        end;
    end;

    [Test]
    procedure ConList()
    var
        varTextos: List of [Code[150]];
        varContador: Integer;
    begin
        for varContador := 0 to 1000 do begin

            varTextos.Add('d7249381-69bb-4333-bd95-8e584d74cad7-d7249381-69bb-4333-bd95-8e584d74cad7-d7249381-69bb-4333-bd95-8e584d74cad7-d7249381-69bb-4333-bd95-8e584d74cad7');
        end;
    end;

    [Test]
    procedure SinDictionary()
    var
        Item: Record Item Temporary;
        ItemLedger: Record "Item Ledger Entry";

    begin
        ItemLedger.SetRange("Entry Type", ItemLedger."Entry Type"::Sale);
        if ItemLedger.FindSet() then
            repeat
                Item.Init();
                Item."No." := ItemLedger."Item No.";
                Item.Description := ItemLedger.Description;
                if not Item.Insert() then
                    Item.modify()
            until ItemLedger.Next() = 0;
    end;

    [Test]
    procedure ConDictionary()
    var
        myDictionary: Dictionary of [Integer, Text];
        ItemLedger: Record "Item Ledger Entry";

    begin
        ItemLedger.SetRange("Entry Type", ItemLedger."Entry Type"::Sale);
        if ItemLedger.FindSet() then
            repeat
                myDictionary.Add(ItemLedger."Entry No.", ItemLedger.Description)
            until ItemLedger.Next() = 0;
    end;


    [Test]
    procedure ConSetLoadFields()
    var
        ItemLedgerEntryBCDay: Record ItemLedgerEntryBCDay;
        DescripcionesProductos: List of [Text];
    begin
        ItemLedgerEntryBCDay.Reset();
        ItemLedgerEntryBCDay.SetLoadFields("Document No.");
        if ItemLedgerEntryBCDay.FindSet() then
            repeat
                DescripcionesProductos.Add(ItemLedgerEntryBCDay."Document No.");
            until ItemLedgerEntryBCDay.Next() = 0;


    end;

    [Test]
    procedure SinSetLoadFields()
    var
        ItemLedgerEntryBCDay: Record ItemLedgerEntryBCDay;
        DescripcionesProductos: List of [Text];
    begin
        ItemLedgerEntryBCDay.Reset();
        if ItemLedgerEntryBCDay.FindSet() then
            repeat
                DescripcionesProductos.Add(ItemLedgerEntryBCDay."Document No.");
            until ItemLedgerEntryBCDay.Next() = 0;


    end;

    [Test]
    procedure SinSetSetCurrentKey()
    var
        ItemLedgerEntryBCDay: Record ItemLedgerEntryBCDay;
    begin
        ItemLedgerEntryBCDay.Reset();
        ItemLedgerEntryBCDay.SetRange("Entry Type", ItemLedgerEntryBCDay."Entry Type"::Purchase);
        ItemLedgerEntryBCDay.SetRange("Document Type", ItemLedgerEntryBCDay."Document Type"::"Purchase Receipt");
        ItemLedgerEntryBCDay.SetRange("Location Code", 'OESTE');
        if ItemLedgerEntryBCDay.FindFirst() then;
    end;

    [Test]
    procedure ConSetSetCurrentKey()
    var
        ItemLedgerEntryBCDay: Record ItemLedgerEntryBCDay;
    begin
        ItemLedgerEntryBCDay.Reset();
        ItemLedgerEntryBCDay.SetCurrentKey("Entry Type", "Document Type", "Location Code");
        ItemLedgerEntryBCDay.SetRange("Entry Type", ItemLedgerEntryBCDay."Entry Type"::Purchase);
        ItemLedgerEntryBCDay.SetRange("Document Type", ItemLedgerEntryBCDay."Document Type"::"Purchase Receipt");
        ItemLedgerEntryBCDay.SetRange("Location Code", 'OESTE');
        if ItemLedgerEntryBCDay.FindFirst() then;
    end;



    [Test]
    procedure FindFirst()
    var
        ItemLedgerEntryBCDay: Record ItemLedgerEntryBCDay;
        DescripcionesProductos: List of [Text];
    begin
        ItemLedgerEntryBCDay.Reset();
        ItemLedgerEntryBCDay.SetCurrentKey("Entry Type", "Document Type", "Location Code");
        ItemLedgerEntryBCDay.SetRange("Entry Type", ItemLedgerEntryBCDay."Entry Type"::Purchase);
        ItemLedgerEntryBCDay.SetRange("Document Type", ItemLedgerEntryBCDay."Document Type"::"Purchase Receipt");
        ItemLedgerEntryBCDay.SetRange("Location Code", 'OESTE');
        if ItemLedgerEntryBCDay.FindFirst() then
            repeat
                DescripcionesProductos.Add(ItemLedgerEntryBCDay.SystemId);
            until ItemLedgerEntryBCDay.Next() = 0;
    end;

    [Test]
    procedure FindSet()
    var
        ItemLedgerEntryBCDay: Record ItemLedgerEntryBCDay;
        DescripcionesProductos: List of [Text];
    begin
        ItemLedgerEntryBCDay.Reset();
        ItemLedgerEntryBCDay.SetCurrentKey("Entry Type", "Document Type", "Location Code");
        ItemLedgerEntryBCDay.SetRange("Entry Type", ItemLedgerEntryBCDay."Entry Type"::Purchase);
        ItemLedgerEntryBCDay.SetRange("Document Type", ItemLedgerEntryBCDay."Document Type"::"Purchase Receipt");
        ItemLedgerEntryBCDay.SetRange("Location Code", 'OESTE');
        if ItemLedgerEntryBCDay.FindSet() then
            repeat
                DescripcionesProductos.Add(ItemLedgerEntryBCDay.SystemId);
            until ItemLedgerEntryBCDay.Next() = 0;
    end;

    [Test]
    procedure ConCalcSums()
    var
        ItemLedgerEntryBCDay: Record ItemLedgerEntryBCDay;
        DescripcionesProductos: List of [Text];
    begin
        ItemLedgerEntryBCDay.Reset();
        ItemLedgerEntryBCDay.SetCurrentKey("Entry Type", "Document Type", "Location Code");
        ItemLedgerEntryBCDay.SetRange("Entry Type", ItemLedgerEntryBCDay."Entry Type"::Purchase);
        ItemLedgerEntryBCDay.SetRange("Document Type", ItemLedgerEntryBCDay."Document Type"::"Purchase Receipt");
        if ItemLedgerEntryBCDay.FindFirst() then
            ItemLedgerEntryBCDay.CalcSums(Quantity);
    end;

    [Test]
    procedure SinCalcsums()
    var
        ItemLedgerEntryBCDay: Record ItemLedgerEntryBCDay;
        Sumatorio: Decimal;
    begin
        ItemLedgerEntryBCDay.Reset();
        ItemLedgerEntryBCDay.SetCurrentKey("Entry Type", "Document Type", "Location Code");
        ItemLedgerEntryBCDay.SetRange("Entry Type", ItemLedgerEntryBCDay."Entry Type"::Purchase);
        ItemLedgerEntryBCDay.SetRange("Document Type", ItemLedgerEntryBCDay."Document Type"::"Purchase Receipt");
        if ItemLedgerEntryBCDay.FindSet() then
            repeat
                Sumatorio += ItemLedgerEntryBCDay.Quantity;
            until ItemLedgerEntryBCDay.Next() = 0;
    end;

    [Test]
    procedure SinSetAutoCalcFields()
    var
        ItemLedgerEntryBCDay: Record ItemLedgerEntryBCDay;
        CosteActual: Decimal;
    begin
        CosteActual := 0;
        ItemLedgerEntryBCDay.Reset();
        ItemLedgerEntryBCDay.SetCurrentKey("Entry Type", "Document Type", "Location Code");
        ItemLedgerEntryBCDay.SetRange("Entry Type", ItemLedgerEntryBCDay."Entry Type"::Purchase);
        ItemLedgerEntryBCDay.SetRange("Document Type", ItemLedgerEntryBCDay."Document Type"::"Purchase Receipt");
        ItemLedgerEntryBCDay.SetRange("Location Code", 'OESTE');
        if ItemLedgerEntryBCDay.FindSet() then begin
            repeat
                ItemLedgerEntryBCDay.CalcFields("Cost Amount (Actual)");
                CosteActual += ItemLedgerEntryBCDay."Cost Amount (Actual)";
            until ItemLedgerEntryBCDay.Next() = 0;
        end;
    end;

    [Test]
    procedure ConSetAutoCalcFields()
    var
        ItemLedgerEntryBCDay: Record ItemLedgerEntryBCDay;
        CosteActual: Decimal;
    begin
        CosteActual := 0;
        ItemLedgerEntryBCDay.Reset();
        ItemLedgerEntryBCDay.SetCurrentKey("Entry Type", "Document Type", "Location Code");
        ItemLedgerEntryBCDay.SetRange("Entry Type", ItemLedgerEntryBCDay."Entry Type"::Purchase);
        ItemLedgerEntryBCDay.SetRange("Document Type", ItemLedgerEntryBCDay."Document Type"::"Purchase Receipt");
        ItemLedgerEntryBCDay.SetRange("Location Code", 'OESTE');
        if ItemLedgerEntryBCDay.FindSet() then begin
            ItemLedgerEntryBCDay.SetAutoCalcFields("Cost Amount (Actual)");
            repeat
                CosteActual += ItemLedgerEntryBCDay."Cost Amount (Actual)";

            until ItemLedgerEntryBCDay.Next() = 0;

        end;
    end;

    [Test]
    procedure SinQuery()

    var
        Item: Record Item;
        PrevDate: Date;
        count: integer;
        TotalQty: Decimal;
        ItemLedgerEntry: Record "Item Ledger Entry";
        varTexto: TextBuilder;
    begin
        count := 0;
        if Item.FINDSET then
            repeat
                PrevDate := 0D;
                TotalQty := 0;
                ItemLedgerEntry.SETCURRENTKEY("Item No.", "Posting Date");
                if ItemLedgerEntry.FINDSET then
                    repeat
                        if (ItemLedgerEntry."Posting Date" <> PrevDate) and (PrevDate <> 0D) then begin

                            varTexto.Append(StrSubstNo('%1,%2,%3,%4', Item."No.", Item.Description, PrevDate, -TotalQty));
                            TotalQty := 0;
                            count := count + 1;
                        end;
                        PrevDate := ItemLedgerEntry."Posting Date";
                        TotalQty := TotalQty + ItemLedgerEntry.Quantity;
                    until (ItemLedgerEntry.NEXT = 0) or (count >= 4);
                if PrevDate <> 0D then begin
                    varTexto.Append(StrSubstNo('%1,%2,%3,%4', Item."No.", Item.Description, PrevDate, -TotalQty));
                    count := count + 1;
                end;
            until (Item.NEXT = 0) or (count >= 4);
    end;

    [Test]
    procedure ConQuery()
    var
        ItemMovements: Query "Item Movements Query";
        varTexto: TextBuilder;
    begin
        ItemMovements.Open;
        while ItemMovements.Read do
            varTexto.Append(StrSubstNo('%1,%2,%3,%4', ItemMovements.No_, ItemMovements.Description, ItemMovements.Posting_Date, ItemMovements.Sum_Quantity));
        ItemMovements.Close();
    end;

    VAR

}