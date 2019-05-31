function encoder_quadrado = encoder_data(data)
    encoder = data(3).values;
    encoder_quadrado = data(3);
    for i = 1:length(encoder)
       if(encoder(i) >= 0.5)
          valor = 5; 
       else
           valor = 0;
       end
       encoder_quadrado.values(i) =  valor;
    end
end