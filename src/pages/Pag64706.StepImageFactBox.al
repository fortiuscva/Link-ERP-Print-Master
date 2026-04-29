page 64706 "LPMS Step Image FactBox"
{
    PageType = CardPart;
    SourceTable = "LPMS Step Master";
    ApplicationArea = All;
    Caption = 'Step Image';

    layout
    {
        area(Content)
        {
            group(ImageGroup)
            {
                field(Image; Rec.Image)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportImage)
            {
                Caption = 'Import Image';
                Image = Import;

                trigger OnAction()
                begin
                    ImportFile();
                end;
            }

            action(ExportImage)
            {
                Caption = 'Export Image';
                Image = Export;

                trigger OnAction()
                begin
                    ExportFile();
                end;
            }

            action(DeleteImage)
            {
                Caption = 'Delete Image';
                Image = Delete;

                trigger OnAction()
                begin
                    Clear(Rec.Image);
                    Rec.Modify(true);
                end;
            }
        }
    }
    procedure ImportFile()
    var
        InStream: InStream;
        FileName: Text;
    begin
        UploadIntoStream('Select Image', '', 'All Files (*.*)|*.*', FileName, InStream);
        Rec.Image.ImportStream(InStream, FileName);
        Rec.Modify(true);
    end;

    procedure ExportFile()
    var
        TenantMedia: Record "Tenant Media";
        MediaId: Guid;
        InStream: InStream;
        FileName: Text;
    begin
        if Rec.Image.Count = 0 then
            exit;

        // Get first media ID
        MediaId := Rec.Image.Item(1);

        if TenantMedia.Get(MediaId) then begin
            TenantMedia.CalcFields(Content);
            TenantMedia.Content.CreateInStream(InStream);

            FileName := Rec."Step No." + '.jpg';
            DownloadFromStream(InStream, '', '', '', FileName);
        end;
    end;
}