unit KasiskiGUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TKasiskiGUIForm = class(TForm)
    StatisticMemo: TMemo;
    BackButton: TButton;
    StatisticButton: TButton;
    procedure BackButtonClick(Sender: TObject);
    procedure StatisticButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KasiskiGUIForm: TKasiskiGUIForm;

implementation

{$R *.dfm}

uses
   Kasiski, FileUnit, Results;


procedure getKasiskiStatistic;
var
   s : string;
   i : integer;
begin
   Kasiski.KasiskiMethod(FileUnit.loadTextFromFile(ENCIPHERED_TEXT_FILE_NAME), STATIC_KEY);
   i := 1;
   while Kasiski.statisticTable^.next <> nil do
   begin
      s := statisticTable^.trigram + '  ' + intToStr(statisticTable^.distance);
      KasiskiGUIForm.StatisticMemo.Lines[i] := s;
      inc(i);
   end;
end;


procedure TKasiskiGUIForm.BackButtonClick(Sender: TObject);
begin
   self.Visible := false;
   self.StatisticMemo.Clear;
end;

procedure TKasiskiGUIForm.StatisticButtonClick(Sender: TObject);
begin
   getKasiskiStatistic;
end;

end.
