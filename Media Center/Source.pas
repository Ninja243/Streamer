/// /////////////////////////////////////////
/// Remember to clean unused variables, ///
/// methods and comments                ///
/// /////////////////////////////////////////
unit Source;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, shellapi, StdCtrls, Mask, strutils,
  shellanimations, MPlayer, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, Urlmon, DBconnector, Admin, OleCtrls, SHDocVw;

type
  TBackground = class(TForm)
    RightSidebar: TPanel;
    StreamerLogo: TImage;
    StreamerHeader: TPanel;
    ExitButton: TPanel;
    LoginButton: TPanel;
    HelpButton: TPanel;
    LoginPanel: TPanel;
    UsernameLabel: TPanel;
    PasswordLabel: TPanel;
    UsernameField: TEdit;
    PasswordField: TMaskEdit;
    LoginCancel: TPanel;
    SubmitLoginButton: TPanel;
    UserGreet: TPanel;
    ErrorPanel: TPanel;
    ErrorOkButton: TPanel;
    ErrorClose: TPanel;
    ErrorMessageBox: TPanel;
    VideoPlayerPanel: TPanel;
    VideoPlayer: TMediaPlayer;
    BrowseButton: TPanel;
    LogoutButton: TPanel;
    SettingsButton: TPanel;
    BrowsePanel: TPanel;
    MoveLeft: TPanel;
    MoveRight: TPanel;
    TitleBar: TPanel;
    ConfPanel: TPanel;
    ConfOK: TPanel;
    ConfClose: TPanel;
    ConfText: TPanel;
    ConfCancel: TPanel;
    SettingsPanel: TPanel;
    SettingsOK: TPanel;
    SettingsClose: TPanel;
    SettingsText: TPanel;
    RefreshButton: TPanel;
    SignUpPanel: TPanel;
    cUsernameLabel: TPanel;
    cPasswordLabel: TPanel;
    cUsernameField: TEdit;
    cPasswordField: TMaskEdit;
    SignUpCancel: TPanel;
    SubmitSignupButton: TPanel;
    LaunchAdminButton: TPanel;
    LikeButton: TPanel;
    DislikeButton: TPanel;
    WebBackground: TPanel;
    WebBrowser: TWebBrowser;
    LeftSidebar: TPanel;
    BackButton: TPanel;
    SidebarBranding: TPanel;
    DescriptionPanel: TPanel;
    DescriptionLabel: TLabel;
    RatingLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure StreamerLogoClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure StreamerHeaderClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure LoginButtonClick(Sender: TObject);
    procedure Login;
    procedure LoginButtonMouseEnter(Sender: TObject);
    procedure LoginButtonMouseLeave(Sender: TObject);
    procedure ExitButtonMouseEnter(Sender: TObject);
    procedure ExitButtonMouseLeave(Sender: TObject);
    procedure RefreshButtonMouseLeave(Sender: TObject);
    procedure RefreshButtonMouseEnter(Sender: TObject);
    procedure HelpButtonMouseEnter(Sender: TObject);
    procedure HelpButtonMouseLeave(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure LoginCancelClick(Sender: TObject);
    procedure LoginCancelMouseEnter(Sender: TObject);
    procedure LoginCancelMouseLeave(Sender: TObject);
    procedure SubmitLoginButtonMouseEnter(Sender: TObject);
    procedure SubmitLoginButtonMouseLeave(Sender: TObject);
    procedure SubmitLogin;
    procedure SubmitLoginButtonClick(Sender: TObject);
    function SetScreenResolution(Width, Height: integer): Longint;
    procedure ErrorOkButtonClick(Sender: TObject);
    procedure Error;
    procedure ErrorOkButtonMouseEnter(Sender: TObject);
    procedure ErrorOkButtonMouseLeave(Sender: TObject);
    procedure ErrorCloseMouseEnter(Sender: TObject);
    procedure ErrorCloseMouseLeave(Sender: TObject);
    function GetUser: string;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BrowseButtonMouseEnter(Sender: TObject);
    procedure BrowseButtonMouseLeave(Sender: TObject);
    procedure BrowseButtonClick(Sender: TObject);
    procedure LogoutButtonMouseEnter(Sender: TObject);
    procedure LogoutButtonMouseLeave(Sender: TObject);
    procedure LogoutButtonClick(Sender: TObject);
    function DownloadFile(SourceFile, DestFile: string): Boolean;
    procedure SettingsButtonMouseEnter(Sender: TObject);
    procedure SettingsButtonMouseLeave(Sender: TObject);
    procedure SettingsButtonClick(Sender: TObject);
    procedure BrowsePanelClick(Sender: TObject);
    procedure MoveLeftMouseEnter(Sender: TObject);
    procedure MoveLeftMouseLeave(Sender: TObject);
    procedure MoveRightMouseEnter(Sender: TObject);
    procedure MoveRightMouseLeave(Sender: TObject);
    procedure MoveLeftClick(Sender: TObject);
    procedure MoveRightClick(Sender: TObject);
    procedure TitleBarClick(Sender: TObject);
    procedure Confirm;
    procedure ConfOKClick(Sender: TObject);
    procedure ConfCloseClick(Sender: TObject);
    procedure ConfCancelClick(Sender: TObject);
    procedure ConfCancelMouseEnter(Sender: TObject);
    procedure ConfCancelMouseLeave(Sender: TObject);
    procedure ConfOKMouseEnter(Sender: TObject);
    procedure ConfOKMouseLeave(Sender: TObject);
    procedure ConfCloseMouseEnter(Sender: TObject);
    procedure ConfCloseMouseLeave(Sender: TObject);
    procedure PrintDebug(dmsg: string; dtype: string);
    procedure SettingsCloseClick(Sender: TObject);
    procedure SettingsOKClick(Sender: TObject);
    procedure CreateAccount;
    procedure SearchAccounts;
    procedure VideoPlayerPanelClick(Sender: TObject);
    procedure SignUpCancelMouseLeave(Sender: TObject);
    procedure SignUpCancelMouseEnter(Sender: TObject);
    procedure SignUpCancelClick(Sender: TObject);
    procedure SubmitSignupButtonMouseEnter(Sender: TObject);
    procedure SubmitSignupButtonMouseLeave(Sender: TObject);
    procedure SubmitSignupButtonClick(Sender: TObject);
    procedure LaunchAdminButtonMouseEnter(Sender: TObject);
    procedure LaunchAdminButtonMouseLeave(Sender: TObject);
    procedure LaunchAdminButtonClick(Sender: TObject);
    procedure Play(vpath: string);
    procedure DislikeButtonClick(Sender: TObject);
    procedure LikeButtonClick(Sender: TObject);
    procedure BrowseRefresh;
    procedure MoveDB;
    procedure BackButtonMouseEnter(Sender: TObject);
    procedure BackButtonMouseLeave(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
    procedure DescriptionPanelClick(Sender: TObject);
    procedure RefreshRating;
    procedure DescriptionLabelClick(Sender: TObject);

      private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PCuser: string;
  Path: string;
  Background: TBackground;
  SbarHidden: integer;
  LoggedIn: integer;
  username: string;
  password: string;
  scrwidth: integer;
  scrheight: integer;
  Emessage: string;
  LoginPacket: string;
  DBRefreshed: integer;
  testwidth: integer;
  testheight: integer;
  SourceFile: string;
  DestFile: string;
  Cmessage: string;
  Chack: integer;
  DevMode: integer;
  vpath: string;
  dbpos: integer;
  azhelpfile: textfile;
  azNewHelpFile: textfile;
  filetext: string;
  TrailerUrl: string;
  Mrating: integer;

implementation

{$R *.dfm}

procedure TBackground.Play(vpath: string);
begin
  VideoPlayerPanel.BringToFront;
  VideoPlayer.TrackPosition[0];
  VideoPlayer.BringToFront;
  VideoPlayer.Play;
end;

procedure TBackground.BrowseRefresh;
var
  SQL: string;
begin
  // SQL :=   'SELECT * FROM Title';

  // DBConnector.DataModule1.TitleTB.Filter := 'Select * in Title';
  // DBconnector.DataModule1.TitleTB.Filtered := true;
  // DBconnector.DataModule1.ADOQuery1.Filter := SQL;
  // DBconnector.DataModule1.ADOQuery1.Filtered := true;
  // TitleBar.Caption := DBconnector.DataModule1.ADOQuery1.ToString;
  TitleBar.Caption := '';
  TitleBar.Caption := DBconnector.DataModule1.TitleTB.FieldByName('Title')
    .AsString;
  DescriptionPanel.Caption := '';
  DescriptionLabel.Caption := '';
  DescriptionLabel.Caption := DBconnector.DataModule1.TitleTB.FieldByName
    ('Description').AsString;
    //showmessage(DBconnector.Datamodule1.titletb.fieldbyname('Title').AsString);
  TrailerUrl := DBconnector.DataModule1.TitleTB.FieldByName('TrailerURL')
    .AsString;
  //RatingLabel.Caption := DBConnector.DataModule1.TitleTB.FieldByName('Rating').AsString;

  // .GetFieldData('Title');
end;

procedure TBackground.SearchAccounts;
begin
  // showmessage('Derp');
  try
    if False then // DBconnector.DataModule1.UsersTB.Locate(username, ['Username']) then
    begin
      if DBconnector.DataModule1.UsersTB.FieldByName('Password')
        .AsString = password then
      begin
        // Log in
      end
      else
      begin
        Emessage := 'Incorrect password!';
        PrintDebug('Incorrect password entered', 'warn');
        Error;
      end;

    end;

  except
    begin
      Chack := 2;
      Cmessage := 'Would you like to create an account?';
      Confirm;
      // Emessage := 'Feature not working yet!';
      // Error;
      SignUpPanel.Show;
    end;
  end;
end;

procedure TBackground.CreateAccount;
begin

  { try
    SignUpPanel.Show;
    except
    Emessage := 'Feature not working yet!';
    Error;
    end; }
end;

procedure TBackground.ConfCancelClick(Sender: TObject);
begin
  ConfPanel.Hide;
end;

procedure TBackground.ConfCancelMouseEnter(Sender: TObject);
begin
  ConfCancel.Color := $00404040;
end;

procedure TBackground.ConfCancelMouseLeave(Sender: TObject);
begin
  ConfCancel.Color := $00303030;
end;

procedure TBackground.ConfCloseClick(Sender: TObject);
begin
  ConfPanel.Hide;
end;

procedure TBackground.ConfCloseMouseEnter(Sender: TObject);
begin
  ConfClose.Color := $00404040;
end;

procedure TBackground.ConfCloseMouseLeave(Sender: TObject);
begin
  ConfClose.Color := $00303030;
end;

procedure TBackground.Confirm;
begin
  ConfPanel.BringToFront;
  ConfText.Caption := Cmessage;
  ConfPanel.Visible := True;
end;

procedure TBackground.ConfOKClick(Sender: TObject);
begin
  // Add some function for dynamic code here.
  // So, make this button a broadcast and let the code it has inside it
  // be edited by the program itself.

  // Remember to change the range here before adding features
  if ((Chack <> 1) and (Chack <> 2)) then
  begin
    Emessage := 'Confirmation Panel broke!';
    Error;
    PrintDebug('Confirmation Panel failed to spawn', 'warn');
  end;

  if Chack = 1 then
  begin
    ShellExecute(0, 'open',
      'https://mweya.ddns.net/Portfolio/Streamer/readme.html', nil, nil,
      SW_SHOW);
    ConfPanel.Hide;

    if FileExists('HelpFile.dll') then
    begin
      try
        Assignfile(azNewHelpFile, Path + '\Help-File.txt');
        Rewrite(azNewHelpFile);
        // Write to new file from old one
        Assignfile(azhelpfile, 'HelpFile.dll');
        Reset(azhelpfile);
        while not EOF(azhelpfile) do
        begin
          // Read original file in Base Directory
          Readln(azhelpfile, filetext);
          // Actually do the writing here
          Writeln(azNewHelpFile, filetext);
        end;
        Closefile(azNewHelpFile);
        Closefile(azhelpfile);
        PrintDebug('Help file saved to ' + Path + '\Help-File.txt', 'info');
        Emessage := 'Readme file saved to Downloads';
        Error;
      except

        PrintDebug('Error copying help file to Downloads using method one',
          'warn');
        try
          CopyFile(Pchar('HelpFile.dll'), Pchar(Path + 'Help-File.txt'), False);
          Emessage := 'Readme file saved to Downloads';
          Error;
        except
          PrintDebug('Copying help file to Downloads failed completely!',
            'warn');
          Emessage := 'Error copying file to Downloads!';
          Error;
        end;
      end;

    end
    else
    begin
      PrintDebug('Readme file not found in base directory!', 'warn');
      Emessage := 'Readme file not found!';
      Error;
    end;
    Chack := 0;
  end;
  if Chack = 2 then
  begin
    try
      DBconnector.DataModule1.AddAccount(username, password);
      // SearchAccounts;
      ConfPanel.Hide;
      Chack := 0;
      Emessage := 'Account created!';
    except
      Emessage := 'Error creating account!';

    end;
    Error;
  end;

end;

procedure TBackground.ConfOKMouseEnter(Sender: TObject);
begin
  ConfOK.Color := $00404040;
end;

procedure TBackground.ConfOKMouseLeave(Sender: TObject);
begin
  ConfOK.Color := $00303030;
end;

procedure TBackground.DescriptionPanelClick(Sender: TObject);
begin
      if SbarHidden = 0 then
  begin
    RightSidebar.Show;
    SbarHidden := 1;
  end
  else
  begin
    RightSidebar.Hide;
    SbarHidden := 0;
  end;
end;

procedure TBackground.DislikeButtonClick(Sender: TObject);
begin
  PrintDebug('Movie ' + TitleBar.Caption + ' disliked by ' + username, 'info');
end;

function TBackground.DownloadFile(SourceFile: string;
  DestFile: string): Boolean;
/// /////////////////////////////////////////////////////////////////////////////////////////
/// Function from Delphi Tricks. URL:                                                   //
/// http://www.delphitricks.com/source-code/internet/download_a_file_from_internet.html //
/// //////////////////////////////////////////////////////////////////////////////////////
begin
  try
    Result := URLDownloadtofile(nil, Pchar(SourceFile), Pchar(DestFile), 0,
      nil) = 0;
  except
    Result := False;
  end;
end;

function TBackground.GetUser: string;
var
  MaxSize: Dword;
begin
  begin
    MaxSize := 1024;
    SetLength(Result, MaxSize);
    if GetUserName(Pchar(Result), MaxSize) then
      SetLength(Result, MaxSize - 1)
    else
      RaiseLastOSError;
  end;
end;

procedure TBackground.BackButtonClick(Sender: TObject);
begin
  PrintDebug('Back Button clicked', 'info');
  WebBackground.SendToBack;
  LeftSidebar.Visible := False;
  WebBrowser.Enabled := false;
  //WebBrowser.Stop;
  WebBrowser.GoHome;
end;

procedure TBackground.BackButtonMouseEnter(Sender: TObject);
begin
  BackButton.Color := $00353535;
end;

procedure TBackground.BackButtonMouseLeave(Sender: TObject);
begin
  BackButton.Color := $00252525;
end;

procedure TBackground.BrowseButtonClick(Sender: TObject);
begin
  if LoggedIn = 0 then
  begin
    PrintDebug('User unauthenticated', 'warn');
    Emessage := 'Log in first.';
    Error;
  end
  else if LoggedIn = 1 then
  begin
    BrowsePanel.Visible := True;
    RightSidebar.BringToFront;
    DBconnector.DataModule1.TitleTB.First;
    BrowseRefresh;
  end
  else
  begin
    PrintDebug('Error displaying error message.', 'warn');
    Emessage := 'Error in error method!';
    Error;
  end;
end;

procedure TBackground.BrowseButtonMouseEnter(Sender: TObject);
begin
  BrowseButton.Color := $00353535;
end;

procedure TBackground.BrowseButtonMouseLeave(Sender: TObject);
begin
  BrowseButton.Color := $00252525;
end;

procedure TBackground.BrowsePanelClick(Sender: TObject);
begin
  if SbarHidden = 0 then
  begin
    RightSidebar.Show;
    SbarHidden := 1;
  end
  else
  begin
    RightSidebar.Hide;
    SbarHidden := 0;
  end;
end;

procedure TBackground.Error;
begin

  ErrorMessageBox.Caption := ANSIUPPERCASE(Emessage);
  ErrorPanel.Show;
  ErrorPanel.BringToFront;
end;

/// //////////////////////////////////////////////////////////////////
// Screen Resolution Change taken from a Blogspot post            //
// by Putra Adi                                                  //
// //
/// //////////////////////////////////////////////////////////////

function TBackground.SetScreenResolution(Width, Height: integer): Longint;
var
  DeviceMode: TDeviceMode;
begin
  with DeviceMode do
  begin
    dmSize := SizeOf(TDeviceMode);
    dmPelsWidth := Width;
    dmPelsHeight := Height;
    dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
  end;
  Result := ChangeDisplaySettings(DeviceMode, CDS_UPDATEREGISTRY);
end;

procedure TBackground.SettingsButtonClick(Sender: TObject);
begin
  // Settings using login panel
  { Emessage := 'Method not implemented yet!';
    Error; }
  SettingsPanel.Show;
  SettingsPanel.BringToFront;
end;

procedure TBackground.SettingsButtonMouseEnter(Sender: TObject);
begin
  SettingsButton.Color := $00353535;
end;

procedure TBackground.SettingsButtonMouseLeave(Sender: TObject);
begin
  SettingsButton.Color := $00252525;
end;

procedure TBackground.SettingsCloseClick(Sender: TObject);
begin
  SettingsPanel.Hide;
end;

procedure TBackground.SettingsOKClick(Sender: TObject);
begin
  SettingsPanel.Hide;
end;

procedure TBackground.SignUpCancelClick(Sender: TObject);
begin
  SignUpPanel.Visible := False;
end;

procedure TBackground.SignUpCancelMouseEnter(Sender: TObject);
begin
  SignUpCancel.Color := $00353535;
end;

procedure TBackground.SignUpCancelMouseLeave(Sender: TObject);
begin
  SignUpCancel.Color := $00303030;
end;

procedure TBackground.SubmitLogin;
begin
  // showmessage(username+';'+password);
  if LoggedIn = 1 then
  begin
    PrintDebug('User might not be fit to use this program.', 'warn');
    Emessage := 'You are already logged in.';
    Error;
  end
  else if LoggedIn = 0 then
  begin

    if DBconnector.DataModule1.UsersTB.Locate('Username;Password',
      VarArrayOf([username, password]), []) = True then
    begin
      // is found, log in
      LoggedIn := 1;
      PrintDebug('User ' + username + ' logged in', 'info');
      UserGreet.Caption := ANSIUPPERCASE('HELLO ' + username + '!');
      Admin.LoggedIn := 1;
      // check if user is admin
      if DBconnector.DataModule1.UsersTB.FieldByName('Admin')
        .asboolean = True then
      begin
        Admin.Isadmin := 1;
      end
      else
      begin
        Admin.Isadmin := 0;
      end;

      // if DBconnector.DataModule1.UsersTB.Locate(username, 'Admin') = true then
      // begin
      // Admin.Isadmin := 1;
      // end
      // else
      // begin

    end
    else
    begin
      if DBconnector.DataModule1.UsersTB.Locate('Username', username, [])
        = True then
      begin
        Emessage := 'Check your username / password';
        Error;
      end
      else
      begin
        Cmessage := 'Would you like to create an account?';
        Chack := 2;
        Confirm;
      end;
    end;

  end
  else
  begin
    // User not found
    PrintDebug('User remains unauthenticated', 'warn');
    /// //////////////////////////////
    /// REMEMBER TO MOVE TO DB ///
    /// ////////////////////////////

    { if username = 'Mweya' then
      begin
      if password = 'test' then
      begin
      LoggedIn := 1;
      PrintDebug('User ' + username + ' logged in', 'info');
      UserGreet.Caption := ANSIUPPERCASE('HELLO ' + username + '!');
      Admin.LoggedIn := 1;
      end
      else
      begin

      Emessage := 'Incorrect login details';
      Error;
      PrintDebug(
      'User remains unauthorized due to incorrect login credentials',
      'warn');
      Emessage := 'Logging in...';
      ErrorOkButton.Hide;
      Error;
      application.ProcessMessages;
      Sleep(7000);
      Emessage := 'Server unreachable!';
      ErrorOkButton.Show;
      PrintDebug(Emessage, 'warn');
      Error;
      end;
      end
      else
      begin
      try

      LoginPacket := (username + ':' + password);
      LoginPacket := ANSIREVERSESTRING(LoginPacket);

      // Fake Login fail for now
      // Emessage := 'Logging in...';
      // ErrorOkButton.Hide;
      // Error;
      // application.ProcessMessages;
      // Sleep(7000);
      // Emessage := 'Server unreachable!';
      // ErrorOkButton.Show;
      // PrintDebug(Emessage, 'warn');
      // Error;
      SearchAccounts;

      except
      // PrintDebug('Error logging client in.', 'warn');
      Emessage := 'Error logging client in!';
      PrintDebug(Emessage, 'warn');
      Error;

      end;
      end; }
  end;
end;

procedure TBackground.DescriptionLabelClick(Sender: TObject);
begin
      if SbarHidden = 0 then
  begin
    RightSidebar.Show;
    SbarHidden := 1;
  end
  else
  begin
    RightSidebar.Hide;
    SbarHidden := 0;
  end;
end;

procedure TBackground.LaunchAdminButtonClick(Sender: TObject);
begin
  // Launch temporary admin GUI
  if DevMode = 0 then
  begin
    Emessage := 'Enable DevMode first';
    PrintDebug('Unauthorized user prevented from editing DB', 'warn');
    Error;
  end
  else if DevMode = 1 then
  begin
    // Wait, this works?
    Admin.DBEditor.Show;
  end
  else
  begin
    Emessage := 'DevMode state checker failed!';
    Error;
    PrintDebug('DevMode state checker failed', 'warn');
  end;

end;

procedure TBackground.LaunchAdminButtonMouseEnter(Sender: TObject);
begin
  LaunchAdminButton.Color := $00353535;
end;

procedure TBackground.LaunchAdminButtonMouseLeave(Sender: TObject);
begin
  LaunchAdminButton.Color := $00252525;
end;

procedure TBackground.LikeButtonClick(Sender: TObject);
begin
  PrintDebug('Movie ' + TitleBar.Caption + ' liked by ' + username, 'info');
end;

procedure TBackground.Login;
begin
  LoginPanel.Show;
  // messagedlg('Server unreachable!', mterror, [mbok], 0);
end;

procedure TBackground.ExitButtonMouseEnter(Sender: TObject);
begin
  ExitButton.Color := $00353535;
end;

procedure TBackground.ExitButtonMouseLeave(Sender: TObject);
begin
  ExitButton.Color := $00252525;
end;

procedure TBackground.FormClick(Sender: TObject);
begin
  if SbarHidden = 0 then
  begin
    RightSidebar.Show;
    SbarHidden := 1;
  end
  else
  begin
    RightSidebar.Hide;
    SbarHidden := 0;
  end;
end;

procedure TBackground.MoveDB;
begin
  // Check to see if the DB has been moved to the Downloads folder yet
  if FileExists('Streamer.mdb') then
  begin
    DBconnector.DataModule1.PrintConsole('Moving DB to downloads directory',
      'info');
    if CopyFile(Pchar('Streamer.mdb'), Pchar(Path + '\DB\Streamer.mdb'), False)
      then
    begin
      // Looks like this worked great
      DBconnector.DataModule1.PrintConsole('DB moved succesfully', 'info');
      // Delete file to prevent unwanted overwrite
      DeleteFile('Streamer.mdb');
      DBconnector.DataModule1.PrintConsole
        ('DB removed from starting directory', 'info');
    end
    else
    begin
      DBconnector.DataModule1.PrintConsole('Error moving DB', 'warn');
    end;
  end
  else
  begin
    DBconnector.DataModule1.PrintConsole('DB not found next to app', 'warn');
  end;

end;

procedure TBackground.FormCreate(Sender: TObject);
begin
  // Debug screen init
  PrintDebug('Streamer Dev Console', 'header');
  PrintDebug('Mweya Ruider - 2017', 'header');
  PrintDebug('', 'header');

  // Variables
  LoggedIn := 0;
  SbarHidden := 0;
  PCuser := GetUser;
  PrintDebug('Variables initialised...', 'info');
  Path := 'C:\Users\' + PCuser + '\Downloads\Streamer';
  DBconnector.Path := Path;
  PrintDebug('Path built...', 'info');
  DevMode := 0;
  MoveDB;
  TrailerUrl := 'https://mweya.ddns.net/Portfolio';



  // showmessage(path);

  /// //////////////////////////////////////////////////////////
  // Splash Screen                        ///
  /// //////////////////////////////////////////////////////////

  // Change Screen Resolution
  scrwidth := GetSystemMetrics(SM_CXSCREEN);
  scrheight := GetSystemMetrics(SM_CYSCREEN);
  { showmessage('scr vars: '+inttostr(scrwidth)+'x'+inttostr(scrheight)); }
  { messagedlg('Changing screen resolution to 1366x768. Storing current screen resolution ('+inttostr(ScrWidth)+'x'+inttostr(ScrHeight)+') for later use.', mtwarning, [mbok], 0); }
  PrintDebug('Backup screen resolution saved...', 'info');
  try
    SetScreenResolution(1366, 768);
    testwidth := GetSystemMetrics(SM_CXSCREEN);
    testheight := GetSystemMetrics(SM_CYSCREEN);
    { showmessage('test vars: '+inttostr(testwidth)+'x'+inttostr(testheight)); }
    if testheight <> 768 then
    begin
      messagedlg(
        'Critical error changing screen resolution resulted in the termination of this program. Please contact the program developer.', mterror, [mbok], 0);
      SetScreenResolution(scrwidth, scrheight);
      PrintDebug('Error changing screen resolution!', 'warn');
      PrintDebug('Reverting and closing...', 'warn');
      application.Terminate;
    end;
    if testwidth <> 1366 then
    begin
      messagedlg(
        'Critical error changing screen resolution resulted in the termination of this program. Please contact the program developer.', mterror, [mbok], 0);
      SetScreenResolution(scrwidth, scrheight);
      PrintDebug('Error changing screen resolution!', 'warn');
      PrintDebug('Reverting and closing...', 'warn');
      application.Terminate;
    end;
  except
    messagedlg(
      'Critical error changing screen resolution resulted in the termination of this program. Please contact the program developer.', mterror, [mbok], 0);
    SetScreenResolution(scrwidth, scrheight);
    PrintDebug('Error changing screen resolution!', 'warn');
    PrintDebug('Reverting and closing...', 'warn');
    application.Terminate;
  end;

  // Fullscreen
  borderstyle := bsNone;
  WindowState := wsMaximized;
  PrintDebug('Maximising application...', 'info');

  // Make Folder, Fingerprint, Setup Networking
  ShellExecute(0, nil, Pchar('cmd.exe'), Pchar('/C mkdir ' + Path), 0, 0);
  PrintDebug('Making ' + Path + ' ...', 'info');
  ShellExecute(0, nil, Pchar('cmd.exe'), Pchar('/C mkdir ' + Path + '\Video'),
    0, 0);
  PrintDebug('Making ' + Path + '\Video ...', 'info');
  ShellExecute(0, nil, Pchar('cmd.exe'), Pchar('/C cd ' + Path), 0, 0);
  PrintDebug('Moved to ' + Path, 'info');
  ShellExecute(0, nil, Pchar('cmd.exe'),
    Pchar('/C echo ' + PCuser + ' is running Streamer. > ' + Path +
        '\User.txt'), 0, 0);
  PrintDebug('Fingerprinting user...', 'info');
  ShellExecute(0, nil, Pchar('cmd.exe'),
    Pchar('/C echo <> > ' + Path + '\cache'), 0, 0);
  PrintDebug('Creating cache...', 'info');

  { if (Path+'\dbpull') then
    begin
    DBRefreshed := 1;
    end
    else
    begin
    DBrefreshed := 0;
    ShellExecute(0, nil, Pchar('cmd.exe'), Pchar('/C echo <> > '+Path+'\dbpull'), 0, 0);
    DBrefreshed := 1;
    end; }
  PrintDebug('Building GUI...', 'info');

  // Icons and Graphics
  StreamerLogo.Top := round(clientwidth / 70);
  StreamerLogo.Left := clientwidth + round(clientwidth / 3);
  StreamerLogo.Width := screen.Width div 7;
  StreamerLogo.Height := screen.Height div 4;
  StreamerLogo.SendToBack;
  StreamerLogo.Show;
  PrintDebug('Logo built', 'gui');
  StreamerHeader.Height := screen.Height div 4;
  StreamerHeader.Width := screen.Width div 3;
  StreamerHeader.Top := (screen.Height - StreamerHeader.Height) div 2;
  StreamerHeader.Left := (screen.Width - StreamerHeader.Width) div 2;
  StreamerHeader.SendToBack;
  PrintDebug('Center header built', 'gui');
  UserGreet.Height := round((screen.Height) / 100) * 4;
  UserGreet.Width := round(screen.Width / 6);
  UserGreet.Top := screen.Height - UserGreet.Height;
  UserGreet.Left := screen.Width - UserGreet.Width;
  UserGreet.SendToBack;
  PrintDebug('Greeting caption built', 'gui');

  // Right Sidebar
  RightSidebar.Top := 0;
  RightSidebar.Height := clientheight + round(clientheight * 4);
  RightSidebar.Left := (0);
  RightSidebar.Width := round(screen.Width / 6);
  PrintDebug('Building right sidebar...', 'gui');

  // Left Sidebar
  LeftSidebar.Top := RightSidebar.Top;
  LeftSidebar.Height := RightSidebar.Height;
  LeftSidebar.Width := RightSidebar.Width;
  LeftSidebar.Left := screen.Width - LeftSidebar.Width;
  PrintDebug('Building left sidebar...', 'gui');

  // Buttons go here
  ExitButton.Left := 0;
  ExitButton.Width := RightSidebar.Width;
  ExitButton.Height := round((screen.Height) / 100) * 4;
  ExitButton.Top := screen.Height - ExitButton.Height;
  PrintDebug('Exit button built', 'nested gui');
  BrowseButton.Left := 0;
  BrowseButton.Width := RightSidebar.Width;
  BrowseButton.Height := ExitButton.Height;
  BrowseButton.Top := 0;
  PrintDebug('Browse button built', 'nested gui');
  LoginButton.Left := 0;
  LoginButton.Width := RightSidebar.Width;
  LoginButton.Height := round((screen.Height) / 100) * 4;
  LoginButton.Top := 0 + BrowseButton.Height * 1;
  PrintDebug('Login button built', 'nested gui');
  LogoutButton.Left := 0;
  LogoutButton.Width := RightSidebar.Width;
  LogoutButton.Height := round((screen.Height) / 100) * 4;
  LogoutButton.Top := 0 + (BrowseButton.Height) * 2;
  PrintDebug('Logout button built', 'nested gui');
  SettingsButton.Top := 0 + (BrowseButton.Height) * 3;
  SettingsButton.Left := 0;
  SettingsButton.Width := RightSidebar.Width;
  SettingsButton.Height := round((screen.Height) / 100) * 4;
  PrintDebug('Settings button built', 'nested gui');
  HelpButton.Left := 0;
  HelpButton.Width := RightSidebar.Width;
  HelpButton.Height := round((screen.Height) / 100) * 4;
  HelpButton.Top := 0 + (BrowseButton.Height) * 4;
  PrintDebug('Help button built', 'nested gui');
  BackButton.Width := LeftSidebar.Width;
  BackButton.Height := HelpButton.Height;
  BackButton.Top := screen.Height - BackButton.Height;
  BackButton.Left := 0;
  PrintDebug('Back button built', 'nested gui');
  SidebarBranding.Height := BackButton.Height;
  SidebarBranding.Width := BackButton.Width;
  SidebarBranding.Left := 0;
  SidebarBranding.Top := 0;
  PrintDebug('Left Sidebar caption built', 'nested gui');

  /// ////////////////////////////////////
  // Login Form                         //
  /// ////////////////////////////////////
  PrintDebug('Building login form...', 'gui');
  // Login Form
  LoginPanel.BringToFront;
  LoginPanel.Height := (screen.Height) div 3;
  LoginPanel.Width := (screen.Width) div 2;
  LoginPanel.Top := (screen.Height - LoginPanel.Height) div 2;
  LoginPanel.Left := (screen.Width - LoginPanel.Width) div 2;
  PrintDebug('Form size set', 'nested gui');

  // Login Labels (Made with panels due to Delphi crashes)
  UsernameLabel.Height := (LoginPanel.Height) div 3;
  UsernameLabel.Width := (LoginPanel.Width) div 4;
  UsernameLabel.Top := LoginPanel.Top - round(UsernameLabel.Height * 2.5);
  UsernameLabel.Left := (LoginPanel.Left - round(UsernameLabel.Width * 2));
  PasswordLabel.Height := UsernameLabel.Height;
  PasswordLabel.Width := UsernameLabel.Width;
  PasswordLabel.Top := LoginPanel.Top - round(UsernameLabel.Height * 1.5);
  PasswordLabel.Left := UsernameLabel.Left;
  PrintDebug('Text box built', 'nested gui');

  // Login Buttons
  LoginCancel.Height := LoginPanel.Height div 8;
  LoginCancel.Width := LoginPanel.Width div 6;
  LoginCancel.Top := LoginPanel.Top - round(LoginCancel.Height * 1.5);
  LoginCancel.Left := LoginPanel.Left + round(LoginCancel.Left * 6);
  PrintDebug('Cancel button built', 'nested gui');
  SubmitLoginButton.Height := LoginCancel.Height;
  SubmitLoginButton.Width := LoginCancel.Width;
  SubmitLoginButton.Top := LoginCancel.Top;
  SubmitLoginButton.Left := LoginCancel.Left - round
    (SubmitLoginButton.Width * 1.2);
  PrintDebug('Sumbit button built', 'nested gui');

  // Login Fields
  UsernameField.Height := LoginPanel.Height div 10;
  UsernameField.Width := round(LoginPanel.Width / 2);
  UsernameField.Top := UsernameLabel.Top + round(UsernameField.Top * 1.3);
  UsernameField.Left := round(UsernameLabel.Left * 300);
  PrintDebug('Username field built', 'nested gui');
  PasswordField.Height := UsernameField.Height;
  PasswordField.Width := UsernameField.Width;
  PasswordField.Top := PasswordLabel.Top + round(PasswordField.Height * 1.3);
  PasswordField.Left := UsernameField.Left;
  PrintDebug('Password field built', 'nested gui');

  /// /////////////////////////////////
  /// Account Creation Panel     ///
  /// ///////////////////////////////
  PrintDebug('Building Sign Up form...', 'gui');
  // Sign Up Form
  SignUpPanel.BringToFront;
  SignUpPanel.Height := (screen.Height) div 3;
  SignUpPanel.Width := (screen.Width) div 2;
  SignUpPanel.Top := (screen.Height - LoginPanel.Height) div 2;
  SignUpPanel.Left := (screen.Width - LoginPanel.Width) div 2;
  PrintDebug('Form size set', 'nested gui');

  // Signup Labels (Made with panels due to Delphi crashes)
  cUsernameLabel.Height := (SignUpPanel.Height) div 3;
  cUsernameLabel.Width := (SignUpPanel.Width) div 4;
  cUsernameLabel.Top := SignUpPanel.Top - round(cUsernameLabel.Height * 2.5);
  cUsernameLabel.Left := (SignUpPanel.Left - round(cUsernameLabel.Width * 2));
  cPasswordLabel.Height := cUsernameLabel.Height;
  cPasswordLabel.Width := cUsernameLabel.Width;
  cPasswordLabel.Top := SignUpPanel.Top - round(cUsernameLabel.Height * 1.5);
  cPasswordLabel.Left := cUsernameLabel.Left;
  PrintDebug('Text box built', 'nested gui');

  // SignUp Buttons
  SignUpCancel.Height := SignUpPanel.Height div 8;
  SignUpCancel.Width := SignUpPanel.Width div 6;
  SignUpCancel.Top := SignUpPanel.Top - round(SignUpCancel.Height * 1.5);
  SignUpCancel.Left := SignUpPanel.Left + round(SignUpCancel.Left * 6);
  PrintDebug('Cancel button built', 'nested gui');
  SubmitSignupButton.Height := SignUpCancel.Height;
  SubmitSignupButton.Width := round(SignUpCancel.Width * 1.12);
  SubmitSignupButton.Top := SignUpCancel.Top;
  SubmitSignupButton.Left := SignUpCancel.Left - round
    (SubmitSignupButton.Width * 1.2);
  PrintDebug('Sumbit button built', 'nested gui');

  // SignUp Fields
  cUsernameField.Height := SignUpPanel.Height div 10;
  cUsernameField.Width := round(SignUpPanel.Width / 2);
  cUsernameField.Top := UsernameLabel.Top + round(cUsernameField.Top * 1.3);
  cUsernameField.Left := round(UsernameLabel.Left * 300);
  PrintDebug('Username field built', 'nested gui');
  cPasswordField.Height := cUsernameField.Height;
  cPasswordField.Width := cUsernameField.Width;
  cPasswordField.Top := PasswordLabel.Top + round(cPasswordField.Height * 1.3);
  cPasswordField.Left := cUsernameField.Left;
  PrintDebug('Password field built', 'nested gui');

  /// //////////////////////////////////////////////////////////
  // Error Panel                           //
  /// //////////////////////////////////////////////////////////

  PrintDebug('Building error panel...', 'gui');
  // Panel Background
  ErrorPanel.BringToFront;
  ErrorPanel.Height := round(((screen.Height) div 3) / 1.5);
  ErrorPanel.Width := round(((screen.Width) div 2) / 1.5);
  ErrorPanel.Top := (screen.Height - ErrorPanel.Height) div 2;
  ErrorPanel.Left := (screen.Width - ErrorPanel.Width) div 2;
  PrintDebug('Form size set', 'nested gui');

  // Error message Box
  ErrorMessageBox.BringToFront;
  ErrorMessageBox.Height := round(ErrorPanel.Height * 0.75);
  ErrorMessageBox.Width := round(ErrorPanel.Width * 0.75);
  ErrorMessageBox.Left := ErrorPanel.Left - round(ErrorOkButton.Width * 7.5);
  ErrorMessageBox.Top := ErrorPanel.Top - round(ErrorPanel.Height * 1.75);
  PrintDebug('Text box built', 'nested gui');

  // Ok Button
  ErrorOkButton.BringToFront;
  ErrorOkButton.Height := LoginCancel.Height;
  ErrorOkButton.Width := LoginCancel.Width;
  ErrorOkButton.Left := ErrorPanel.Left - round(ErrorOkButton.Width * 1.2);
  ErrorOkButton.Top := ErrorPanel.Top - round(ErrorPanel.Height * 1.1);
  PrintDebug('Ok button built', 'nested gui');

  // Vert X Close button
  ErrorClose.BringToFront;
  ErrorClose.Height := round(ErrorPanel.Height / 8);
  ErrorClose.Width := ErrorClose.Height;
  ErrorOkButton.Left := ErrorPanel.Left - round(ErrorOkButton.Width * 1.2);
  ErrorOkButton.Top := ErrorPanel.Top - round(ErrorPanel.Height * 1.1);
  PrintDebug('Close button built', 'nested gui');

  /// //////////////////////////////
  /// Confirmation Panel
  /// /////////////////////////////

  PrintDebug('Building confirmation panel...', 'gui');
  ConfPanel.Height := round(((screen.Height) div 3) / 1.05);
  ConfPanel.Width := round(((screen.Width) div 2) / 1.05);
  ConfPanel.Left := round(screen.Width / 2) - round(ConfPanel.Width / 2);
  ConfPanel.Top := (screen.Height - ConfPanel.Height) div 2;
  PrintDebug('Form size set', 'nested gui');

  ConfText.BringToFront;
  ConfText.Height := ErrorMessageBox.Height;
  ConfText.Width := ErrorMessageBox.Width;
  ConfText.Top := ErrorMessageBox.Top;
  ConfText.Left := ErrorMessageBox.Left + round(screen.Width / 16);
  PrintDebug('Text box built', 'nested gui');

  ConfOK.BringToFront;
  ConfOK.Height := round(screen.Height / 27);
  ConfOK.Width := round(screen.Width / 15);
  ConfOK.Top := ConfText.Top + round(ConfOK.Height * 7.25);
  ConfOK.Left := ConfPanel.Left + round(ConfOK.Width * 2);
  PrintDebug('OK button built', 'nested gui');

  ConfCancel.BringToFront;
  ConfCancel.Height := ConfOK.Height;
  ConfCancel.Width := ConfOK.Width;
  ConfCancel.Top := ConfOK.Top;
  ConfCancel.Left := ConfOK.Left - round(ConfCancel.Width * 1.1);
  PrintDebug('Cancel button built', 'nested gui');

  ConfClose.BringToFront;
  ConfClose.Height := ErrorClose.Height;
  ConfClose.Width := ConfClose.Height;
  ConfClose.Left := ConfText.Left - round(ConfClose.Width * 1.8);
  ConfClose.Top := ConfText.Top + ConfClose.Height;
  PrintDebug('Close button built', 'nested gui');

  /// ///////////////////////////
  /// Settings Panel      ///
  /// /////////////////////////

  PrintDebug('Building settings panel...', 'gui');
  SettingsPanel.BringToFront;
  SettingsPanel.Height := ConfPanel.Height;
  SettingsPanel.Width := ConfPanel.Width;
  SettingsPanel.Left := ConfPanel.Left;
  SettingsPanel.Top := ConfPanel.Top;
  PrintDebug('Form size set', 'nested gui');

  RefreshButton.BringToFront;
  RefreshButton.Width := round(RightSidebar.Width * 0.7);
  RefreshButton.Height := round((screen.Height) / 100) * 4;
  RefreshButton.Top := round(SettingsPanel.Height * 0.25);
  RefreshButton.Left := round(SettingsPanel.Width / 10);
  PrintDebug('Refresh button built', 'nested gui');

  LaunchAdminButton.BringToFront;
  LaunchAdminButton.Width := RefreshButton.Width;
  LaunchAdminButton.Height := RefreshButton.Height;
  LaunchAdminButton.Top := RefreshButton.Top;
  LaunchAdminButton.Left := RefreshButton.Left + round
    (LaunchAdminButton.Width * 1.15);
  PrintDebug('Admin button built', 'nested gui');

  SettingsOK.BringToFront;
  SettingsOK.Height := ConfOK.Height;
  SettingsOK.Width := ConfOK.Width;
  SettingsOK.Left := ConfOK.Left;
  SettingsOK.Top := ConfOK.Top;
  PrintDebug('OK button built', 'nested gui');

  SettingsClose.BringToFront;
  SettingsClose.Height := ConfClose.Height;
  SettingsClose.Width := ConfClose.Width;
  SettingsClose.Top := ConfClose.Top;
  SettingsClose.Left := ConfClose.Left;
  PrintDebug('Close button built', 'nested gui');

  /// //////////////////////////
  // Video Player
  /// //////////////////////////

  PrintDebug('Building video player...', 'gui');
  VideoPlayerPanel.SendToBack;
  UserGreet.SendToBack;
  StreamerHeader.SendToBack;
  StreamerLogo.SendToBack;
  VideoPlayerPanel.Height := screen.Height;
  VideoPlayerPanel.Width := screen.Width;
  VideoPlayerPanel.Top := 0;
  VideoPlayerPanel.Left := 0;
  PrintDebug('Player built', 'nested gui');
  PrintDebug('Player hidden', 'nested gui');

  /// //////////////////////////////////////////
  /// Browse Movies            ///
  /// ////////////////////////////////////////

  PrintDebug('Building browse screen...', 'gui');
  BrowsePanel.Height := screen.Height;
  BrowsePanel.Width := screen.Width;
  BrowsePanel.Top := 0;
  BrowsePanel.Left := 0;
  BrowsePanel.BringToFront;
  PrintDebug('Form size set', 'nested gui');

  MoveLeft.Height := screen.Height;
  MoveLeft.Width := screen.Width div 8;
  MoveLeft.Left := 0;
  MoveLeft.Top := 0;
  // MoveLeft.Top := (screen.Height div 2)- (MoveLeft.Height div 2);
  MoveLeft.BringToFront;
  PrintDebug('Left arrow built', 'nested gui');

  MoveRight.Height := MoveLeft.Height;
  MoveRight.Width := MoveLeft.Width;
  MoveRight.Top := MoveLeft.Top;
  MoveRight.Left := screen.Width - MoveRight.Width;
  MoveRight.BringToFront;
  PrintDebug('Right arrow built', 'nested gui');

  TitleBar.Height := round(screen.Height / 6);
  TitleBar.Width := round(screen.Width * 1);
  TitleBar.Left := 0;
  TitleBar.Top := round(screen.Height / 15);
  TitleBar.BringToFront;
  PrintDebug('Title bar built', 'nested gui');

  LikeButton.Left := 0;
  LikeButton.Width := MoveLeft.Width;
  LikeButton.Height := LikeButton.Width;
  LikeButton.Top := screen.Height - LikeButton.Height;
  LikeButton.BringToFront;
  PrintDebug('Like button built', 'nested gui');

  DislikeButton.Height := LikeButton.Height;
  DislikeButton.Width := LikeButton.Width;
  DislikeButton.Left := screen.Width - DislikeButton.Width;
  DislikeButton.Top := LikeButton.Top;
  DislikeButton.BringToFront;
  PrintDebug('Dislike button built', 'nested gui');

  DescriptionPanel.Height := round(screen.Height / 1.5);
  DescriptionPanel.Width := round(screen.Width / 1.36);
  DescriptionPanel.Top := round(TitleBar.Top * 3);
  DescriptionPanel.Left := MoveLeft.Width;
  PrintDebug('Description panel built', 'nested gui');

  /// //////////////////////////////////////////
  /// Web Trailer Player            ///
  /// ////////////////////////////////////////

  PrintDebug('Building Web Browser...', 'gui');
  WebBackground.Height := screen.Height;
  WebBackground.Width := screen.Width;
  WebBackground.Top := 0;
  WebBackground.Left := 0;
  WebBackground.BringToFront;
  PrintDebug('Form size set', 'nested gui');

  WebBrowser.Height := WebBackground.Height;
  WebBrowser.Width := WebBackground.Width;
  WebBrowser.Top := WebBackground.Top;
  WebBrowser.Left := WebBrowser.Left;
  WebBrowser.BringToFront;
  WebBrowser.MenuBar := False;
  PrintDebug('Web browser built', 'nested gui');

  /// /////////////////////////////////
  /// Video Scanner Init Starts  ///
  /// After GUI is built.       ///
  /// //////////////////////////////

  /// //////////////////////////////////////
  /// Check to see if the Dev Console ///
  /// died again or not.             ///
  /// ///////////////////////////////////

  if (DBconnector.DataModule1.DevDied = True) then
  begin
    Emessage := 'Dev Console crashed. Please restart the application.';
    Error;
  end;

  RightSidebar.BringToFront;
  PrintDebug('Making sure the Sidebar panel is in front', 'nested gui');
end;

procedure TBackground.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ord(Key) = 27) then
  begin
    SetScreenResolution(scrwidth, scrheight);
    try
      begin
        ShellExecute(0, nil, Pchar('cmd.exe'),
          Pchar('/C del ' + Path + '\DB\Streamer.ldb'), 0, 0);
      end;
    except
      // Not much we could do here then.
    end;
    PrintDebug('Application terminating erronously!', 'warn');
    application.Terminate;
  end;

  ///
  /// Remember to disable this before release.
  ///

  if (Key = VK_HOME) then
  begin
    DBRefreshed := 1;
    DevMode := 1;
    Emessage := 'Dev mode enabled.';
    PrintDebug(Emessage, 'info');
    Error;
  end;

  if Key = VK_end then
  begin
    DBRefreshed := 0;
    DevMode := 0;
    Emessage := 'Dev mode disabled.';
    PrintDebug(Emessage, 'info');
    Error;
  end;

end;

procedure TBackground.LoginButtonClick(Sender: TObject);
begin
  // messagedlg('Feature not implemented yet!', mtWarning, [mbok], 0);
  Login;

end;

procedure TBackground.LoginButtonMouseEnter(Sender: TObject);
begin
  LoginButton.Color := $00353535;
end;

procedure TBackground.LoginButtonMouseLeave(Sender: TObject);
begin
  LoginButton.Color := $00252525;
end;

procedure TBackground.LoginCancelClick(Sender: TObject);
begin
  PasswordField.Text := '';
  LoginPanel.Hide;
end;

procedure TBackground.LoginCancelMouseEnter(Sender: TObject);
begin
  LoginCancel.Color := $00404040;
end;

procedure TBackground.LoginCancelMouseLeave(Sender: TObject);
begin
  LoginCancel.Color := $00303030;
end;

procedure TBackground.LogoutButtonClick(Sender: TObject);
begin
  if LoggedIn = 0 then
  begin
    PrintDebug('Illogical logout detected and prevented', 'info');
    Emessage := 'Please log in to log out.';
    Error;
  end
  else if LoggedIn = 1 then
  begin
    PrintDebug('User ' + username + ' logged out', 'info');
    Emessage := 'Logged out.';
    Error;
    LoggedIn := 0;
    UserGreet.Caption := 'HELLO. PLEASE LOG IN.';
  end;

end;

procedure TBackground.LogoutButtonMouseEnter(Sender: TObject);
begin
  LogoutButton.Color := $00353535;
end;

procedure TBackground.LogoutButtonMouseLeave(Sender: TObject);
begin
  LogoutButton.Color := $00252525;
end;

procedure TBackground.MoveLeftClick(Sender: TObject);
begin
  DBconnector.DataModule1.MoveUp;
end;

procedure TBackground.MoveLeftMouseEnter(Sender: TObject);
begin
  MoveLeft.Color := $00252525;
end;

procedure TBackground.MoveLeftMouseLeave(Sender: TObject);
begin
  MoveLeft.Color := $00000000;
end;

procedure TBackground.MoveRightClick(Sender: TObject);
begin
  DBconnector.DataModule1.MoveDown;
end;

procedure TBackground.MoveRightMouseEnter(Sender: TObject);
begin
  MoveRight.Color := $00252525;
end;

procedure TBackground.MoveRightMouseLeave(Sender: TObject);
begin
  MoveRight.Color := $00000000;
end;

procedure TBackground.HelpButtonClick(Sender: TObject);
var
  website: integer;
  buttonselected: integer;
begin
  { website := 0;
    buttonselected := messagedlg('Would you like to visit the readme site?',
    mtConfirmation, mbOKCancel, 0);
    if buttonselected = mrok then
    begin
    website := 1;
    end
    else
    begin
    website := 0;
    end;



    if website = 1 then
    begin
    ShellExecute(0, 'open', Pchar(
    'https://mweya.ddns.net/Portfolio/Streamer/readme.html'), 0, 0,
    SW_SHOW);
    end; }
  Chack := 1;
  Cmessage := 'Would you like to view the readme?';
  Confirm;

end;

procedure TBackground.HelpButtonMouseEnter(Sender: TObject);
begin
  HelpButton.Color := $00353535;
end;

procedure TBackground.HelpButtonMouseLeave(Sender: TObject);
begin
  HelpButton.Color := $00252525;
end;

procedure TBackground.RefreshButtonClick(Sender: TObject);
begin
  try
    // This really just checks to see if the DB is connected or not
    if DBconnector.DataModule1.StreamerADO.Connected = True then
    begin
      DBRefreshed := 1;
      PrintDebug('DB refreshed by user', 'info');
      Emessage := 'DB refreshed!';
      Error;
    end;
  except
    PrintDebug('Error refreshing DB', 'warn');
    Emessage := 'Error refreshing database.';
    Error;
  end;
end;

procedure TBackground.RefreshButtonMouseEnter(Sender: TObject);
begin
  RefreshButton.Color := $00353535;
end;

procedure TBackground.RefreshButtonMouseLeave(Sender: TObject);
begin
  RefreshButton.Color := $00252525;
end;

procedure TBackground.RefreshRating;
begin
//
Mrating := strtoint(DBConnector.DataModule1.TitleTB.FieldByName('Rating').AsString);
end;

procedure TBackground.ErrorCloseMouseEnter(Sender: TObject);
begin
  ErrorClose.Color := $00404040;
end;

procedure TBackground.ErrorCloseMouseLeave(Sender: TObject);
begin
  ErrorClose.Color := $00303030;
end;

procedure TBackground.ErrorOkButtonClick(Sender: TObject);
begin
  ErrorPanel.Hide;
end;

procedure TBackground.ErrorOkButtonMouseEnter(Sender: TObject);
begin
  ErrorOkButton.Color := $00404040;
end;

procedure TBackground.ErrorOkButtonMouseLeave(Sender: TObject);
begin
  ErrorOkButton.Color := $00303030;
end;

procedure TBackground.ExitButtonClick(Sender: TObject);
begin
  PrintDebug('Closing application gracefully...', 'info');
  SetScreenResolution(scrwidth, scrheight);
  try
    DBconnector.DataModule1.FreeDB;
  except
    PrintDebug('Error freeing DB!', 'warn');
  end;
  application.Terminate;
end;

procedure TBackground.StreamerHeaderClick(Sender: TObject);
begin
  if SbarHidden = 0 then
  begin
    RightSidebar.Show;
    SbarHidden := 1;
  end
  else
  begin
    RightSidebar.Hide;
    SbarHidden := 0;
  end;
end;

procedure TBackground.StreamerLogoClick(Sender: TObject);
begin
  ShellExecute(0, 'open', Pchar('https://mweya.ddns.net/'), 0, 0, SW_SHOW);
  PrintDebug('Taking user to my site...', 'info');
end;

procedure TBackground.SubmitLoginButtonClick(Sender: TObject);
begin
  username := UsernameField.Text;
  password := PasswordField.Text;
  SubmitLogin;
  LoginPanel.Visible := False;
end;

procedure TBackground.SubmitLoginButtonMouseEnter(Sender: TObject);
begin
  SubmitLoginButton.Color := $00404040;
end;

procedure TBackground.SubmitLoginButtonMouseLeave(Sender: TObject);
begin
  SubmitLoginButton.Color := $00303030;
end;

procedure TBackground.SubmitSignupButtonClick(Sender: TObject);
begin
  username := cUsernameField.Text;
  password := cPasswordField.Text;
end;

procedure TBackground.SubmitSignupButtonMouseEnter(Sender: TObject);
begin
  SubmitSignupButton.Color := $00353535;
end;

procedure TBackground.SubmitSignupButtonMouseLeave(Sender: TObject);
begin
  SubmitSignupButton.Color := $00303030;
end;

procedure TBackground.TitleBarClick(Sender: TObject);
begin
  PrintDebug('Title panel clicked.', 'info');
  WebBackground.Visible := True;
  WebBackground.BringToFront;
  WebBrowser.Visible := True;
  WebBrowser.BringToFront;
  WebBrowser.Left := 0;
  WebBrowser.Top := 0;
  WebBrowser.Height := screen.Height;
  WebBrowser.Width := screen.Width;
  WebBrowser.Enabled := true;
  WebBrowser.Navigate(TrailerUrl);
  LeftSidebar.BringToFront;
  LeftSidebar.Visible := True;
  // backButton.Height := screen.height;
  // Backbutton.Width := screen.Width;
  BackButton.Left := 0;
  BackButton.Top := screen.Height - BackButton.Height;
  // round(Screen.Height/2);
  BackButton.BringToFront;
  BackButton.Visible := True;
  // showmessage(inttostr(BackButton.Left)+':'+inttostr(BackButton.Top)+' '+inttostr(BackButton.Height)+'x'+inttostr(BackButton.Width));
end;

{ procedure Tbackground.WebBrowserClick(Sender: Tobject);
  begin
  //
  end; }
procedure TBackground.VideoPlayerPanelClick(Sender: TObject);
begin
  if SbarHidden = 0 then
  begin
    RightSidebar.Show;
    SbarHidden := 1;
  end
  else
  begin
    RightSidebar.Hide;
    SbarHidden := 0;
  end;
end;

procedure TBackground.PrintDebug(dmsg: string; dtype: string);
begin
  DBconnector.DataModule1.PrintConsole(dmsg, dtype);
end;

end.

// Mweya Ruider - 2017
