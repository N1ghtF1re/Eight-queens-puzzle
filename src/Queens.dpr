program Queens;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  N=8;

type
  TCol = array [1..N] of boolean;
  TMainDiag = array [2..N*2] of boolean;
  TSecDiag = array[1-N..N-1] of boolean;
  TQueensArr = array[1..N] of Integer;

var
  Col: TCol; // ������ ��������
  MD:TMainDiag; // ������ "�������" ����������
  SD: TSecDiag; // ������ "��������" ����������
  Queen: TQueensArr;   // ������ ��������� �����
  Num:Byte;

// ��������� ������� �� ��������� ���� � ������������� ������� �� �����
procedure print(QA: TQueensArr);
var
   i,j:integer;
begin
  Writeln('Number ', Num);
  for i:=1 to N do
  begin
    for j := 1 to N do
    begin
      if (Queen[i] = j) then
        write('Q')
      else
        write('.');
    end;
    writeln;
  end;
  writeln;
  Inc(num);
end;

// ��������� ������ ����� �� ����������� [i,j] � ������ false � ���� ��������� �����
procedure setQueen(i,j:integer);
begin
  Queen[i] := j;
  Col[j]:=false;
  MD[i+j]:=false;
  SD[i-j]:=false;
end;

// ��������� ������� ����� �� ����������� [i,j]
procedure RemoveQueen(i,j:integer);
begin
  Col[j]:=true;
  MD[i+j]:=true;
  SD[i-j]:=true;
end;

// ����������� �������� "�������" ������� ����� � ��������� �� ���� ��������� �����
procedure tryQueen(i:integer);
var
    j:integer;
begin
  for j:=1 to N do  // i - ������, j - �������
    if Col[j] and MD[i+j] and SD[i-j] then
      begin
        setQueen(i,j);
        if i<N then
          tryQueen(i+1)  // ���� ��� �� �������� 8-�� ������, �� �������� ����������
        else
          print(Queen);
        RemoveQueen(i,j);
      end;
end;

// ��������� �������� �������
procedure cleanArrays;
var
  i:integer;
begin
  for i:=1 to N do
    Col[i]:=true;
  for i:=2 to N*2 do
    MD[i]:=true;
  for i:= (1-N) to (N-1) do
    SD[i]:=true;
end;

begin
  Num := 1;
  cleanArrays;
  tryQueen(1);
  Readln;
end.

