function varargout = PlotGUIExample(varargin)
% PLOTGUIEXAMPLE MATLAB code for PlotGUIExample.fig
%      PLOTGUIEXAMPLE, by itself, creates a new PLOTGUIEXAMPLE or raises the existing
%      singleton*.
%
%      H = PLOTGUIEXAMPLE returns the handle to a new PLOTGUIEXAMPLE or the handle to
%      the existing singleton*.
%
%      PLOTGUIEXAMPLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOTGUIEXAMPLE.M with the given input arguments.
%
%      PLOTGUIEXAMPLE('Property','Value',...) creates a new PLOTGUIEXAMPLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PlotGUIExample_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PlotGUIExample_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PlotGUIExample

% Last Modified by GUIDE v2.5 20-Jun-2014 21:49:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PlotGUIExample_OpeningFcn, ...
                   'gui_OutputFcn',  @PlotGUIExample_OutputFcn, ...
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


% --- Executes just before PlotGUIExample is made visible.
function PlotGUIExample_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PlotGUIExample (see VARARGIN)

% Choose default command line output for PlotGUIExample
handles.output = hObject;

handles.newTitle = '';
handles.newXlab = '';
handles.newYlab = '';
set(handles.redB,'Value',0); 
handles.Xplot = sort(rand(100,1));
handles.Yplot = sort(rand(100,1));
set(handles.Plot,'XTick',[],'YTick',[])
handles.Color = 'k';

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PlotGUIExample wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PlotGUIExample_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function title_Callback(hObject, eventdata, handles)
% hObject    handle to title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of title as text
%        str2double(get(hObject,'String')) returns contents of title as a double

handles.newTitle = get(hObject,'String');

axes(handles.Plot)

title(handles.newTitle)

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function title_CreateFcn(hObject, eventdata, handles)
% hObject    handle to title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function xlab_Callback(hObject, eventdata, handles)
% hObject    handle to xlab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xlab as text
%        str2double(get(hObject,'String')) returns contents of xlab as a double

handles.newXlab = get(hObject,'String');

axes(handles.Plot)

xlabel(handles.newXlab)

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function xlab_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xlab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ylab_Callback(hObject, eventdata, handles)
% hObject    handle to ylab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ylab as text
%        str2double(get(hObject,'String')) returns contents of ylab as a double

handles.newYlab = get(hObject,'String');

axes(handles.Plot)

ylabel(handles.newYlab)

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function ylab_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ylab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in axesTog.
function axesTog_Callback(hObject, eventdata, handles)
% hObject    handle to axesTog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of axesTog

toggleState = get(hObject,'Value');

if toggleState
    set(handles.Plot,'XTick',0:0.2:1,'YTick',0:0.2:1)
else
    set(handles.Plot,'XTick',[],'YTick',[]);
end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

plotTypes = cellstr(get(hObject,'String'));

plotChoice = plotTypes{get(hObject,'Value')};

switch plotChoice
    case 'Line'
        handles.PlotType = 'line';
        plot(handles.Xplot,handles.Yplot,'Color',handles.Color)
        title(handles.newTitle)
        ylabel(handles.newYlab)
        xlabel(handles.newXlab)
    case 'Dot'
        handles.PlotType = 'dot';
        plot(handles.Xplot,handles.Yplot,'.','Color',handles.Color)
        title(handles.newTitle)
        ylabel(handles.newYlab)
        xlabel(handles.newXlab)
end

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

newVal = get(eventdata.NewValue,'Tag');

switch newVal % Get Tag of selected object.
    case 'redB'
        handles.Color = 'r';
    case 'greenB'
        handles.Color = 'g';
    case 'blueB'
        handles.Color = 'b';
    case 'cyanB'
        handles.Color = 'c';
    otherwise
        % Code for when there is no match.
end

switch handles.PlotType
    case 'line'
        plot(handles.Xplot,handles.Yplot,'Color',handles.Color)
        title(handles.newTitle)
        ylabel(handles.newYlab)
        xlabel(handles.newXlab)
    case 'dot'
        plot(handles.Xplot,handles.Yplot,'.','Color',handles.Color)
        title(handles.newTitle)
        ylabel(handles.newYlab)
        xlabel(handles.newXlab)
end


guidata(hObject, handles);
