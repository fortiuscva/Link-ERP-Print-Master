pageextension 64701 "LPMS Sales" extends "Sales Order Subform"
{
    actions
    {
        addlast(Processing)
        {
            action("LPMS Subway Steps")
            {
                ApplicationArea = All;
                Caption = 'Subway Steps';
                Image = Stages;
                ToolTip = 'Executes the Subway Steps action.';

                trigger OnAction()
                var
                    SalesSubway: Record "LPMS Sales Subway";
                begin
                    SalesSubway.SetRange("Sales Document No.", Rec."Document No.");
                    SalesSubway.SetRange("Sales Line No.", Rec."Line No.");
                    Page.Run(Page::"LPMS Sales Subway List", SalesSubway);
                end;
            }
        }
    }
}