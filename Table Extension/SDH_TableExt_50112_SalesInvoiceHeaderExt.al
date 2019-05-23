tableextension 50112 "Sales Invoice Header extension" extends "Sales Invoice Header"
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