function plot_over(dataset)
    clf
    vmax = max(dataset(1).values);
    if(vmax>24)
        vmax='24';
    else
        if(vmax<24 && vmax > 12)
            vmax='12';
        else
            if(vmax<12 && vmax>9.6)
                vmax='9.6';
            else
                vmax='7.2';
            end
        end
    end
    close all
    data = dataset;
    hold on
    titulo = ['Curvas para tensão = ', vmax];
    for i = 1:length(data)
        if(i == 3)
            data(i)=encoder_data(data);
            rpm = get_rpm(data(i));
        end
        
        plot_data(data(i),0);        
       
    end
    
    if (length(data)>=3)
        data(3).values = rpm/250;
        plot_data(data(3),0);
    end
    
    %Adicionar t�tulos e unidade dos eixos
    eixo = gca;
    title(titulo);
    xlabel('t(ms)');
    ylabel(data(i).Vertical_Units);
    axis([data(1).time(50),data(1).time(end),min(data(1).values)-1,max(data(1).values)+1]);
    legend('V_m(t)','I_m(t)','V_e_n_c(t)', 'Velocidade(rpm/250)');
    
    %Ajustar detalhes do plot
    eixo.XAxis.Exponent = -3;
    eixo.XAxis.FontSize = 12;
    eixo.Title.FontSize = 12;
    
    %FontSize 15 para printar em tela cheia
    %FontSize 12 para visualizar minimizado
    
end