// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://smsadmin.ir/webservice/soap/xml.php?wsdl
// Encoding : UTF-8
// Version  : 1.0
// (3/4/2025 3:45:46 PM - 1.33.2.5)
// ************************************************************************ //

unit SMSClass;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://tempuri.org/"



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/XmsRequest
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : SmsSoap
  // service   : Sms
  // port      : SmsSoap
  // URL       : http://sms.mida-co.ir/webservice/soap/xml.php
  // ************************************************************************ //
  SmsSoap = interface(IInvokable)
  ['{0097CF23-A12E-8768-FCDD-17E938508969}']
    function  XmsRequest(const requestData: WideString): WideString; stdcall;
  end;

function GetSmsSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): SmsSoap;


implementation

function GetSmsSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): SmsSoap;
const
  defWSDL = 'http://smsadmin.ir/webservice/soap/xml.php?wsdl';
  defURL  = 'http://sms.mida-co.ir/webservice/soap/xml.php';
  defSvc  = 'Sms';
  defPrt  = 'SmsSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as SmsSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(SmsSoap), 'http://tempuri.org/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SmsSoap), 'http://tempuri.org/XmsRequest');

end.
