function varargout = untitled(varargin)
%UNTITLED MATLAB code file for untitled.GUI
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to untitled_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      UNTITLED('CALLBACK') and UNTITLED('CALLBACK',hObject,...) call the
%      local function named CALLBACK in UNTITLED.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 19-May-2022 12:52:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.GUI);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in FiltersSpatial.
function FiltersSpatial_Callback(hObject, eventdata, handles)
% hObject    handle to FiltersSpatial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FiltersSpatial contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FiltersSpatial
allItems=handles.FiltersSpatial.String;     % A cell array of all strings in the popup.
selectedIndex = handles.FiltersSpatial.Value; % An integer saying which item has been selected.
selectedItem = allItems{selectedIndex};

a=getappdata(0,'a');

if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 

Filtered_Image=a;
switch selectedItem
    case 'SharpenFilter1StDrivative'
           Filtered_Image =first_derv(Filtered_Image);
          
    case 'SharpenFilter2ndDrivative'
        Filtered_Image =derivative2(Filtered_Image);
    case 'MedianFilter'
        k=inputdlg('Enter The Value of WindowSize : ',' Constant Value ',[1 50]); 
        if isempty(k)
                 % User clicked cancel. Bail out.
              return;
        end
      k=str2double(k);
      while(isnan(k))
       uiwait(msgbox("Please enter the Data ")); 

        k=inputdlg('Enter The Value of K: ',' Constant Value ',[1 50]); 
        k=str2double(k);
        if isempty(k) 
                 % User clicked cancel. Bail out.
                 return;
        end 
      end 
        Filtered_Image = MedianImage(Filtered_Image,k);

    case 'AverageFilter'
        k=inputdlg('Enter The Value of WindowSize : ',' Constant Value ',[1 50]); 
        if isempty(k)
                 % User clicked cancel. Bail out.
              return;
        end
        k=str2double(k);
      while(isnan(k))
       uiwait(msgbox("Please enter the Data ")); 
        
        k=inputdlg('Enter The Value of K: ',' Constant Value ',[1 50]); 
        k=str2double(k);
        if isempty(k) 
                 % User clicked cancel. Bail out.
                 return;
        end 
      end 
        Filtered_Image =average(Filtered_Image,k);

end 

axes(handles.axes1);
imshow(uint8(Filtered_Image));



% --- Executes during object creation, after setting all properties.
function FiltersSpatial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FiltersSpatial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in GrayLevelSlicing.
function GrayLevelSlicing_Callback(hObject, eventdata, handles)
% hObject    handle to GrayLevelSlicing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns GrayLevelSlicing contents as cell array
%        contents{get(hObject,'Value')} returns selected item from GrayLevelSlicing
allItems = handles.GrayLevelSlicing.String;     % A cell array of all strings in the popup.
selectedIndex = handles.GrayLevelSlicing.Value; % An integer saying which item has been selected.
selectedItem = allItems{selectedIndex};
a=getappdata(0,'a');
if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 

gray_slicing1_Image=a;
prompt = {'Enter The Maxmiun Value:','Enter The Minium Value:'};
dlgtitle = 'Input';
answer=inputdlg(prompt,dlgtitle,[1 50]);
if isempty(answer)
                 % User clicked cancel. Bail out.
              return;
end
while(isempty(answer{1})||isempty(answer{2}))
       uiwait(msgbox("Please enter the Data ")); 
        
        answer=inputdlg(prompt,dlgtitle,[1 50]);
        if isempty(answer) 
                 % User clicked cancel. Bail out.
                 return;
        end 
 end 
max=str2double(answer{1});
min=str2double(answer{2});
if selectedItem == 'Approach1'
    
    gray_slicing1_Image=gray_slicing1(gray_slicing1_Image,min,max);
    
else
    
    gray_slicing1_Image=gray_slicing2(gray_slicing1_Image,min,max);
    
end
axes(handles.axes1);
imshow(gray_slicing1_Image);



% --- Executes during object creation, after setting all properties.
function GrayLevelSlicing_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GrayLevelSlicing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Contrast.
function Contrast_Callback(~, eventdata, handles)
% hObject    handle to Contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 
prompt = {'Enter The Maxmiun Value of S:','Enter The Minium Value of S:'};
dlgtitle = 'Input';
answer=inputdlg(prompt,dlgtitle,[1 50]); 
if isempty(answer) 
                 % User clicked cancel. Bail out.
             return;
end            

while(isempty(answer{1})||isempty(answer{2}))
       uiwait(msgbox("Please enter the Data ")); 
        
        answer=inputdlg(prompt,dlgtitle,[1 50]);
        if isempty(answer) 
                 % User clicked cancel. Bail out.
                 return;
        end 
 end 


 s_max=str2double(answer{1});
 s_min=str2double(answer{2});
 ContrastImage=a;
 ContrastImage=contrastStretching(ContrastImage,s_max,s_min);
 axes(handles.axes1);
 imshow(ContrastImage);







% --- Executes on button press in Thresholding.
function Thresholding_Callback(hObject, eventdata, handles)
% hObject    handle to Thresholding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
if a==0
    msgbox("Please Upload an Image Frist");
    return;
end 
k=inputdlg('Enter The Value of K: ',' Constant Value ',[1 50]); 
if isempty(k)
   % User clicked cancel. Bail out.
   return;
end
k=str2double(k);
while(isnan(k))
       uiwait(msgbox("Please enter the Data ")); 
        
        k=inputdlg('Enter The Value of K: ',' Constant Value ',[1 50]); 
        k=str2double(k);
        if isempty(k) 
                 % User clicked cancel. Bail out.
                 return;
        end 
 end 
% k=str2double(k);

ThresholdingImage=a;
ThresholdingImage=thresholding(ThresholdingImage,k);
axes(handles.axes1);
imshow(ThresholdingImage);


% --- Executes on button press in SubSampling.
function SubSampling_Callback(hObject, eventdata, handles)
% hObject    handle to SubSampling (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a=getappdata(0,'a');
if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 

f=inputdlg('Enter The SamplingFactor Value',' Constant Value ',[1 50]); 
if isempty(f)
   % User clicked cancel. Bail out.
   return;
end
f=str2double(f);
while(isnan(f))
       uiwait(msgbox("Please enter the Data ")); 
       
        f=inputdlg('Enter The Value of K: ',' Constant Value ',[1 50]);
        f=str2double(f);
        if isempty(f) 
                 % User clicked cancel. Bail out.
                 return;
        end 
 end 

SubSampliedImage=a;
[r,c]=size(SubSampliedImage);
disp(r);
disp(c);
SubSampliedImage=SubSampling(SubSampliedImage,f);
axes(handles.axes1);
imshow(SubSampliedImage);
[r2,c2]=size(SubSampliedImage);
disp(r2);
disp(c2);


% --- Executes on button press in ReSamplingUp.
function ReSamplingUp_Callback(hObject, eventdata, handles)
% hObject    handle to ReSamplingUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 
f=inputdlg('Enter The SamplingFactor Value',' Constant Value ',[1 50]); 
if isempty(f)
   % User clicked cancel. Bail out.
   return;
end
f=str2double(f);
while(isnan(f))
       uiwait(msgbox("Please enter the Data ")); 
        
        f=inputdlg('Enter The Value of K: ',' Constant Value ',[1 50]);
        f=str2double(f);
        if isempty(f) 
                 % User clicked cancel. Bail out.
                 return;
        end 
 end 

ReSampliedUpImage=a;
[r2,c2]=size(ReSampliedUpImage);
disp(r2);
disp(c2);
ReSampliedUpImage=resamplingUp(ReSampliedUpImage,f);
axes(handles.axes1);
imshow(ReSampliedUpImage);
[r,c]=size(ReSampliedUpImage);
disp(r);
disp(c);




% --- Executes on button press in GrayLevel.
function GrayLevel_Callback(hObject, eventdata, handles)
% hObject    handle to GrayLevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 
c=inputdlg('Enter The Grey-level resolution Value',' Constant Value ',[1 50]); 
if isempty(c)
   % User clicked cancel. Bail out.
   return;
end
c=str2double(c);
while(isnan(c))
       uiwait(msgbox("Please enter the Data ")); 
        
        c=inputdlg('Enter The Value of K: ',' Constant Value ',[1 50]);
        c=str2double(c);
        if isempty(c) 
                 % User clicked cancel. Bail out.
                 return;
        end 
end 

GrayLevelImage=a;
GrayLevelImage=GrayLevel(GrayLevelImage,c);
axes(handles.axes1);
imshow(GrayLevelImage);


% --- Executes on button press in Log.
function Log_Callback(hObject, eventdata, handles)
% hObject    handle to Log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
if a==0
    msgbox("Please Upload an Image Frist");
    return;
end 
c=inputdlg('Enter The Constant Value',' Constant Value ',[1 50]); 
if isempty(c)
                 % User clicked cancel. Bail out.
              return;
end
c=str2double(c);
while(isnan(c))
       uiwait(msgbox("Please enter the Data ")); 
        
        c=inputdlg('Enter The Value of K: ',' Constant Value ',[1 50]);
        c=str2double(c);
        if isempty(c) 
                 % User clicked cancel. Bail out.
                 return;
        end 
end 

logImage=a;
logImage=logarithmic(logImage,c);
axes(handles.axes1);
imshow(logImage);


% --- Executes on button press in Power.
function Power_Callback(hObject, eventdata, handles)
% hObject    handle to Power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
if a==0
    msgbox("Please Upload an Image Frist");
    return;
end 
prompt = {'Enter The C Constant Value:','Enter The Gama Constant Value:'};
dlgtitle = 'Input';
answer=inputdlg(prompt,dlgtitle,[1 50]); 
if isempty(answer)
   % User clicked cancel. Bail out.
   return;
end
while(isempty(answer{1})||isempty(answer{2}))
       uiwait(msgbox("Please enter the Data ")); 
        answer=inputdlg(prompt,dlgtitle,[1 50]);
        if isempty(answer) 
                 % User clicked cancel. Bail out.
                 return;
        end 
 end 

c=str2double(answer{1});
g=str2double(answer{2});
PowerImage=a;
PowerImage=powerLaw(PowerImage,c,g);
axes(handles.axes1);
imshow(PowerImage);


% --- Executes on button press in BitPlanSlicing.
function BitPlanSlicing_Callback(hObject, eventdata, handles)
% hObject    handle to BitPlanSlicing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a=getappdata(0,'a');
if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 
BitPlane=a;
[rows cols] = size (BitPlane);
newImage = zeros(rows , cols , 8);
figure;
for k= 1:8 
   for row_index = 1:rows
      for col_index = 1:cols
          newImage(row_index,col_index ,k)= bitget(BitPlane(row_index,col_index),k);     
      end

   end
subplot(2,5,k+1) 
imshow(newImage(:,:,k));
title("   Image for bit number    "+k)


end




% --- Executes on button press in Adding.
function Adding_Callback(hObject, eventdata, handles)
% hObject    handle to Adding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
if a==0
    msgbox("Please Upload an Image Frist");
    return;
end 
c=inputdlg('Enter The Constant Value',' Constant Value ',[1 50]); 
if isempty(c) 
   % User clicked cancel. Bail out.
   return;
end
c=str2double(c);
while(isnan(c))
       uiwait(msgbox("Please enter the Data ")); 

        c=inputdlg('Enter The Value of K: ',' Constant Value ',[1 50]);
        c=str2double(c);
        if isempty(c) 
                 % User clicked cancel. Bail out.
                 return;
        end 
end 

AddingImage=a;
AddingImage=Addition(AddingImage,c);
axes(handles.axes1);
imshow(AddingImage);


% --- Executes on button press in Subtraction.
function Subtraction_Callback(hObject, eventdata, handles)
% hObject    handle to Subtraction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 
c=inputdlg('Enter The Constant Value',' Constant Value ',[1 50]); 
if isempty(c)
   % User clicked cancel. Bail out.
   return;
end
c=str2double(c);
while(isnan(c))
        uiwait(msgbox("Please enter the Data ")); 
       
        c=inputdlg('Enter The Value of K: ',' Constant Value ',[1 50]);
        c=str2double(c);
        if isempty(c) 
                 % User clicked cancel. Bail out.
                 return;
        end 
end 

SubtractionImage=a;
SubtractionImage=subtraction(SubtractionImage,c);
axes(handles.axes1);
imshow(SubtractionImage);



% --- Executes on button press in Upload.
function Upload_Callback(hObject, eventdata, handles)
% hObject    handle to Upload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[baseFileName, folder] = uigetfile({'*.*';'*.jpg';'*.png'},'Select an image'); 
fullFileName = fullfile(folder, baseFileName);
if baseFileName == 0
  %User clicked the Cancel button.
  return;
end
a=imread(fullFileName);
 
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a)



% --- Executes on button press in RgbToGray.
function RgbToGray_Callback(hObject, eventdata, handles)
% hObject    handle to RgbToGray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 
if size(a,3)~=3
    msgbox("The Image Is GrayScale Indeed");
    return;
end 
agray=rgb2gray(a);

axes(handles.axes1);
imshow(agray);


% --- Executes on button press in Histogram.
function Histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
if a==0
    msgbox("Please Upload an Image Frist");
    return;
end 
ahist=a;
axes(handles.axes1);
draw_histogram(ahist);




% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a=getappdata(0,'a');
if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 
axes(handles.axes1);
imshow(a);


% --- Executes on button press in Negative.
function Negative_Callback(hObject, eventdata, handles)
% hObject    handle to Negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 
acomp=a;
acomp=negative(acomp);
axes(handles.axes1);
imshow(acomp);


% --- Executes on button press in Save_Changes.
function Save_Changes_Callback(hObject, eventdata, handles)
% hObject    handle to Save_Changes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% F=getframe(handles.axes1);
% W=frame2im(F);
a=getappdata(0,'a');
if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 
hChildAxes2 = get(handles.axes1,'Children');
W = get(hChildAxes2(1),'CData');
setappdata(0,'a',W)
uiwait(msgbox("Changes saved"));





function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object deletion, before destroying properties.
function axes1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
if a==0
    msgbox("Please Upload an Image Frist");
    return;
end 
startingFolder = userpath;
defaultFileName = fullfile(startingFolder, '*.*');
[baseFileName, folder] = uiputfile(defaultFileName, 'Specify a file');
if baseFileName == 0
  % User clicked the Cancel button.
  return;
end
fullFileName = fullfile(folder, baseFileName);
imwrite(a, fullFileName);


% --------------------------------------------------------------------
function uitoggletool6_OnCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c = uisetcolor('Select a color');
if c==0
                 % User clicked cancel. Bail out.
               return;
 end
handles.GUI.Color=c;


% --------------------------------------------------------------------
function uitoggletool6_OffCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c = uisetcolor('Select a color');
if c==0
                 % User clicked cancel. Bail out.
               return;
 end
handles.GUI.Color=c;


% --- Executes on selection change in SmoothFrequancy.
function SmoothFrequancy_Callback(hObject, eventdata, handles)
% hObject    handle to SmoothFrequancy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SmoothFrequancy contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SmoothFrequancy
allItems=handles.SmoothFrequancy.String;     % A cell array of all strings in the popup.
selectedIndex = handles.SmoothFrequancy.Value; % An integer saying which item has been selected.
selectedItem = allItems{selectedIndex};
a=getappdata(0,'a');
if a==0
    msgbox("Please Upload an Image Frist");
    return;
end 
SmoothFiltered_Image=a;
     k=inputdlg('Enter The Value of  the Cut-off Frequency   : ',' Constant Value ',[1 50]); 
          if isempty(k)
                 % User clicked cancel. Bail out.
               return;
           end
               k=str2double(k);
      while(isnan(k))
       uiwait(msgbox("Please enter the Data ")); 
        k=inputdlg('Enter The Value of K: ',' Constant Value ',[1 50]);
        k=str2double(k);
        if isempty(k) 
                 % User clicked cancel. Bail out.
                 return;
        end 
      end 
switch selectedItem
    case 'IdealLowPassFilter'
       SmoothFiltered_Image =ILPF(SmoothFiltered_Image,k);  
    case 'ButterworthLowPassFilter'     
        SmoothFiltered_Image =BLPF(SmoothFiltered_Image,k);
    case 'GaussianLowPassFilter'
        SmoothFiltered_Image = GLPF(SmoothFiltered_Image,k);

end 

axes(handles.axes1);
imshow(uint8(SmoothFiltered_Image));


% --- Executes during object creation, after setting all properties.
function SmoothFrequancy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SmoothFrequancy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SharpingFrequancy.
function SharpingFrequancy_Callback(hObject, eventdata, handles)
% hObject    handle to SharpingFrequancy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SharpingFrequancy contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SharpingFrequancy

allItems=handles.SharpingFrequancy.String;     % A cell array of all strings in the popup.
selectedIndex = handles.SharpingFrequancy.Value; % An integer saying which item has been selected.
selectedItem = allItems{selectedIndex};
a=getappdata(0,'a');
if a==0
    msgbox("Please Upload an Image Frist");
    return;
end 
SharpingFiltered_Image=a;
     k=inputdlg('Enter The Value of  the Cut-off Frequency   : ',' Constant Value ',[1 50]); 
          if isempty(k)
                 % User clicked cancel. Bail out.
               return;
           end
               k=str2double(k);
      while(isnan(k))
       uiwait(msgbox("Please enter the Data ")); 
        k=inputdlg('Enter The Value of K: ',' Constant Value ',[1 50]);
        k=str2double(k);
        if isempty(k) 
                 % User clicked cancel. Bail out.
                 return;
        end 
      end 

switch selectedItem
    case 'IdealHighPassFilter'
  
      SharpingFiltered_Image =IHPF(SharpingFiltered_Image,k);
          
    case 'ButterworthHighPassFilter'
   
        SharpingFiltered_Image =BHPF(SharpingFiltered_Image,k);
    case 'GaussianHighPassFilter'
       
        SharpingFiltered_Image =GHPF(SharpingFiltered_Image,k);

end 

axes(handles.axes1);
imshow(uint8(SharpingFiltered_Image));

% --- Executes during object creation, after setting all properties.
function SharpingFrequancy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SharpingFrequancy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in motion.
function motion_Callback(hObject, eventdata, handles)
% hObject    handle to motion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% setappdata(0,'a',a)
% open('motion.fig');
%close ()
a=getappdata(0,'a');
if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 
 set(gcf, 'Visible', 'Off')
%  close()
motion(handles);

 
 

% --------------------------------------------------------------------
function uitoggletool6_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close GUI.
function GUI_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to GUI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
a=getappdata(0,'a');
a=0;
setappdata(0,'a',a)


% --- Executes on button press in Masking.
function Masking_Callback(hObject, eventdata, handles)
% hObject    handle to Masking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a=getappdata(0,'a');

if a==0
    msgbox("Please Upload an Image Frist");
    return;
end 
fontSize = 13;
grayImage=a;

uiwait(msgbox(sprintf('Left click and hold to begin drawing.\nSimply lift the mouse button to finish')));
hFH = imfreehand();
% Create a binary image ("mask") from the ROI object.
binaryImage = hFH.createMask();

axes(handles.axes1);
imshow(binaryImage);
title(' Lgical Mask  Image', 'FontSize', fontSize,'Color',[1 1 1]);
pause(2);
% Mask the image and display it.
% %Will keep only the part of the image that's inside the mask, zero outside mask.
blackMaskedImage = grayImage;
blackMaskedImage(~binaryImage) = 0;

% subplot(3, 1, 3);
axes(handles.axes1);
imshow(blackMaskedImage);
title('Masked Image ', 'FontSize', fontSize,'Color',[1 1 1]);


% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiwait(msgbox('Thank you for using our app'));
close();


% --- Executes on selection change in MinMax.
function MinMax_Callback(hObject, eventdata, handles)
% hObject    handle to MinMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
allItems = handles.MinMax.String;     % A cell array of all strings in the popup.
selectedIndex = handles.MinMax.Value; % An integer saying which item has been selected.
selectedItem = allItems{selectedIndex};
a=getappdata(0,'a');
if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 

min_max_Image=a;
if selectedItem == 'MinFilter'
    
      min_max_Image=minimum_filter(min_max_Image);
    
else
    
      
 min_max_Image=maximum_filter(min_max_Image);
    
end
axes(handles.axes1);
imshow(min_max_Image);


% Hints: contents = cellstr(get(hObject,'String')) returns MinMax contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MinMax


% --- Executes during object creation, after setting all properties.
function MinMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MinMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Equalization.
function Equalization_Callback(hObject, eventdata, handles)
% hObject    handle to Equalization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
if a==0 
    msgbox("Please Upload an Image Frist");
    return;
end 
equalization=a;
equalization=histo_equalization(equalization);
axes(handles.axes1);
imshow(equalization);


