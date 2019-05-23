tableextension 50113 "Item Journal Line extension" extends "Item Journal Line"
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