  %corrleation peak값 추출 (뒤의 peak point값 생략 없이 모두 포함하는 경우)

    a=length(corr1(1,:)); %channel 3
    aa=find(abs(corr1(1,:))>30);
    
    max_value=max(abs(corr1(1,a-36820:a-36800)));
    endpoint=find(max_value==abs(corr1(1,:)));
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(endpoint,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

     %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);
    
         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    %%
    endpoint=endpoint-92450;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1);
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

         %%
    endpoint=endpoint-61630;
    max_value=max(abs(corr1(1,endpoint:endpoint+20)));
    endpoint=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint);
    
    max_value=max(abs(corr1(1, endpoint-10240:endpoint-20)));
    endpoint1=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint1); 
    
    max_value=max(abs(corr1(1, endpoint1-10240:endpoint1-20)));
    endpoint2=find(max_value==abs(corr1(1,:)));
    C=horzcat(C,endpoint2);

    C=flip(C)
