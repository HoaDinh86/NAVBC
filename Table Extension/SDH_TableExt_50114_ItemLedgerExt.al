tableextension 50114 "Item Ledger Entry extension" extends "Item Ledger Entry"
{
    fields
    {
        field(50000; "Source Of Sales"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Source Of Sales".Code where (Blocked = CONST (false));
        }
    }

    var
        myInt: Integer;
}