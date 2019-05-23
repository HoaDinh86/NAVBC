report 50110 "Source Of Sales"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\SourceOfSales.rdl';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            RequestFilterFields = "Item No.", "Location Code", "Posting Date";
            DataItemTableView = where ("Source Of Sales" = filter (<> ''));

            column(Item_No_; "Item No.")
            { }
            column(Description; Description)
            { }
            column(Location_Code; "Location Code")
            { }
            column(Quantity; -Quantity)
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Document_No_; "Document No.")
            { }
            column(Source_Of_Sales; "Source Of Sales")
            { }
        }
    }



    var
        myInt: Integer;
}