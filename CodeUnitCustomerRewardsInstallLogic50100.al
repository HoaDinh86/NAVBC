codeunit 50100 "Customer Rewards Install Logic"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        myInt: Integer;
    begin

    end;

    procedure SetDefaultCustomerRewardsExtMgtCodeunit()
    var
        CustomerRewardsExtMgtSetup: Record "Customer Rewards Mgt. Setup";
    begin
        CustomerRewardsExtMgtSetup.DeleteAll();
        CustomerRewardsExtMgtSetup.Init();
        CustomerRewardsExtMgtSetup."CR Ext. Mgt. Codeunit ID" := Codeunit::"Customer Rewards Ext. Mgt.";
        CustomerRewardsExtMgtSetup.Insert();
    end;
}