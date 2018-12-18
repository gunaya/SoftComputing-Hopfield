function varargout = hopfield(varargin)
% HOPFIELD MATLAB code for hopfield.fig
%      HOPFIELD, by itself, creates a new HOPFIELD or raises the existing
%      singleton*.
%
%      H = HOPFIELD returns the handle to a new HOPFIELD or the handle to
%      the existing singleton*.
%
%      HOPFIELD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOPFIELD.M with the given input arguments.
%
%      HOPFIELD('Property','Value',...) creates a new HOPFIELD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hopfield_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hopfield_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hopfield

% Last Modified by GUIDE v2.5 16-Dec-2018 15:57:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hopfield_OpeningFcn, ...
                   'gui_OutputFcn',  @hopfield_OutputFcn, ...
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


% --- Executes just before hopfield is made visible.
function hopfield_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hopfield (see VARARGIN)

% Choose default command line output for hopfield
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hopfield wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hopfield_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function targetA_Callback(hObject, eventdata, handles)
% hObject    handle to targetA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of targetA as text
%        str2double(get(hObject,'String')) returns contents of targetA as a double
    target = get(handles.targetA, 'String');
    targetA = strsplit(target);
    
    setappdata(handles.targetA, 'targetA', targetA);

% --- Executes during object creation, after setting all properties.
function targetA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to targetA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function targetB_Callback(hObject, eventdata, handles)
% hObject    handle to targetB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of targetB as text
%        str2double(get(hObject,'String')) returns contents of targetB as a double
    target = get(handles.targetB, 'String');
    targetB = strsplit(target);
    
    setappdata(handles.targetB, 'targetB', targetB);

% --- Executes during object creation, after setting all properties.
function targetB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to targetB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputA_Callback(hObject, eventdata, handles)
% hObject    handle to inputA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputA as text
%        str2double(get(hObject,'String')) returns contents of inputA as a double
    input = get(handles.inputA, 'String');
    inputA = strsplit(input);
    
    setappdata(handles.inputA, 'inputA', inputA);
    
    


% --- Executes during object creation, after setting all properties.
function inputA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in prosesBtn.
function prosesBtn_Callback(hObject, eventdata, handles)
% hObject    handle to prosesBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.aktivasi, 'string', '');
set(handles.ft, 'string','');
set(handles.analisa, 'string', '');
set(handles.text_hasil, 'string', '');
set(handles.aktivasi_a, 'string', '');
set(handles.ft_a, 'string','');
set(handles.analisa_a, 'string', '');
set(handles.hasil_a, 'string', '');

    target_A = getappdata(handles.targetA, 'targetA');
    target_B = getappdata(handles.targetB, 'targetB');
    inputA = getappdata(handles.inputA, 'inputA');
    length = getappdata(handles.length, 'panjang');
    
    bobot = zeros(4);
    latihA = str2double(target_A);
    latihB = str2double(target_B);
    inputA = str2double(inputA);
    
    %membuat nilai bobot
    if latihA == latihB
        for i = 1:length
           for j = 1:length
               if i == j
                   bobot(i,j) = 0;
               else
                   bobot(i,j) = (latihA(i)*latihA(j)) + (latihB(i)*latihB(j));
                   %bobot(i,j) = (2*latihA(i) -1) + (2*latihB(j) -1);
                   %bobot(i,j) = 1/2 * ((latihA(i)*latihA(j)) + (latihB(i)*latihB(j)));
               end
           end    
        end
    else
        for i = 1:length
           for j = 1:length
               if i == j
                   bobot(i,j) = 0;
               else
                   %bobot(i,j) = (latihA(i)*latihA(j)) + (latihB(i)*latihB(j));
                   %bobot(i,j) = (2*latihA(i) -1) + (2*latihB(j) -1);
                   bobot(i,j) = 1/2 * ((latihA(i)*latihA(j)) + (latihB(i)*latihB(j)));
               end
           end    
        end
    end
    
    set(handles.tabel_bobot, 'data', bobot);
    
    %perhitungan 
    %for a = 1:length
    %    hasil_hitung(a) = 0;
    %    for b = 1:length
    %        hitung(a,b) = inputA(b)*bobot(a,b);
    %        hasil_hitung(a) = hasil_hitung(a) + hitung(a,b);
    %    end
    %end
    for i = 1:length
        hasil(i) = inputA(i) + (inputA(1)*bobot(i,1) + inputA(2)*bobot(i,2) + inputA(3)*bobot(i,3) + inputA(4)*bobot(i,4));
        %hasil(i) = inputA(i) + hasil_hitung(i);
        if hasil(i) > 0
            ft(i) = 1;
        else
            ft(i) = -1;
        end
    end    
    
    aktivasi = num2str(hasil);
    fto = num2str(ft);
    set(handles.aktivasi, 'string', aktivasi);
    set(handles.ft, 'string', fto);
    
    if ft == latihA & ft == latihB
        set(handles.analisa, 'string', 'Metode Synchonous Berhasil Mengenali Pola');
        set(handles.text_hasil, 'string', 'Pola Uji Sama Dengan Pola Latih A dan Pola Latih B');
    elseif ft == latihA 
        set(handles.analisa, 'string', 'Metode Synchonous Berhasil Mengenali Pola');
        set(handles.text_hasil, 'string', 'Pola Uji Sama Dengan Pola Latih A');
    elseif ft == latihB
        set(handles.analisa, 'string', 'Metode Synchonous Berhasil Mengenali Pola');
        set(handles.text_hasil, 'string', 'Pola Uji Sama Dengan Pola Latih B');
    else
        asinkronus(handles, length, bobot, inputA, latihA, latihB);
        set(handles.analisa, 'string', 'Metode Synchonous Gagal Mengenali Pola');
        set(handles.text_hasil, 'string', 'Pola Uji Tidak Sama Dengan Pola Latih A ataupun Pola Latih B')
    end
    
    
    function hasil_uji = asinkronus(handles, length, bobot, input, latihA, latihB)
        for i = 1:length
            hasil(i) = input(i) + (input(1)*bobot(i,1) + input(2)*bobot(i,2) + input(3)*bobot(i,3) + input(4)*bobot(i,4));
            if hasil(i) > 0
                input(i) = 1;
            else
                input(i) = -1;
            end
        end
        
        aktivasi = num2str(hasil);
        fto = num2str(input);
        set(handles.aktivasi_a, 'string', aktivasi);
        set(handles.ft_a, 'string', fto);

        if input == latihA & input == latihB
            set(handles.analisa_a, 'string', 'Metode Asynchonous Berhasil Mengenali Pola');
            set(handles.hasil_a, 'string', 'Pola Uji Sama Dengan Pola Latih A dan Pola Latih B');
        elseif input == latihA 
            set(handles.analisa_a, 'string', 'Metode Asynchonous Berhasil Mengenali Pola');
            set(handles.hasil_a, 'string', 'Pola Uji Sama Dengan Pola Latih A');
        elseif input == latihB
            set(handles.analisa_a, 'string', 'Metode Asynchonous Berhasil Mengenali Pola');
            set(handles.hasil_a, 'string', 'Pola Uji Sama Dengan Pola Latih B');
        else
            set(handles.analisa_a, 'string', 'Metode Asynchonous Gagal Mengenali Pola');
            set(handles.hasil_a, 'string', 'Pola Uji Tidak Sama Dengan Pola Latih A ataupun Pola Latih B')
        end

function aktivasi_Callback(hObject, eventdata, handles)
% hObject    handle to aktivasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aktivasi as text
%        str2double(get(hObject,'String')) returns contents of aktivasi as a double


% --- Executes during object creation, after setting all properties.
function aktivasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aktivasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ft_Callback(hObject, eventdata, handles)
% hObject    handle to ft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ft as text
%        str2double(get(hObject,'String')) returns contents of ft as a double


% --- Executes during object creation, after setting all properties.
function ft_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function length_Callback(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of length as text
%        str2double(get(hObject,'String')) returns contents of length as a double
    input = get(handles.length, 'String');
    panjang = str2double(input);
    
    setappdata(handles.length, 'panjang', panjang);

% --- Executes during object creation, after setting all properties.
function length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function aktivasi_a_Callback(hObject, eventdata, handles)
% hObject    handle to aktivasi_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aktivasi_a as text
%        str2double(get(hObject,'String')) returns contents of aktivasi_a as a double


% --- Executes during object creation, after setting all properties.
function aktivasi_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aktivasi_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ft_a_Callback(hObject, eventdata, handles)
% hObject    handle to ft_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ft_a as text
%        str2double(get(hObject,'String')) returns contents of ft_a as a double


% --- Executes during object creation, after setting all properties.
function ft_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ft_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
