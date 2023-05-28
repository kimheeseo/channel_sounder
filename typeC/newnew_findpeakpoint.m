  %corrleation peak¡Æ¨£ ?©¬??
    a=length(new_corr111(1,:)); 
    aa=find(abs(new_corr111(1,:))>30);
    clear max

    max_value=max(abs(new_corr111(1,a-51895:a-51885)));
    endpoint=find(max_value==abs(new_corr111(1,:)));
    
    max_value=max(abs(new_corr111(1, endpoint-40955:endpoint-40945)));
    endpoint1=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(endpoint,endpoint1);
    
    max_value=max(abs(new_corr111(1, endpoint1-40955:endpoint1-40945)));
    endpoint2=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint2);

    max_value=max(abs(new_corr111(1, endpoint2-40955:endpoint2-40945)));
    endpoint3=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint3);
    
    max_value=max(abs(new_corr111(1, endpoint3-40955:endpoint3-40945)));
    endpoint4=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint4);
    
    max_value=max(abs(new_corr111(1, endpoint4-40955:endpoint4-40945)));
    endpoint5=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint5);
    
    max_value=max(abs(new_corr111(1, endpoint5-40955:endpoint5-40945)));
    endpoint6=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint6);
    
    max_value=max(abs(new_corr111(1, endpoint6-40955:endpoint6-40945)));
    endpoint7=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint7);
    
    max_value=max(abs(new_corr111(1, endpoint7-40955:endpoint7-40945)));
    endpoint8=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint8);
    
    max_value=max(abs(new_corr111(1, endpoint8-40955:endpoint8-40945)));
    endpoint9=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint9);
    
    max_value=max(abs(new_corr111(1, endpoint9-40955:endpoint9-40945)));
    endpoint10=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint10);
    
    max_value=max(abs(new_corr111(1, endpoint10-40955:endpoint10-40945)));
    endpoint11=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint11);
    
    max_value=max(abs(new_corr111(1, endpoint11-40955:endpoint11-40945)));
    endpoint12=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint12);
    
    max_value=max(abs(new_corr111(1, endpoint12-40955:endpoint12-40945)));
    endpoint13=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint13);
    
    max_value=max(abs(new_corr111(1, endpoint13-40955:endpoint13-40945)));
    endpoint14=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint14);

    max_value=max(abs(new_corr111(1, endpoint14-40955:endpoint14-40945)));
    endpoint15=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint15);
    
    max_value=max(abs(new_corr111(1, endpoint15-40955:endpoint15-40945)));
    endpoint16=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint16);
    
    max_value=max(abs(new_corr111(1, endpoint16-40955:endpoint16-40945)));
    endpoint17=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint17);

    %%
    endpoint19=endpoint17-245850;
    endpoint=endpoint19;
    max_value=max(abs(new_corr111(1, endpoint-10:endpoint+10)));
    endpoint1=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(new_corr111(1, endpoint-40955:endpoint-40945)));
    endpoint1=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(new_corr111(1, endpoint1-40955:endpoint1-40945)));
    endpoint2=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint2);

    max_value=max(abs(new_corr111(1, endpoint2-40955:endpoint2-40945)));
    endpoint3=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint3);
    
    max_value=max(abs(new_corr111(1, endpoint3-40955:endpoint3-40945)));
    endpoint4=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint4);
    
    max_value=max(abs(new_corr111(1, endpoint4-40955:endpoint4-40945)));
    endpoint5=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint5);
    
    max_value=max(abs(new_corr111(1, endpoint5-40955:endpoint5-40945)));
    endpoint6=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint6);
    
    max_value=max(abs(new_corr111(1, endpoint6-40955:endpoint6-40945)));
    endpoint7=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint7);
    
    max_value=max(abs(new_corr111(1, endpoint7-40955:endpoint7-40945)));
    endpoint8=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint8);
    
    max_value=max(abs(new_corr111(1, endpoint8-40955:endpoint8-40945)));
    endpoint9=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint9);
    
    max_value=max(abs(new_corr111(1, endpoint9-40955:endpoint9-40945)));
    endpoint10=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint10);
    
    max_value=max(abs(new_corr111(1, endpoint10-40955:endpoint10-40945)));
    endpoint11=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint11);
    
    max_value=max(abs(new_corr111(1, endpoint11-40955:endpoint11-40945)));
    endpoint12=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint12);
    
    max_value=max(abs(new_corr111(1, endpoint12-40955:endpoint12-40945)));
    endpoint13=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint13);
    
    max_value=max(abs(new_corr111(1, endpoint13-40955:endpoint13-40945)));
    endpoint14=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint14);

    max_value=max(abs(new_corr111(1, endpoint14-40955:endpoint14-40945)));
    endpoint15=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint15);
    
    max_value=max(abs(new_corr111(1, endpoint15-40955:endpoint15-40945)));
    endpoint16=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint16);


    max_value=max(abs(new_corr111(1, endpoint16-40955:endpoint16-40945)));
    endpoint17=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint17);
    
    max_value=max(abs(new_corr111(1, endpoint17-40955:endpoint17-40945)));
    endpoint18=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint18);

    max_value=max(abs(new_corr111(1, endpoint18-40955:endpoint18-40945)));
        endpoint19=find(max_value==abs(new_corr111(1,:)));
    C=horzcat(C,endpoint19);


    C=flip(C)

        figure
    for i=1:20
        plot(new_corr111(1,C(1,i)),'-bo')

        axis([-600 600 -600 600])
        hold on
    end

    for i=21:38
        plot(new_corr111(1,C(1,i)),'-ro')

        axis([-600 600 -600 600])
        text(real(new_corr111(1, C(1,i))),imag(new_corr111(1, C(1,i))), num2str(i))
        hold on
    end