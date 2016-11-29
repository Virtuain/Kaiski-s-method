unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

const
   ENGLISH_ALPHABET_SHIFT = 65;
   RUSSIAN_ALPHABET_SHIFT = 128;

type
  TLanguageForm = class(TForm)
    EnglishBtn: TRadioButton;
    RussianBtn: TRadioButton;
    LanguageCheckLbl: TLabel;
    CloseBtn: TButton;
    Nextbtn: TButton;
    procedure RussianBtnClick(Sender: TObject);
    procedure EnglishBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure NextbtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    type
      TLanguage = (english, russian);
    var
      language : TLanguage;
      procedure SetLanguage(const languageIsEnglish : boolean);
  public
    function GetLanguage : TLanguage;
  end;

var
  LanguageForm: TLanguageForm;


implementation

{$R *.dfm}
Uses
  KeyCheck, Results;

procedure TLanguageForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TLanguageForm.EnglishBtnClick(Sender: TObject);
begin
  LanguageForm.LanguageCheckLbl.Caption := 'Choose your language';
  LanguageForm.CloseBtn.Caption := 'Close';
  LanguageForm.Nextbtn.Caption := 'Next';
  KeyCheck.KeyCheckForm.KeyCheckLbl.Caption := 'Choose a key';
  KeyCheck.KeyCheckForm.InorderRBtn.Caption := 'Inorder';
  KeyCheck.KeyCheckForm.ProgressiveRBtn.Caption := 'Progressive';
  KeyCheck.KeyCheckForm.SelfGeneratedRBtn.Caption := 'Self-generated';
  KeyCheck.KeyCheckForm.CancelBtn.Caption := 'Cancel';
  KeyCheck.KeyCheckForm.NextBtn.Caption := 'Cipher';
  KeyCheck.KeyCheckForm.CloseBtn.Caption := 'Close';
  Results.ResultsForm.EncipheredLbl.Caption := 'Enciphered text';
  Results.ResultsForm.DecipheredLbl.Caption := 'Deciphered text';
  Results.ResultsForm.EncipherButton.Caption := 'Encipher';
  Results.ResultsForm.DecipherButton.Caption := 'Decipher';
  Results.ResultsForm.ClearButton.Caption := 'Clear';
    Results.ResultsForm.KasiskiButton.Caption := 'Kasiski';
  Results.ResultsForm.BackButton.Caption := 'Back';
  Results.ResultsForm.CloseButton.Caption := 'Close';
  language := english;
end;

procedure TLanguageForm.FormCreate(Sender: TObject);
begin
  language := english;
end;

procedure TLanguageForm.NextbtnClick(Sender: TObject);
begin
  LanguageForm.Visible := false;
  KeyCheck.KeyCheckForm.Visible := true;
end;

procedure TLanguageForm.RussianBtnClick(Sender: TObject);
begin
  LanguageCheckLbl.Caption := '�������� ����';
  LanguageForm.CloseBtn.Caption := '�������';
  LanguageForm.Nextbtn.Caption := '�����';
  KeyCheck.KeyCheckForm.KeyCheckLbl.Caption := '�������� ����';
  KeyCheck.KeyCheckForm.InorderRBtn.Caption := '������';
  KeyCheck.KeyCheckForm.ProgressiveRBtn.Caption := '�������������';
  KeyCheck.KeyCheckForm.SelfGeneratedRBtn.Caption := '���������-��';
  KeyCheck.KeyCheckForm.CancelBtn.Caption := '�����';
  KeyCheck.KeyCheckForm.NextBtn.Caption := '���������';
  KeyCheck.KeyCheckForm.CloseBtn.Caption := '�������';
  Results.ResultsForm.SourceLbl.Caption := '�������� �����';
  Results.ResultsForm.EncipheredLbl.Caption := '����������';
  Results.ResultsForm.DecipheredLbl.Caption := '�����������';
  Results.ResultsForm.EncipherButton.Caption := '���������';
  Results.ResultsForm.DecipherButton.Caption := '�����������';
  Results.ResultsForm.ClearButton.Caption := '��������';
  Results.ResultsForm.KasiskiButton.Caption := '�������';
  Results.ResultsForm.BackButton.Caption := '�����';
  Results.ResultsForm.CloseButton.Caption := '�������';
  language := russian;
end;

function TLanguageForm.GetLanguage : TLanguage;
begin
  Result := self.language;
end;

procedure TLanguageForm.SetLanguage(const languageIsEnglish : Boolean);
begin
  if languageIsEnglish then self.language := english
  else self.language := russian;
end;

end.
