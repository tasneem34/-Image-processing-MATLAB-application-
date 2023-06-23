function varargout = motion(varargin)
% MOTION MATLAB code for motion.fig
%      MOTION, by itself, creates a new MOTION or raises the existing
%      singleton*.
%
%      H = MOTION returns the handle to a new MOTION or the handle to
%      the existing singleton*.
%
%      MOTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOTION.M with the given input arguments.
%
%      MOTION('Property','Value',...) creates a new MOTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before motion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to motion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help motion

% Last Modified by GUIDE v2.5 15-May-2022 03:48:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @motion_OpeningFcn, ...
                   'gui_OutputFcn',  @motion_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before motion is made visible.
function motion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to motion (see VARARGIN)

% Choose default command line output for motion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes motion wait for user response (see UIRESUME)
% uiwait(handles.GUI2);


% --- Outputs from this function are returned to the command line.
function varargout = motion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Upload2Image.
function Upload2Image_Callback(hObject, eventdata, handles)
% hObject    handle to Upload2Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[baseFileName, folder] = uigetfile({'*.*';'*.png';'*.jpg';'*.bmp'}); 
if baseFileName == 0
  %User clicked the Cancel button.
  return;
end
fullFileName = fullfile(folder, baseFileName);
b=imread(fullFileName);
axes(handles.axes3);
imshow(b);
setappdata(0,'b',b)

% --- Executes on button press in Apply.
function Apply_Callback(hObject, eventdata, handles)
% hObject    handle to Apply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b=getappdata(0,'b');
a=getappdata(0,'a');
img1=a;
img2=b;
if b==0 
    msgbox("Please Upload an Image Frist");
    return;
end 
SubtractImage = motion2Images(img1,img2);
axes(handles.axes3);
setappdata(0,'b',SubtractImage)
imshow(SubtractImage);



% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b=getappdata(0,'b');
if b==0 
    msgbox("Please Upload an Image Frist");
    return;
end 

startingFolder = userpath;
defaultFileName = fullfile(startingFolder, '*.*');
[baseFileName, folder] = uiputfile(defaultFileName, 'Specify a file');
if baseFileName == 0
  %User clicked the Cancel button.
  return;
end
fullFileName = fullfile(folder, baseFileName);
imwrite(b, fullFileName)


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --------------------------------------------------------------------
function uitoggletool4_OffCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c = uisetcolor('Select a color');
if c==0
                 % User clicked cancel. Bail out.
      return;
end
handles.GUI2.Color=c;


% --------------------------------------------------------------------
function uitoggletool4_OnCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c = uisetcolor('Select a color');
 if c==0
                 % User clicked cancel. Bail out.
               return;
 end
handles.GUI2.Color=c;



% --------------------------------------------------------------------
function uitoggletool4_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Back.
function Back_Callback(hObject, eventdata, handles)
% hObject    handle to Back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close()
%open('untitled.fig');
% set(untitled, 'Visible', 'On')
untitled(handles);

% --- Executes when user attempts to close GUI2.
function GUI2_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to GUI2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
b=getappdata(0,'b');
b=0;
setappdata(0,'b',b)
