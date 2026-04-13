codeunit 64700 "LPMS Subway Management"
{
    procedure CreateSalesSubway(SalesLine: Record "Sales Line")
    var
        Item: Record Item;
        SubwayLine: Record "LPMS Subway Line";
        Step: Record "LPMS Step Master";
        SalesSubway: Record "LPMS Sales Subway";
    begin
        if not Item.Get(SalesLine."No.") then
            exit;

        if Item."LPMS Subway Code" = '' then
            exit;

        SalesSubway.Reset();
        SalesSubway.SetRange("Sales Document No.", SalesLine."Document No.");
        SalesSubway.SetRange("Sales Line No.", SalesLine."Line No.");
        if SalesSubway.FindFirst() then
            exit;

        SalesSubway.Reset();
        SubwayLine.SetRange("Subway Code", Item."LPMS Subway Code");
        if SubwayLine.FindSet() then
            repeat
                Step.Get(SubwayLine."Step No.");

                SalesSubway.Init();
                SalesSubway."Sales Document No." := SalesLine."Document No.";
                SalesSubway."Sales Line No." := SalesLine."Line No.";
                SalesSubway."Step No." := Step."Step No.";
                SalesSubway.Description := Step.Description;
                SalesSubway.Image := Step.Image;
                SalesSubway.Status := SalesSubway.Status::Pending;
                SalesSubway.Insert();
            until SubwayLine.Next() = 0;
    end;
}