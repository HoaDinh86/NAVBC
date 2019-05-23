codeunit 50110 "Extention Blog Subscribers"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterCheckSalesDoc', '', true, true)]
    local procedure CheckSalesOrderSourceofSales(var SalesHeader: Record "Sales Header")
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then
            SalesHeader.TestField("Source Of Sales");
    end;

    [EventSubscriber(ObjectType::Table, DATABASE::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesHeader', '', true, true)]
    local procedure TransferSourceofSalesToJournalLine(SalesHeader: Record "Sales Header"; var ItemJnlLine: Record "Item Journal Line")
    begin
        ItemJnlLine."Source Of Sales" := SalesHeader."Source Of Sales";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure TransferSourceofSalesToLedger(ItemJournalLine: Record "Item Journal Line"; var NewItemLedgEntry: Record "Item Ledger Entry")
    begin
        NewItemLedgEntry."Source Of Sales" := ItemJournalLine."Source Of Sales";
    end;

    var
        myInt: Integer;
}