table 64700 "LPMS Step Master"
{
    DataClassification = CustomerContent;
    LookupPageId = "LPMS Step Master List";
    DrillDownPageId = "LPMS Step Master List";
    Caption = 'Step Master';

    fields
    {
        field(1; "Step No."; Code[20])
        {
            Caption = 'Step No.';
        }

        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }

        field(3; Image; MediaSet)
        {
            Caption = 'Image';
        }
    }

    keys
    {
        key(PK; "Step No.")
        {
            Clustered = true;
        }
    }
}