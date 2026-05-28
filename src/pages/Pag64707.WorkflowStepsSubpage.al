page 64707 "LPMS Workflow Steps Subpage"
{
    PageType = ListPart;
    SourceTable = "LPMS Sales Subway";
    ApplicationArea = All;
    Editable = false;
    Caption = 'Workflow Steps';

    layout
    {
        area(Content)
        {
            group(ProgressGroup)
            {
                ShowCaption = false;

                field(CurrentStepTxt; CurrentStepTxt)
                {
                    ApplicationArea = All;
                    Caption = 'Current Step';
                    Editable = false;
                    StyleExpr = CurrentStepStyle;

                }

                field(ProgressPercent; ProgressPercent)
                {
                    ApplicationArea = All;
                    Caption = 'Progress %';
                    Editable = false;
                }
            }

            repeater(Group)
            {
                field(StatusIcon; StatusIcon)
                {
                    ApplicationArea = All;
                    Caption = '';
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field(Image; Rec.Image)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        StatusIcon: Text;
        StyleTxt: Text;

        CurrentStepTxt: Text[100];
        ProgressPercent: Decimal;
        ProgressStyle: Text;
        CurrentStepStyle: Text;


    trigger OnAfterGetRecord()
    begin
        SetStepStyle();
        BuildProgress();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetIntialValues();
        SetStepStyle();
        BuildProgress();
    end;

    local procedure SetStepStyle()
    begin
        case Rec.Status of
            Rec.Status::Completed:
                begin
                    StatusIcon := '✔';
                    StyleTxt := 'Favorable';
                end;

            Rec.Status::"In Progress":
                begin
                    StatusIcon := '⏳';
                    StyleTxt := 'Attention';
                end;

            Rec.Status::Pending:
                begin
                    StatusIcon := '⭕';
                    StyleTxt := 'Subordinate';
                end;
        end;
    end;

    local procedure BuildProgress()
    var
        SalesSubway: Record "LPMS Sales Subway";
        TotalSteps: Integer;
        CompletedSteps: Integer;
        StepText: Text;
    begin
        Clear(CurrentStepTxt);
        Clear(ProgressPercent);

        SalesSubway.Reset();
        SalesSubway.SetRange("Sales Document No.", Rec."Sales Document No.");
        SalesSubway.SetRange("Sales Line No.", Rec."Sales Line No.");
        if not SalesSubway.FindSet() then begin
            Clear(CurrentStepTxt);
            Clear(ProgressPercent);
            exit;
        end;

        repeat
            TotalSteps += 1;

            case SalesSubway.Status of

                SalesSubway.Status::Completed:
                    begin
                        CompletedSteps += 1;
                    end;

                SalesSubway.Status::"In Progress":
                    begin
                        CurrentStepTxt := SalesSubway.Description;

                        ProgressStyle := 'Attention';
                        CurrentStepStyle := 'Attention';
                    end;
            end;

        until SalesSubway.Next() = 0;

        if TotalSteps > 0 then
            ProgressPercent :=
                Round((CompletedSteps / TotalSteps) * 100, 1);

        if ProgressPercent = 100 then begin
            ProgressStyle := 'Favorable';
            CurrentStepStyle := 'Favorable';
        end;
    end;

    procedure SetIntialValues()
    begin
        Clear(CurrentStepTxt);
        Clear(ProgressPercent);
        if Rec.IsEmpty then
            exit;
        CurrPage.Update(false);
    end;
}