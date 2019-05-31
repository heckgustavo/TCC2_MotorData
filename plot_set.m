function plot_set(dataset)
    %FUN��O PARA PLOTAR UM CONJUNTO DE DADOS
    %USAR COMO INPUT(dataset) Dx, exemplo:
    %plot_set(D24) -> gera as curvas para corrente, tens�o e pulsos do
    %encoder para Vcc = 24v
    data=dataset;
    

    if(length(data) >=3)
        comprimento = 4;
        titulo = {'V_m(t)', 'I_m(t)', 'Encoder(t)', 'Velocidade(rpm)'};
    else
        comprimento = length(data);
        titulo = {'V_m(t)', 'I_m(t)', 'Encoder(t)'};
    end
    
    for i = 1:length(data)
        subplot(comprimento,1,i);
        if(i == 3)
            data(i)=encoder_data(data);
            rpm = get_rpm(data(i));
        end
        
        plot_data(data(i), titulo{i});
    end
    
    if (length(data)>=3)
        subplot(4,1,4);
        data(3).values = rpm;        
        plot_data(data(3),titulo{4});
    end
    
   
end