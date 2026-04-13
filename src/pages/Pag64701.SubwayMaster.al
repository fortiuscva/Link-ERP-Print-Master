page 64701 "LPMS Subway Master"
{
    PageType = Document;
    SourceTable = "LPMS Subway Header";
    ApplicationArea = All;
    Caption = 'Subway Master';

    layout
    {
        area(Content)
        {
            group(General)
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

            part(Lines; "LPMS Subway Lines")
            {
                Caption = 'Subway Lines';
                SubPageLink = "Subway Code" = field("Subway Code");
            }
        }
    }
}