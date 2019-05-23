tableextension 50100 "CustomerTable Ext." extends Customer
{
    fields
    {
        field(50100; RewardPoints; Integer)
        {
            MinValue = 0;
        }
    }

    var
        myInt: Integer;
}