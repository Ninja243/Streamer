unit Admin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBconnector, Grids, DBGrids, ComCtrls, StdCtrls, pngimage, ExtCtrls,
  ShellApi, DBCtrls; // , ;

type
  TDBEditor = class(TForm)
    Tabzz: TPageControl;
    Login: TTabSheet;
    DBTab: TTabSheet;
    UsernameField: TEdit;
    PasswordField: TEdit;
    UsernameLabel: TLabel;
    PasswordLabel: TLabel;
    StreamerLogo: TImage;
    StreamerHeader: TPanel;
    CloseButton: TPanel;
    LogInButton: TPanel;
    DBGrid1: TDBGrid;
    UsersDBButton: TPanel;
    MoviesDBButton: TPanel;
    DeleteButton: TPanel;
    Navigator: TDBNavigator;
    CloseButton2: TPanel;
    RefreshButton: TPanel;
    AdminsBox: TCheckBox;
    StatsButton: TPanel;
    GenreBox: TComboBox;
    AddMoviePanel: TPanel;
    procedure PrintDebug(dmsg: string; dtype: string);
    procedure FormCreate(Sender: TObject);
    procedure StreamerLogoClick(Sender: TObject);
    procedure LogInButtonMouseEnter(Sender: TObject);
    procedure LogInButtonMouseLeave(Sender: TObject);
    // procedure LogInButtonMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure CloseButtonClick(Sender: TObject);
    procedure LogInButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UsersDBButtonClick(Sender: TObject);
    procedure MoviesDBButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AdminsBoxClick(Sender: TObject);
    procedure StatsButtonClick(Sender: TObject);
    procedure GenreBoxChange(Sender: TObject);
    procedure AddMoviePanelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DBEditor: TDBEditor;
  LoggedIn: integer;
  Isadmin: integer;
  Password: string;
  username: string;

implementation

{$R *.dfm}

uses
  Source;

procedure TDBEditor.AddMoviePanelClick(Sender: TObject);
var
  title: string;
  Length: string;
  thumbnail: string;
  ods: string;
  OnDisk: boolean;
  trailerUrl: string;
begin
  title := inputbox('Add Movie', 'What is the title of the movie?', '');
  Length := inputbox('Add Movie', 'What is the Length of the movie?', '3');
  thumbnail := inputbox('Add Movie', 'What is the path to the thumbnail?', '');
  ods := inputbox('Add Movie', 'Is this movie on this PC?', 'No');
  trailerUrl := inputbox('Add Movie',
    'What is the URL to the trailer of this movie?', '');
  if Uppercase(ods) = 'YES' then
  begin
    OnDisk := true;
    if (Uppercase(trailerUrl[1]) = 'H') and (Uppercase(trailerUrl[2]) = 'T')
      and (Uppercase(trailerUrl[3]) = 'T') and
      (Uppercase(trailerUrl[4]) = 'P') then
    begin
      DBconnector.DataModule1.AddMovie(title, Length, thumbnail, OnDisk,
        trailerUrl);
    end
    else
    begin
      messagedlg('Check your input', mterror, [mbok], 0);
    end;
  end;
  if Uppercase(ods) = 'NO' then
  begin
    OnDisk := false;
    if (Uppercase(trailerUrl[1]) = 'H') and (Uppercase(trailerUrl[2]) = 'T')
      and (Uppercase(trailerUrl[3]) = 'T') and
      (Uppercase(trailerUrl[4]) = 'P') then
    begin
      DBconnector.DataModule1.AddMovie(title, Length, thumbnail, OnDisk,
        trailerUrl);
    end
    else
    begin
      messagedlg('Check your input', mterror, [mbok], 0);
    end;
  end;
end;

procedure TDBEditor.AdminsBoxClick(Sender: TObject);
begin
  if AdminsBox.Checked = true then
  begin
    DBconnector.DataModule1.UsersTB.Filtered := false;
    DBconnector.DataModule1.UsersTB.Filter := ('Admin = ''true''');
    DBconnector.DataModule1.UsersTB.Filtered := true;
    DBGrid1.Refresh;
  end;
  if AdminsBox.Checked = false then
  begin
    DBconnector.DataModule1.UsersTB.Filtered := false;
    DBGrid1.Refresh;
  end;
end;

procedure TDBEditor.CloseButtonClick(Sender: TObject);
begin
  DBEditor.Hide;
  // application.Terminate;
end;

procedure TDBEditor.DeleteButtonClick(Sender: TObject);
begin
  DBconnector.DataModule1.TitleTB.Delete;
end;

procedure TDBEditor.FormActivate(Sender: TObject);
begin
  begin
    if (LoggedIn = 1) and (Isadmin = 1) then
    begin
      Login.Enabled := false;
      Login.TabVisible := false;
      DBTab.Enabled := true;
      DBTab.TabVisible := true;
    end
    else
    begin
      Login.Enabled := true;
      Login.TabVisible := true;
      DBTab.Enabled := false;
      DBTab.TabVisible := false;
    end;
  end;
end;

procedure TDBEditor.FormCreate(Sender: TObject);
begin
  PrintDebug('Building admin form...', 'info');
  // StreamerLogo.Visible := true;
  // StreamerLogo.Enabled := true;
  // StreamerLogo.BringToFront;
  // LoginTab.SendToBack;
  PrintDebug('Setting logo', 'nested gui');
  DBTab.Visible := false;
  DBTab.TabVisible := false;
  DBTab.Enabled := false;
  PrintDebug('Hiding DB Editor', 'nested gui');
  LoggedIn := 0;
  PrintDebug('Making sure a login is forced', 'nested gui');
  Isadmin := 0;
  PrintDebug('Resetting user privilages', 'nested gui');
end;

procedure TDBEditor.GenreBoxChange(Sender: TObject);
begin
  DBconnector.DataModule1.TitleTB.Filter :=
    'SELECT * FROM Titles WHERE GenreID = ' + inttostr(GenreBox.ItemIndex + 1);
  showmessage(inttostr(GenreBox.ItemIndex + 1));
  DBconnector.DataModule1.TitleTB.Filtered := true;
  DBGrid1.Refresh;
end;

procedure TDBEditor.LogInButtonClick(Sender: TObject);
begin
  {
    /// ////////////////////////////////////
    /// Methods taken from StackExchange///
    /// ////////////////////////////////////
    if LoggedIn = 1 then
    begin
    DBTab.TabVisible := true;
    DBTab.Visible := true;
    DBTab.Enabled := true;
    PrintDebug('Admin logged into DB Editor', 'info');
    end
    else
    begin
    DBTab.TabVisible := false;
    DBTab.Visible := false;
    DBTab.Enabled := false;
    messagedlg('Check your login details!', mterror, [mbok], 0);
    PrintDebug('Error authenticating user', 'warn');
    end; }
  // password := source.password;
  // username := source.username;
  Password := PasswordField.Text;
  username := UsernameField.Text;
  Source.Password := Password;
  Source.username := username;
  Source.Background.SubmitLogin;
end;

procedure TDBEditor.LogInButtonMouseEnter(Sender: TObject);
begin
  LogInButton.Color := $00000000;
end;

procedure TDBEditor.LogInButtonMouseLeave(Sender: TObject);
begin
  LogInButton.Color := $00353535;
end;

procedure TDBEditor.MoviesDBButtonClick(Sender: TObject);
begin
  DBGrid1.DataSource := DBconnector.DataModule1.TitleDS;
  DBGrid1.Refresh;
  Navigator.DataSource := DBconnector.DataModule1.TitleDS;
end;

procedure TDBEditor.RefreshButtonClick(Sender: TObject);
begin
  DBGrid1.Refresh;
end;

procedure TDBEditor.PrintDebug(dmsg: string; dtype: string);
begin
  DBconnector.DataModule1.PrintConsole(dmsg, dtype);
end;

procedure TDBEditor.StatsButtonClick(Sender: TObject);
var
  UsersNum: integer;
  MoviesNum: integer;
begin
  UsersNum := DBconnector.DataModule1.UsersTB.RecordCount;
  MoviesNum := DBconnector.DataModule1.TitleTB.RecordCount;
  messagedlg('Users registered: ' + inttostr(UsersNum)
      + #13#10 + 'Movies in DB: ' + inttostr(MoviesNum), mtcustom, [mbok], 0);
end;

procedure TDBEditor.StreamerLogoClick(Sender: TObject);
begin
  ShellExecute(0, 'open', Pchar('https://mweya.ddns.net/'), 0, 0, SW_SHOW);
  PrintDebug('Taking user to my site...', 'info');
end;

procedure TDBEditor.UsersDBButtonClick(Sender: TObject);
begin
  DBGrid1.DataSource := DBconnector.DataModule1.UsersDS;
  DBGrid1.Refresh;
  Navigator.DataSource := DBconnector.DataModule1.UsersDS;
  if AdminsBox.Checked = true then
  begin
    // Filter by admins
    DBconnector.DataModule1.UsersTB.Filter := 'SELECT * WHERE Admins = yes';
    DBconnector.DataModule1.UsersTB.Filtered := true;
  end;

end;

end.
