page 64705 "LPMS Sales Subway Factbox"
{
    PageType = ListPart;
    SourceTable = "LPMS Sales Subway";
    ApplicationArea = All;
    Caption = 'Subway Steps';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Step No."; Rec."Step No.")
                { }

                field(Description; Rec.Description) { }

                field(StatusIcon; Rec.Status)
                {
                    Caption = 'Status';
                    StyleExpr = StepStyle;
                    ToolTip = 'Step status';
                }
                field(StatusIconField; StatusIcon)
                {
                    Caption = 'Status';
                    StyleExpr = StepStyle;
                }
                field(ProgressBar; ProgressBarVisual)
                {
                    Caption = 'Progress';
                    ToolTip = 'Step completion %';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        case Rec.Status of
            Rec.Status::Completed:
                StepStyle := 'Favorable';      // Green
            Rec.Status::"In Progress":
                StepStyle := 'Attention';   // Yellow
            Rec.Status::Pending:
                StepStyle := 'Standard';         // Grey
        end;

        case Rec.Status of
            Rec.Status::Completed:
                StepProgress := 100;
            Rec.Status::"In Progress":
                StepProgress := 50;
            Rec.Status::Pending:
                StepProgress := 0;
        end;

        case Rec.Status of
            Rec.Status::Completed:
                StatusIcon := '✔';
            Rec.Status::"In Progress":
                StatusIcon := '⏳';
            Rec.Status::Pending:
                StatusIcon := '⭕';
        end;

        ProgressBarVisual := GetProgressBar(StepProgress, 10);
    end;

    local procedure GetProgressBar(Percent: Integer; BarLength: Integer): Text
    var
        i: Integer;
        Bar: Text;
        FilledBlocks: Integer;
    begin
        FilledBlocks := (Percent * BarLength) / 100;

        Bar := '';
        for i := 1 to FilledBlocks do
            Bar += '█';

        // Add empty blocks
        for i := FilledBlocks + 1 to BarLength do
            Bar += '░';

        exit(Bar);
    end;

    var
        StatusIcon: Text[5];          // For ✔ ⏳ ⭕ icons
        StepStyle: Text;              // Color style for icon
        ProgressBarVisual: Text[25];  // Text-based progress bar
        StepProgress: Integer;        // 0-100
}