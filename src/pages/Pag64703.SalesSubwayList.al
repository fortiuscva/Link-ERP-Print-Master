page 64703 "LPMS Sales Subway List"
{
    PageType = List;
    SourceTable = "LPMS Sales Subway";
    ApplicationArea = All;
    Caption = 'Sales Subway List';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Step No."; Rec."Step No.")
                {
                    ToolTip = 'Specifies the value of the Step No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}