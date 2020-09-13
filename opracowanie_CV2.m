
%przed uruchomieniem uruchomiæ File>Import Data... i za³adowaæ plk xls z
%danymi

% wprowadziæ powierzchniê czynn¹ próbki 
    s=0.1;
    %wprowadziæ wzglêdn¹ sta³¹ przenikalnoœci elektrycznej z³¹cza 
           Es=10.4;
    
       E=8.85*10^(-14);
       q=1.602*10^(-19);

format long
[m,n]=size(data);

x=data(1:92,1);
k=[abs(min(x)),abs(max(x))];
q=min(k);
n=(n-1)/2;
    
 for i = 1:n;
    j=2*i;
    y(1:92,i)=data(1:92,j);
    z(1:92,i)=data(1:92,j+1);
    v(:,i)=diff(z(:,i))./diff(x(:,1));
    
    N(:,i)=2./(q*E*Es.*v(:,i));
    [o,p]=size(N);
    x1=[min(x):abs(max(x)-min(x))/(o-1):max(x)];
    [oo,pp]=size(x1);
    
    h(:,i)=s*E*Es./y(:,i)
    u(:,1)=(linspace(1,1,92))'
    hh(:,i)=diff(h(:,i))./diff(u)
    
    
     % odczyt temperatury z pliku
       a=textdata(3,j);
    
    figure(i)
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Tworzenie wykresu 1/(C^2)-V
   grid on  
   subplot(2,2,1)
   plot(x,y(1:92,i))
   axis( [(min(x)-q), (max(x)+q), min(y(1:92,i)), max(y(1:92,i))])
   title('Wykres C(U) w temp')
   xlabel('U(V)')
   ylabel('C(F)')
  
   subplot(2,2,2)
   plot(x,z(:,i))
   axis( [(min(x)-q), (max(x)+q), min(z(1:92,i)), max(z(1:92,i))])
   title('Wykres 1/C^2(U) w temp''K')
   xlabel('U(V)')
   ylabel('1/C^2(1/F^2)')
   
   subplot(2,2,3)
   plot(x1,N(:,i))
   axis( [(min(x)-q), (max(x)+q), 0.9*min(N(:,i)), 1.1*max(N(:,i))])
   title('Wykres N(U) w temp''K')
   xlabel('U(V)')
   ylabel('N(1/m^3)')
   
   
%    subplot(2,2,4)
%    plot(hh(:,i),N(:,i))
%    axis( [0.9*(min(hh(:,i))),1.1*(max(hh(:,i))),0.9*min(N(:,i)), 1.1*max(h(:,i))])
%    title('Wykres N(h) w temp''K')
%    xlabel('h(m)')
%    ylabel('N(1/m^3)')
   
   
 end
 format long
   
   clear
        