codeunit 64701 "LPMS Event Subscribers"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterInsertSalesLine(var Rec: Record "Sales Line")
    var
        SubwayMgt: Codeunit "LPMS Subway Management";
    begin
        if Rec.Type <> Rec.Type::Item then
            exit;

        if Rec."No." = '' then
            exit;

        SubwayMgt.CreateSalesSubway(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterDeleteEvent, '', false, false)]
    local procedure OnAfterDeleteEvent(var Rec: Record "Sales Line"; RunTrigger: Boolean)
    var
        SalesSubway: Record "LPMS Sales Subway";
    begin
        SalesSubway.Reset();
        SalesSubway.SetRange("Sales Document No.", Rec."Document No.");
        SalesSubway.SetRange("Sales Line No.", Rec."Line No.");
        SalesSubway.DeleteAll();
    end;
}