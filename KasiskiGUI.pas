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

procedure saveStatToFile(statisticTable : PTStatisticTable); forward;

function Evklid(num1, num2 : integer) : integer;
begin
  while (num1 <> num2) do
    if num1 > num2 then
      num1 := num1 - num2
    else
      num2 := num2 - num1;
  Result := num1;
end;

function getGCD(const num : integer) : integer;
var
  res, i : integer;
begin
   for i := 1 to 20 do
      if num mod i = 0 then
        res := i;
   Result := res;
end;


procedure getKasiskiStatistic;
var
   s : string;
   i : integer;
   T : Text;
begin
   Kasiski.KasiskiMethod(FileUnit.loadTextFromFile('enciphered.txt'), STATIC_KEY);
   saveStatToFile(statisticTable);
   i := 1;
   Assign(T, 'kasiski.txt');
   Reset(T);
   while Kasiski.statisticTable^.next <> nil do
   begin
      readln(T, s);
      statisticTable := statisticTable^.next;
      KasiskiGUIForm.StatisticMemo.Lines.Add(s);
      inc(i);
   end;
end;

procedure saveStatToFile(statisticTable : PTStatisticTable);
var
  T : Text;
  pnt : PTStatisticTable;
begin
  Assign(T, 'kasiski.txt');
  Rewrite(T);
  writeln(T, '���������   ������   ����������   ���');
  pnt := statisticTable;
  while statisticTable^.next <> nil do
  begin
    statisticTable := statisticTable^.next;
    writeln(T, '    ', statisticTable^.trigram, '    ', statisticTable^.left:5, '      ', statisticTable^.distance:5, '        ', intToStr(getGCD(statisticTable^.distance)));
  end;
  writeln(T, '��� = ', Kasiski.getGreatCommonDivisior(pnt));
  closeFile(T);
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
