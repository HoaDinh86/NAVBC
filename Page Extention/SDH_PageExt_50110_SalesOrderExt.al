pageextension 50110 "Sales Order Ext" extends "Sales Order"
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