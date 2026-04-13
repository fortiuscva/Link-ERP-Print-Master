tableextension 64700 "LPMS Item" extends Item
{
    fields
    {
        field(50100; "LPMS Subway Code"; Code[20])
        {
            Caption = 'Subway Code';
            TableRelation = "LPMS Subway Header";
        }
    }
}