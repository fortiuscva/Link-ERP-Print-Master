pageextension 64702 "LPMS Sales Order" extends "Sales Order"
{

    layout
    {
        addafter(General)
        {
            group("LPMS Workflow Progress")
            {
                Caption = 'Workflow Progress';
                part(Steps; "LPMS Workflow Steps Subpage")
                {
                    ApplicationArea = All;
                    Provider = SalesLines;
                    UpdatePropagation = Both;
                    SubPageLink =
                        "Sales Document No." = FIELD("Document No."),
                        "Sales Line No." = FIELD("Line No.");
                }
            }
        }

        addlast(FactBoxes)
        {
            part(SubwaySteps; "LPMS Sales Subway FactBox")
            {
                ApplicationArea = All;
                Provider = SalesLines;
                SubPageLink = "Sales Document No." = FIELD("Document No."), "Sales Line No." = FIELD("Line No.");
            }
        }
    }
}