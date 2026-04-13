pageextension 64700 "LPMS Item Card" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("LPMS Subway Code"; Rec."LPMS Subway Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Subway Code field.';
            }
        }
    }
}