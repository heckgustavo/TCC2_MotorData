function  get_data()
    %%FUNÇÃO PARA OBTER OS DADOS DO OSCILOSCOPIO;
    %%NO CASO DE V = 24V, UTILIZA SOMENTE A ÚLTIMA AMOSTRA
    %%IGNORA A CURVA DE TENSÃO DO OSCILOSCOPIO 2
    
    %OBTER TENSOES
    D24(1) =read_tektronix_csv('24V3.CSV');
    D12(1) =read_tektronix_csv('12V.CSV');
    D96(1) =read_tektronix_csv('9.6V.CSV');
    D72(1) =read_tektronix_csv('7.2V.CSV');
    
    %OBTER CORRENTES
    D24(2) =read_tektronix_csv('24C3.CSV');
    D24(2).values = (D24(2).values)/4;
    D12(2) =read_tektronix_csv('12C.CSV');
    D12(2).values = (D12(2).values)/4;
    D96(2) =read_tektronix_csv('9.6C.CSV');
    D96(2).values = (D96(2).values)/4;
    D72(2) =read_tektronix_csv('7.2C.CSV');
    D72(2).values = (D72(2).values)/4;
    
    %OBTER TENSOES_OSC_2
%     D24(3) =read_tektronix_csv('24V3_2.CSV');
%     D12(3) =read_tektronix_csv('12V_2.CSV');
%     D96(3) =read_tektronix_csv('9.6V_2.CSV');
%     D72(3) =read_tektronix_csv('7.2V_2.CSV');
    
    %OBTER PULSOS_OSC_2
    D24(3) =read_tektronix_csv('24E3_2.CSV');
    D12(3) =read_tektronix_csv('12E_2.CSV');
    D96(3) =read_tektronix_csv('9.6E_2.CSV');
    D72(3) =read_tektronix_csv('7.2E_2.CSV');
    
    
    assignin('base','D24',D24);
    assignin('base','D12',D12);
    assignin('base','D96',D96);
    assignin('base','D72',D72);
end

