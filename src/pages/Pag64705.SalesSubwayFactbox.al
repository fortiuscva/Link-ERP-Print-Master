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
                }
                field(Image; Rec.Image)
                {
                    Caption = 'Image';
                    Width = 12;
                    ShowCaption = false;

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
        Rec.CalcFields(Image);
        case Rec.Status of
            Rec.Status::Completed:
                begin
                    StepStyle := 'Favorable';
                    StepProgress := 100;
                    StatusIcon := '✔';
                end;   // Green
            Rec.Status::"In Progress":
                begin
                    StepStyle := 'Attention';
                    StepProgress := 50;
                    StatusIcon := '⏳';
                end;   // Yellow
            Rec.Status::Pending:
                begin
                    StepStyle := 'Standard';
                    StepProgress := 0;
                    StatusIcon := '⭕';
                end;         // Grey
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

    trigger OnAfterGetCurrRecord()
    begin
        LoadStepImage();
    end;

    var
        StatusIcon: Text[5];          // For ✔ ⏳ ⭕ icons
        StepStyle: Text;              // Color style for icon
        ProgressBarVisual: Text[25];  // Text-based progress bar
        StepProgress: Integer;        // 0-100
        StepMaster: Record "LPMS Step Master";
    //StepImage: MediaSet;

    local procedure LoadStepImage()
    begin
        //Clear(StepImage);

        if Rec."Step No." = '' then
            exit;

        if StepMaster.Get(Rec."Step No.") then;

    end;
}