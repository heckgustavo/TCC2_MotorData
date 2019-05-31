function plot_filter(dataset,n)
    clf
    close all
    hold on 
    
    tensao = dataset(1);
    tensaof = tensao;
    corrente = dataset(2);
    correntef = corrente;
    
    
    tensaof.values = movmean(tensao.values,n);
    correntef.values = movmean(corrente.values, n);
    
    %SUBPLOT DA TENS�O:
    subplot(2,1,1);
    hold on
    plot_data(tensao,0);
    plot_data(tensaof,0);

    %Adicionar t�tulos e unidade dos eixos
    title('Tens�o');
    legend('N�o filtrada', 'Filtrada');
    
    %SUBPLOT DA CORRENTE:
    subplot(2,1,2);
    hold on
    plot_data(corrente,0);
    plot_data(correntef,0);
    
    %Adicionar t�tulos e unidade dos eixos
    title("Corrente");
    legend('N�o filtrada', 'Filtrada');
    
    hold off

end