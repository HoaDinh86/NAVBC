page 50100 "Customer Rewards Wizard"
{
    PageType = NavigatePage;
    Caption = 'Customer Rewards assisted setup guide';

    layout
    {
        area(Content)
        {
            group(MediaStandard)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible;
                field("MediaResourcesStandard.""Media Reference"""; MediaResourcesStandard."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        MediaRepositoryStandard: Record 9400;
        MediaResourcesStandard: Record 2000000182;
        step: Option First,Second,Finish;
        ActivationCode: Text;
        TopBannerVisible: Boolean;
        FirstPageVisible: Boolean;
        SecondPageVisible: Boolean;
        FinalPageVisible: Boolean;
        FinishEnabled: Boolean;
        BackEnabled: Boolean;
        NextEnabled: Boolean;
        ActivateEnabled: Boolean;
        EnableCustomerRewards: Boolean;
}