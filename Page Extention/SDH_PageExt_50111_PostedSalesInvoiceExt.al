pageextension 50111 "Posted Sales Invoice Ext" extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
        addafter("External Document No.")
        {
            field("Source Of Sales"; "Source Of Sales")
            {
                ApplicationArea = All;
                Importance = Promoted;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}