page 64702 "LPMS Subway Lines"
{
    PageType = ListPart;
    SourceTable = "LPMS Subway Line";
    ApplicationArea = All;
    AutoSplitKey = true;
    DelayedInsert = true;

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
                field("Step Description"; Rec."Step Description")
                {
                    ToolTip = 'Specifies the value of the Step Description field.';
                }
                field(Sequence; Rec.Sequence)
                {
                    ToolTip = 'Specifies the value of the Sequence field.';
                }
            }
        }
    }
}