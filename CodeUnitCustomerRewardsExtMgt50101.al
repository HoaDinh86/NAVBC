codeunit 50101 "Customer Rewards Ext. Mgt."
{
    trigger OnRun()
    begin

    end;

    procedure IsCustomerRewardsActivated(): Boolean
    var
        ActivationCodeInfo: Record "Activation Code Information";
    begin
        if not ActivationCodeInfo.FindFirst() then
            exit(false);

        if (ActivationCodeInfo."Date Activated" <= Today()) and (ActivationCodeInfo."Expiration Date" >= Today()) then
            exit(true);
        exit(false);
    end;

    procedure GetRewardLevel(RewardPoints: Integer) RewardLevelTxt: Text;
    var
        RewardLevelRec: Record "Reward Level";
        MinRewardLevelPoints: Integer;
    begin
        RewardLevelTxt := NoRewardlevelTxt;
        if RewardLevelRec.IsEmpty() then
            exit;

        RewardLevelRec.SetRange("Minimum Reward Points", 0, RewardPoints);
        RewardLevelRec.SetCurrentKey("Minimum Reward Points");

        if not RewardLevelRec.FindFirst() then
            exit;

        MinRewardLevelPoints := RewardLevelRec."Minimum Reward Points";

        if RewardPoints > MinRewardLevelPoints then begin
            RewardLevelRec.Reset();
            RewardLevelRec.SetRange("Minimum Reward Points", MinRewardLevelPoints, RewardPoints);
            RewardLevelRec.SetCurrentKey("Minimum Reward Points");
            RewardLevelRec.FindLast();
            RewardLevelTxt := RewardLevelRec.Level;
        end;
    end;

    procedure ActivateCustomerRewards(ActivationCode: Text): Boolean
    var
        ActivationCodeInfo: Record "Activation Code Information";
    begin

    end;

    [IntegrationEvent(false, false)]
    procedure OnGetActivationCodeStatusFromServer(ActivationCode: Text);
    begin

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Customer Rewards Ext. Mgt.", 'OnGetActivationCodeStatusFromServer', '', false, false)]
    local procedure OnGetActivationCodeStatusFromServerSubscriber(ActivationCode: Text)
    var
        ActivationCodeInfo: Record "Activation Code Information";
        ResponseText: Text;
        Result: JsonToken;
        JsonRepsonse: JsonToken;
    begin
        if not CanHandle then
            exit;

        if GetHttpResponse(ActivationCode, ResponseText) then begin
            JsonRepsonse.ReadFrom(ResponseText);

            if (JsonRepsonse.SelectToken('ActivationResponse', Result)) then begin
                if (Result.AsValue().AsText() = 'Success') then begin
                    if ActivationCodeInfo.FindFirst() then
                        ActivationCodeInfo.Delete();

                    ActivationCodeInfo.Init();
                    ;
                    ActivationCodeInfo.ActivationCode := ActivationCode;
                    ActivationCodeInfo."Date Activated" := Today();
                    ActivationCodeInfo."Expiration Date" := CalcDate('<1Y>', Today());
                    ActivationCodeInfo.Insert();
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnAfterReleaseSalesDoc', '', false, false)]
    local procedure OnAfterReleaseSalesDocSubscriber(var salesheader: Record "Sales Header"; PreviewMode: Boolean; LinesWereModified: Boolean)
    var
        customer: Record Customer;
    begin
        if salesheader.Status <> salesheader.Status::Released then
            exit;

        customer.get(salesheader."Sell-to Customer No.");
        customer.RewardPoints += 1;
        customer.Modify();
    end;

    local procedure GetHttpResponse(ActivationCode: Text; var ResponseText: Text): Boolean
    begin
        if ActivationCode = '' then
            exit;

        ResponseText := DummySuccessResponseTxt;
        exit(true);

    end;

    local procedure CanHandle(): Boolean
    var
        CustomerRewardsExtMgtSetup: Record "Customer Rewards Mgt. Setup";
    begin
        if CustomerRewardsExtMgtSetup.Get then
            exit(CustomerRewardsExtMgtSetup."CR Ext. Mgt. Codeunit ID" = CODEUNIT::"Customer Rewards Ext. Mgt.");
        exit(false);
    end;

    var
        DummySuccessResponseTxt: Label '{"ActivationResponse": "Success"}', Locked = true;
        NoRewardlevelTxt: Label 'NONE';
}