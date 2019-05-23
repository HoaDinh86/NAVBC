tableextension 50111 "Sales Header extension" extends "Sales Header"
{
    fields
    {
        field(50000; "Source Of Sales"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Source Of Sales".Code where (Blocked = CONST (false));
        }
        field(50001; Test; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}