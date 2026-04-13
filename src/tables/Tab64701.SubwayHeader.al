table 64701 "LPMS Subway Header"
{
    DataClassification = CustomerContent;
    Caption = 'Subway Header';
    LookupPageId = "LPMS Subway Master List";
    DrillDownPageId = "LPMS Subway Master List";

    fields
    {
        field(1; "Subway Code"; Code[20])
        {
            Caption = 'Subway Code';
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK; "Subway Code")
        {
            Clustered = true;
        }
    }
}