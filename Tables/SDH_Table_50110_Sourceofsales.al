table 50110 "Source Of Sales"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(4; "Last Modified Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }


    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;


}