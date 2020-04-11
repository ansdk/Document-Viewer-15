controladdin ShowDocument
{
    MaximumHeight = 500;
    RequestedHeight = 500;
    MinimumHeight = 500;
    MaximumWidth = 600;
    RequestedWidth = 300;
    MinimumWidth = 300;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 'JsScripts/Code.js';
    StyleSheets = 'StyleSheets/StyleSheet.css';
    StartupScript = 'JsScripts/Start.js';
    Images = './Images/NoDocument.png';

    event Ready();
    event DocumentClicked();
    procedure embedDocument(inDocument: Text);
}