unit Threads;

interface

uses
  Classes {$IFDEF MSWINDOWS} , Windows {$ENDIF}, Dialogs, Shellapi, DBconnector;

type
  Popup = class(TThread)
  protected
    procedure Execute; override;
    procedure PrintDialog(dmsg:string; dtype:string);
  end;
  var
  dmsg : string;
  dtype: string;
implementation

{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure Popup.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; 
    
    or 
    
    Synchronize( 
      procedure 
      begin
        Form1.Caption := 'Updated in thread via an anonymous method' 
      end
      )
    );
    
  where an anonymous method is passed.
  
  Similarly, the developer can call the Queue method with similar parameters as 
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.
    
}

{ Popup }

procedure Popup.Execute;
begin
  NameThreadForDebugging('PopUpThread');
  { Place thread code here }
  PrintDialog('Thread started', 'info');
end;

procedure Popup.PrintDialog(dmsg: string; dtype:string);
begin

  DBconnector.DataModule1.PrintConsole(dmsg, dtype);

end;

end.
