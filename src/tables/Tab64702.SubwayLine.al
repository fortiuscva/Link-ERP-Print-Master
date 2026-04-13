table 64702 "LPMS Subway Line"
{
    DataClassification = CustomerContent;
    Caption = 'Subway Line';

    fields
    {
        field(1; "Subway Code"; Code[20])
        {
            Caption = 'Subway Code';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Step No."; Code[20])
        {
            Caption = 'Step No.';
            TableRelation = "LPMS Step Master";
            trigger OnValidate()
            begin
                CalcFields("Step Description");
            end;
        }
        field(4; Sequence; Integer)
        {
            Caption = 'Sequence';
        }
        field(5; "Step Description"; Text[250])
        {
            Caption = 'Step Description';
            FieldClass = FlowField;
            CalcFormula = lookup("LPMS Step Master".Description where("Step No." = field("Step No.")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Subway Code", "Line No.")
        {
            Clustered = true;
        }
    }
}