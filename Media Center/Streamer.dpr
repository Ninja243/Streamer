program Streamer;

uses
  Forms,
  Source in 'Source.pas' {Background},
  DBConnector in 'DBConnector.pas' {DataModule1: TDataModule},
  Admin in 'Admin.pas' {DBEditor},
  Threads in 'Threads.pas';

{$E exe}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Streamer';
  Application.CreateForm(TBackground, Background);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TDBEditor, DBEditor);
  Application.Run;
end.
