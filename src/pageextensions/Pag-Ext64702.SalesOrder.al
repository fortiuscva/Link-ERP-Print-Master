pageextension 64702 "LPMS Sales Order" extends "Sales Order"
{
    layout
    {
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
