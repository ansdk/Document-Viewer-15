page 69001 "BAC Show Document Full"
{
    Caption = 'Document';
    PageType = Card;
    SourceTable = "Incoming Document";
    layout
    {
        area(Content)
        {
            usercontrol(ShowDocumentFull; ShowDocumentFull)
            {
                ApplicationArea = all;

                trigger Ready2()
                begin
                    Populatepage();
                    ComponentLoaded := true;
                end;
            }
        }
    }

    var
        ComponentLoaded: Boolean;

    Procedure Populatepage()
    var
        Base64Txt: Text;
        IncomDocAttach: Record "Incoming Document Attachment";
        Convert: Codeunit "Base64 Convert";
        InStr: InStream;

    begin
        if not ComponentLoaded then
            exit;
        IncomDocAttach.SetRange("Incoming Document Entry No.", "Entry No.");
        if IncomDocAttach.FindFirst() then begin
            IncomDocAttach.CalcFields(Content);
            IncomDocAttach.Content.CreateInStream(InStr);
            Base64Txt := Convert.ToBase64(InStr);
            case IncomDocAttach."File Extension" of
                'pdf':
                    CurrPage.ShowDocumentFull.embedDocument2('data:application/pdf;base64,' + Base64Txt);
                'jpg':
                    CurrPage.ShowDocumentFull.embedDocument2('data:image/jpg;base64,' + Base64Txt);
                'png':
                    CurrPage.ShowDocumentFull.embedDocument2('data:image/png;base64,' + Base64Txt);
                'gif':
                    CurrPage.ShowDocumentFull.embedDocument2('data:image/gif;base64,' + Base64Txt);
            end;
        end else begin
            CurrPage.ShowDocumentFull.embedDocument2('');
        end;
    end;
}