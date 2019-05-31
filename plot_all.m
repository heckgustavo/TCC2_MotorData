function plot_all()
    clf
    close all
    D24 = evalin('base', 'D24');
    D12 = evalin('base', 'D12');
    D96 = evalin('base', 'D96');
    D72 = evalin('base', 'D72');
    
    hold on
    
    pos1 = [1, 5, 9, 13];
    pos2 = [2, 6, 10, 14];
    pos3 = [3, 7, 11, 15];
    pos4 = [4, 8, 12,16];
    
    for i = 1:length(D24)
        subplot(4,4,pos1(i));
        if(i == 3)
            D24(i) = encoder_data(D24);
            rpm = get_rpm(D24(i));
        end
        plot_data(D24(i), 0);
         legend('hide')
    end
        D24(i).values = rpm;
        D24(i).Vertical_Units = 'rpm';
        subplot(4,4,pos1(4))
        plot_data(D24(i),0);
        data=D24(i);
        axis([data.time(50),data.time(end),min(data.values)-1,max(data.values)+1000]);
        legend('hide')
        
        
        

        for i = 1:length(D12)
            subplot(4,4,pos2(i));
            if(i == 3)
                D12(i) = encoder_data(D12);
                rpm = get_rpm(D12(i));
            end
            plot_data(D12(i), 0);
            legend('hide')
        end
        D12(i).values = rpm;
        D12(i).Vertical_Units = 'rpm';
        subplot(4,4,pos2(4))
        plot_data(D12(i),0);
        data=D12(i);
        axis([data.time(50),data.time(end),min(data.values)-1,max(data.values)+1000]);
        legend('hide')
        
        
        for i = 1:length(D96)
            subplot(4,4,pos3(i));
            if(i == 3)
                D96(i) = encoder_data(D96);
                rpm = get_rpm(D96(i));
            end
            plot_data(D96(i), 0);
            legend('hide')
        end
        D96(i).values = rpm;
        D96(i).Vertical_Units = 'rpm';
        subplot(4,4,pos3(4))
        plot_data(D96(i),0);
        data=D96(i);
        axis([data.time(50),data.time(end),min(data.values)-1,max(data.values)+1000]);
        legend('hide')
        
        
        for i = 1:length(D72)
            subplot(4,4,pos4(i));
            if(i == 3)
                D72(i) = encoder_data(D72);
                rpm = get_rpm(D72(i));
            end
            plot_data(D72(i), 0);
            legend('hide')
            
        end
        D72(i).values = rpm;
        D72(i).Vertical_Units = 'rpm';
        subplot(4,4,pos4(4))
        plot_data(D72(i),0);
        data=D72(i);
        axis([data.time(50),data.time(end),min(data.values)-1,max(data.values)+1000]);
        legend('hide')
        
        title(subplot(4,4,1), 'Curvas para 24V');
        title(subplot(4,4,2), 'Curvas para 12V');
        title(subplot(4,4,3), 'Curvas para 9.6V');
        title(subplot(4,4,4), 'Curvas para 7.2V');
        
end
