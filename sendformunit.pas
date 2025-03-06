unit sendformunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Lalert: TLabel;
    Editmessage: TEdit;
    lmessage: TLabel;
    Label1: TLabel;
    Emobile: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EmobileKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses SMSCLass;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  SmsService: SmsSoap; // ������� �� �������� SmsSoap �� ���� xml.pas
  RequestData: WideString;
  Result: WideString;
  MessageBody: WideString;
  MobileNumber: WideString;
  error:Boolean;
begin


   MessageBody := editmessage.Text;
   MobileNumber := emobile.Text;
   error:=false;

   if Length(emobile.Text) <> 11 then
    begin
    // ����� ����� ��� � �ǘ ���� ���
    ShowMessage('The number of digits entered is less than 11!!');
    emobile.Text := '';
    emobile.SetFocus; // ��Ґ������ ���� �� �����
    error:=true;
    end;

    if Trim(editmessage.Text) = '' then
  begin
    ShowMessage('error! Message is Empty! ');
    editmessage.SetFocus; // ��Ґ������ ���� �� �����
    error:=true;
  end;



    if (error=false) then
     begin
    try
    Lalert.Visible:=true;
    Form1.Refresh;

    // ����� ����� ����� �� ������� �� ���� GetSmsSoap
    SmsService := GetSmsSoap(True); // ������� True ���� ������� �� WSDL

    // ���� XML ������� (����� ����� PHP)
    RequestData :=
      '<xmsrequest>' +
        '<userid>youerserid</userid>' +
        '<password>yourpassword</password>' + // ������� �� ��� �����
        '<action>smssend</action>' +
        '<body>' +
          '<type>oto</type>' +
           '<recipient mobile="' + MobileNumber + '" originator="50002010021"><![CDATA[' + MessageBody + ']]></recipient>' +
        '</body>' +
      '</xmsrequest>';

    // �������� ��� XmsRequest � ������ �����
    Result := SmsService.XmsRequest(RequestData);
    Lalert.Visible:=false;
     Form1.Refresh;
    ShowMessage('����� �����: ' + Result);

  except
    on E: Exception do
      ShowMessage('���: ' + E.Message);
  end;
  end;//endif
end;

procedure TForm1.FormShow(Sender: TObject);
begin
Lalert.Visible:=false;
end;

procedure TForm1.EmobileKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8]) then // #8 ���� ����� ���� �� Backspace
  begin
    Key := #0; // ������ �� ���� ���ǘ�� �������
  end;
end;

end.
