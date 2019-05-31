function plot_data(data,titulo)
    %%FUN��O PARA PLOTAR UM GR�FICO APENAS
    %%USAR Dx(N) como valor de entrada
    %%EX: D24(1) -> curva de tens�o para Vcc = 24v
    
    %%ALTERAR LINEWIDTH CASO NECESS�RIO
    plot(data.time,data.values, 'LineWidth', 1);
    axis([data.time(50),data.time(end),min(data.values)-mean(data.values)/2,max(data.values)+mean(data.values)/2]);
    eixo = gca;
    
    %Adicionar t�tulos e unidade dos eixos
    if(titulo ~=0)
        title(titulo);
    end
    xlabel('t', 'FontWeight', 'bold');
    ylabel(data.Vertical_Units, 'FontWeight', 'bold');
    
    
    %Ajustar detalhes do plot
    eixo.XAxis.Exponent = -3;
    eixo.XAxis.FontSize = 12;
    eixo.Title.FontSize = 12;
    legend([data.Vertical_Units, 'm(t)']);
    
    %FontSize 15 para printar em tela cheia
    %FontSize 12 para visualizar minimizado
end