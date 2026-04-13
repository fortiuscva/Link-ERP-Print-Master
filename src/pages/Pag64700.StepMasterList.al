page 64700 "LPMS Step Master List"
{
    PageType = List;
    SourceTable = "LPMS Step Master";
    ApplicationArea = All;
    Caption = 'Setp Master List';
    UsageCategory = Lists;

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
                field(Image; Rec.Image)
                {
                    ToolTip = 'Specifies the value of the Image field.';
                }
            }
        }
    }
}