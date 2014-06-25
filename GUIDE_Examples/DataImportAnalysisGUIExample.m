function varargout = DataImportAnalysisGUIExample(varargin)
% DATAIMPORTANALYSISGUIEXAMPLE MATLAB code for DataImportAnalysisGUIExample.fig
%      DATAIMPORTANALYSISGUIEXAMPLE, by itself, creates a new DATAIMPORTANALYSISGUIEXAMPLE or raises the existing
%      singleton*.
%
%      H = DATAIMPORTANALYSISGUIEXAMPLE returns the handle to a new DATAIMPORTANALYSISGUIEXAMPLE or the handle to
%      the existing singleton*.
%
%      DATAIMPORTANALYSISGUIEXAMPLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATAIMPORTANALYSISGUIEXAMPLE.M with the given input arguments.
%
%      DATAIMPORTANALYSISGUIEXAMPLE('Property','Value',...) creates a new DATAIMPORTANALYSISGUIEXAMPLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DataImportAnalysisGUIExample_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DataImportAnalysisGUIExample_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DataImportAnalysisGUIExample

% Last Modified by GUIDE v2.5 15-Jun-2014 20:07:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DataImportAnalysisGUIExample_OpeningFcn, ...
                   'gui_OutputFcn',  @DataImportAnalysisGUIExample_OutputFcn, ...
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


% --- Executes just before DataImportAnalysisGUIExample is made visible.
function DataImportAnalysisGUIExample_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DataImportAnalysisGUIExample (see VARARGIN)

% Choose default command line output for DataImportAnalysisGUIExample
handles.output = hObject;


set(handles.comp,'Visible','off');
set(handles.CorPlot,'Visible','off');
set(handles.analyOpts,'Enable','off');
set(handles.pText,'Visible','off');
set(handles.PearText,'Visible','off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DataImportAnalysisGUIExample wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DataImportAnalysisGUIExample_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in fList.
function fList_Callback(hObject, eventdata, handles)
% hObject    handle to fList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns fList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from fList

cla(handles.Plot)

cd(handles.directory)

fileNames = cellstr(get(hObject,'String'));

handles.file2load = fileNames{get(hObject,'Value')};

handles.Data = readtable(handles.file2load);

set(handles.comp,'Visible','on');

set(handles.sulf,'Value',0);

guidata(hObject, handles);






% --- Executes during object creation, after setting all properties.
function fList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function fileOpts_Callback(hObject, eventdata, handles)
% hObject    handle to fileOpts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function loadDir_Callback(hObject, eventdata, handles)
% hObject    handle to loadDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.directory = 'C:\Users\Dr. JT\Dropbox\MatlabClassTemp\xlsData';

cd(handles.directory)

dirNames = dir('*.xlsx');
fileNames = {dirNames.name};

set(handles.fList,'String',fileNames);

guidata(hObject, handles);


% --- Executes when selected object is changed in comp.
function comp_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in comp 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

newVal = get(eventdata.NewValue,'Tag');

axes(handles.Plot)
switch newVal % Get Tag of selected object.
    case 'sulf'
        handles.Cvalue = 'sulfate';
        hist(handles.Data.sulfate)
        title(handles.Cvalue)
        ylabel('Sulfate count')
    case 'nit'
        handles.Cvalue = 'nitrate';
        hist(handles.Data.nitrate)
        title(handles.Cvalue)
        ylabel('Nitrate count')
end

set(handles.histBin,'Enable','on');
set(handles.analyOpts,'Enable','on');

guidata(hObject, handles);


% --- Executes on slider movement.
function histBin_Callback(hObject, eventdata, handles)
% hObject    handle to histBin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

getValue = get(hObject,'Value');

binSize = round(getValue);

% set(handles.cellVal,'String', num2str(roundVal));
% updateVal = get(handles.cellVal,'String');
% set(hObject,'Value', str2double(updateVal));

axes(handles.Plot)
hist(handles.Data.(handles.Cvalue),binSize)

set(handles.binS,'String',num2str(binSize))

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function histBin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to histBin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

set(hObject,'Enable','off');

set(hObject, 'SliderStep', [0.07 0.2])
set(hObject,'Min',5)
set(hObject,'Max',100)
set(hObject,'Value',5)


% --------------------------------------------------------------------
function analyOpts_Callback(hObject, eventdata, handles)
% hObject    handle to analyOpts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function pCorr_Callback(hObject, eventdata, handles)
% hObject    handle to pCorr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.CorPlot,'Visible','on')
axes(handles.CorPlot);
plot(handles.Data.sulfate,handles.Data.nitrate,'r.','LineWidth',2);
[handles.rval,handles.pval] = corr(handles.Data.sulfate,handles.Data.nitrate);
ylabel('Nitrate')
xlabel('Sulfate')

set(handles.pText,'Visible','on');
set(handles.PearText,'Visible','on');
set(handles.corValue,'String',num2str(handles.pval));
set(handles.rValue,'String',num2str(handles.rval));

guidata(hObject, handles);
