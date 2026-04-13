table 64703 "LPMS Sales Subway"
{
    DataClassification = CustomerContent;
    Caption = 'Sales Subway';

    fields
    {
        field(1; "Sales Document No."; Code[20])
        { }
        field(2; "Sales Line No."; Integer)
        { }
        field(3; "Step No."; Code[20])
        { }
        field(4; Description; Text[100])
        { }
        field(5; Image; MediaSet)
        { }
        field(6; Status; Enum "LPMS Sales Subway Status")
        { }
    }

    keys
    {
        key(PK; "Sales Document No.", "Sales Line No.", "Step No.")
        {
            Clustered = true;
        }
    }
}