program SendSMSwithDelphi;

uses
  Forms,
  sendformunit in 'sendformunit.pas' {Form1},
  SMSCLass in 'SMSCLass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
