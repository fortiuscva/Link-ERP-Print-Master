page 64704 "LPMS Subway Master List"
{
    Caption = 'Subway Master List';
    Editable = false;
    PageType = List;
    SourceTable = "LPMS Subway Header";
    UsageCategory = Lists;
    CardPageId = "LPMS Subway Master";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Subway Code"; Rec."Subway Code")
                {
                    ToolTip = 'Specifies the value of the Subway Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
