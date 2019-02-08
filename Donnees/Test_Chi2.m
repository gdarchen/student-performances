%run('DonneesProjetM8.m')

%% Test du Chi2

    %On decide ici de tester l'independance des deux variables 'internet'
    %et 'studytime'

    %% Etape 1 : construire le tableau de contingence
        %H0 : 'Internet' et 'Studytime' sont independantes
        %H1 : 'Internet' et 'Studytime' sont liees
    
    % Tout d'abord, on construit le tableau de contingence O des
    % observations (2 variables qualitatives de resp. I et J modalites)
    
    temp=[TabModMat_Internet , Mat_Studytime];
    
    O = zeros(2,4); % 2 lignes pour 'internet' et 4 colonnes pour 'studytime'
    
    ind=[]; %Pour [0,1]
    for i=1:length(temp)
        if temp(i,:)==[0,1]
            ind=[ind i];
        end
    end
   O(1,1)=length(ind);
   
    ind=[]; %Pour [0,2]
    for i=1:length(temp)
        if temp(i,:)==[0,2]
            ind=[ind i];
        end
    end
   O(1,2)=length(ind);
   
    ind=[]; %Pour [0,3]
    for i=1:length(temp)
        if temp(i,:)==[0,3]
            ind=[ind i];
        end
    end
   O(1,3)=length(ind);
   
    ind=[]; %Pour [0,4]
    for i=1:length(temp)
        if temp(i,:)==[0,4]
            ind=[ind i];
        end
    end
   O(1,4)=length(ind);
   
    ind=[]; %Pour [1,1]
    for i=1:length(temp)
        if temp(i,:)==[1,1]
            ind=[ind i];
        end
    end
   O(2,1)=length(ind);
   
    ind=[]; %Pour [1,2]
    for i=1:length(temp)
        if temp(i,:)==[1,2]
            ind=[ind i];
        end
    end   
   O(2,2)=length(ind);

    ind=[]; %Pour [1,3]
    for i=1:length(temp)
        if temp(i,:)==[1,3]
            ind=[ind i];
        end
    end
   O(2,3)=length(ind);
   
    ind=[]; %Pour [1,4]
    for i=1:length(temp)
        if temp(i,:)==[1,4]
            ind=[ind i];
        end
    end
   O(2,4)=length(ind);
   clear i;
   clear ind;
   
   %% Etape 2 : on calcule les marginales
    [I,J]=size(O); %[2,4]
    nI=sum(O'); %profil ligne = [66 329]
    nJ=sum(O); %profil colonne = [105 198 65 27]
    n=sum(sum(O)); % = 395
    
   %% Etape 3 : on calcule lees Tij pour chaque case du tab des eff theoriques
    T=(nI'*nJ)/n; % Effectifs theoriques <==> Tij=P(i.)*P(.j)*n
                                         %= Ni./n * N.j/n * n
    % T/n donne les pourcentages
    
   %% Etape 4 : on calcule la distance du Chi2 : 
    D= sum(sum((O-T).^2./T)); %Distance du Chi2 : 3.3831
    
   %% Etape 5 : on calcule le nombre de degres de liberte 
    ddl=(I-1)*(J-1); %3
    
   %% Etape 6 : on regarde dans les tables de la loi de Chi2 
    %pval=1-chi2cdf(3.3831,3) %Cf site 'octave-online.net'
    %pval =  0.33624
    
   %% Etape 7 : conclure
   % On constate que pval<0.05 
   % On garde donc H0 : il n'y a pas lieu de remettre en cause
   % l'independance des variables 'Internet' et 'Studytime'
   
   
   
   
   

   
   
%% Test du Chi2 (Romantic / Walc)

    %On decide ici de tester l'independance des deux variables 'romantic'
    %et 'walc'

    %% Etape 1 : construire le tableau de contingence
        %H0 : 'Romantic' et 'Walc' sont independantes
        %H1 : 'Romantic' et 'Walc' sont liees
    
    % Tout d'abord, on construit le tableau de contingence O des
    % observations (2 variables qualitatives de resp. I et J modalites)
    
    temp=[TabModMat_Romantic , Mat_Walc];
    
    O = zeros(2,5); % 2 lignes pour 'romantic' et 4 colonnes pour 'Walc'
    
    ind=[]; %Pour [0,1]
    for i=1:length(temp)
        if temp(i,:)==[0,1]
            ind=[ind i];
        end
    end
   O(1,1)=length(ind);
   
    ind=[]; %Pour [0,2]
    for i=1:length(temp)
        if temp(i,:)==[0,2]
            ind=[ind i];
        end
    end
   O(1,2)=length(ind);
   
    ind=[]; %Pour [0,3]
    for i=1:length(temp)
        if temp(i,:)==[0,3]
            ind=[ind i];
        end
    end
   O(1,3)=length(ind);
   
    ind=[]; %Pour [0,4]
    for i=1:length(temp)
        if temp(i,:)==[0,4]
            ind=[ind i];
        end
    end
   O(1,4)=length(ind);
   
       ind=[]; %Pour [0,5]
    for i=1:length(temp)
        if temp(i,:)==[0,5]
            ind=[ind i];
        end
    end
   O(1,5)=length(ind);
   
    ind=[]; %Pour [1,1]
    for i=1:length(temp)
        if temp(i,:)==[1,1]
            ind=[ind i];
        end
    end
   O(2,1)=length(ind);
   
    ind=[]; %Pour [1,2]
    for i=1:length(temp)
        if temp(i,:)==[1,2]
            ind=[ind i];
        end
    end   
   O(2,2)=length(ind);

    ind=[]; %Pour [1,3]
    for i=1:length(temp)
        if temp(i,:)==[1,3]
            ind=[ind i];
        end
    end
   O(2,3)=length(ind);
   
    ind=[]; %Pour [1,4]
    for i=1:length(temp)
        if temp(i,:)==[1,4]
            ind=[ind i];
        end
    end
   O(2,4)=length(ind);
   
    ind=[]; %Pour [1,5]
    for i=1:length(temp)
        if temp(i,:)==[1,5]
            ind=[ind i];
        end
    end
   O(2,5)=length(ind);
   clear i;
   clear ind;
   
   %% Etape 2 : on calcule les marginales
    [I,J]=size(O); %[2,5]
    nI=sum(O'); %profilligne = [263 132]
    nJ=sum(O); %profil colonne = [151 85 80 51 28]
    n=sum(sum(O)); % = 395
    
   %% Etape 3 : on calcule lees Tij pour chaque case du tab des eff theoriques
    T=(nI'*nJ)/n; % Effectifs theoriques <==> Tij=P(i.)*P(.j)*n
                                         %= Ni./n * N.j/n * n
    % T/n donne les pourcentages
    
   %% Etape 4 : on calcule la distance du Chi2 : 
    D= sum(sum((O-T).^2./T)); %Distance du Chi2 : 1.9912
    
   %% Etape 5 : on calcule le nombre de degres de liberte 
    ddl=(I-1)*(J-1); %4
    
   %% Etape 6 : on regarde dans les tables de la loi de Chi2 
    %pval=1-chi2cdf(1,9912,4) %Cf site 'octave-online.net'
    %pval =  0.73738
    
   %% Etape 7 : conclure
   % On constate que pval>0.05 
   % On ne peut donc pas conclure quant a la dependance des deux variables
   
   
   
   
   
   
   %% Test du Chi2 (Medu / Fedu)

    %On decide ici de tester l'independance des deux variables 'Medu'
    %et 'Fedu'

    %% Etape 1 : construire le tableau de contingence
        %H0 : 'Medu' et 'Fedu' sont independantes
        %H1 : 'Medu' et 'Fedu' sont liees
    
    % Tout d'abord, on construit le tableau de contingence O des
    % observations (2 variables qualitatives de resp. I et J modalites)
    
    temp=[Mat_Medu , Mat_Fedu];
    
    O = zeros(5,5); % 5 lignes pour 'Medu' et 5 colonnes pour 'Fedu'
    
    for j=0:4
        ind=[]; %Pour [0,i]
        for i=1:length(temp)
            if temp(i,:)==[0,j]
                ind=[ind i];
            end
        end
        O(1,j+1)=length(ind);
    end
 
   
    for j=0:4
        ind=[]; %Pour [1,i]
        for i=1:length(temp)
            if temp(i,:)==[1,j]
                ind=[ind i];
            end
        end
        O(2,j+1)=length(ind);
    end
   
    for j=0:4
        ind=[]; %Pour [2,i]
        for i=1:length(temp)
            if temp(i,:)==[2,j]
                ind=[ind i];
            end
        end
        O(3,j+1)=length(ind);
    end
   
    for j=0:4
        ind=[]; %Pour [3,i]
        for i=1:length(temp)
            if temp(i,:)==[3,j]
                ind=[ind i];
            end
        end
        O(4,j+1)=length(ind);
    end
    
    for j=0:4
        ind=[]; %Pour [4,i]
        for i=1:length(temp)
            if temp(i,:)==[4,j]
                ind=[ind i];
            end
        end
        O(5,j+1)=length(ind);
    end
   
    
   clear i;
   clear ind;
   
   %% Etape 2 : on calcule les marginales
    [I,J]=size(O); %[5,5]
    nI=sum(O'); %profil ligne = [3 59 103 99 131]
    nJ=sum(O); %profil colonne = [2 82 115 100 96]
    n=sum(sum(O)); % = 395
    
   %% Etape 3 : on calcule lees Tij pour chaque case du tab des eff theoriques
    T=(nI'*nJ)/n; % Effectifs theoriques <==> Tij=P(i.)*P(.j)*n
                                         %= Ni./n * N.j/n * n
    % T/n donne les pourcentages
    
   %% Etape 4 : on calcule la distance du Chi2 : 
    D= sum(sum((O-T).^2./T)); %Distance du Chi2 : 199.9773
    
   %% Etape 5 : on calcule le nombre de degres de liberte 
    ddl=(I-1)*(J-1); %16
    
   %% Etape 6 : on regarde dans les tables de la loi de Chi2 
    %pval=1-chi2cdf(199.9774,16) %Cf site 'octave-online.net'
    %pval =  0
    
   %% Etape 7 : conclure
   % On constate que pval<0.05 
   % On garde donc H0 : il n'y a pas lieu de remettre en cause
   % l'independance des variables 'Medu' et 'Fedu'
   
   
   
   
   
   
      %% Test du Chi2 (Mjob / Fjob)

    %On decide ici de tester l'independance des deux variables 'Mjob'
    %et 'Fjob'

    %% Etape 1 : construire le tableau de contingence
        %H0 : 'Mjob' et 'Fjob' sont independantes
        %H1 : 'Mjob' et 'Fjob' sont liees
    
    % Tout d'abord, on construit le tableau de contingence O des
    % observations (2 variables qualitatives de resp. I et J modalites)
    
    temp=[TabModMat_Mjob , TabModMat_Fjob];
    
    O = zeros(5,5); % 5 lignes pour 'Mjob' et 5 colonnes pour 'Fjob'
    
    for j=0:4
        ind=[]; %Pour [0,i]
        for i=1:length(temp)
            if temp(i,:)==[0,j]
                ind=[ind i];
            end
        end
        O(1,j+1)=length(ind);
    end
 
   
    for j=0:4
        ind=[]; %Pour [1,i]
        for i=1:length(temp)
            if temp(i,:)==[1,j]
                ind=[ind i];
            end
        end
        O(2,j+1)=length(ind);
    end
   
    for j=0:4
        ind=[]; %Pour [2,i]
        for i=1:length(temp)
            if temp(i,:)==[2,j]
                ind=[ind i];
            end
        end
        O(3,j+1)=length(ind);
    end
   
    for j=0:4
        ind=[]; %Pour [3,i]
        for i=1:length(temp)
            if temp(i,:)==[3,j]
                ind=[ind i];
            end
        end
        O(4,j+1)=length(ind);
    end
    
    for j=0:4
        ind=[]; %Pour [4,i]
        for i=1:length(temp)
            if temp(i,:)==[4,j]
                ind=[ind i];
            end
        end
        O(5,j+1)=length(ind);
    end
   
    
   clear i;
   clear ind;
   
   %% Etape 2 : on calcule les marginales
    [I,J]=size(O); %[5,5]
    nI=sum(O'); %profil ligne = [59 34 141 103 58]
    nJ=sum(O); %profil colonne = [20 18 217 111 29]
    n=sum(sum(O)); % = 395
    
   %% Etape 3 : on calcule lees Tij pour chaque case du tab des eff theoriques
    T=(nI'*nJ)/n; % Effectifs theoriques <==> Tij=P(i.)*P(.j)*n
                                         %= Ni./n * N.j/n * n
    % T/n donne les pourcentages
    
   %% Etape 4 : on calcule la distance du Chi2 : 
    D= sum(sum((O-T).^2./T)); %Distance du Chi2 : 73.3809
    
   %% Etape 5 : on calcule le nombre de degres de liberte 
    ddl=(I-1)*(J-1); %16
    
   %% Etape 6 : on regarde dans les tables de la loi de Chi2 
    %pval=1-chi2cdf(73.3809,16) %Cf site 'octave-online.net'
    %pval =  2.5336e-09
    
   %% Etape 7 : conclure
   % On constate que pval<0.05 
   % On garde donc H0 : il n'y a pas lieu de remettre en cause
   % l'independance des variables 'Mjob' et 'Fjob'
   
   
   
   
   
         %% Test du Chi2 (Dalc / Walc)

    %On decide ici de tester l'independance des deux variables 'Dalc'
    %et 'Walc'

    %% Etape 1 : construire le tableau de contingence
        %H0 : 'Dalc' et 'Walc' sont independantes
        %H1 : 'Dalc' et 'Walc' sont liees
    
    % Tout d'abord, on construit le tableau de contingence O des
    % observations (2 variables qualitatives de resp. I et J modalites)
    
    temp=[Mat_Dalc , Mat_Walc];
    
    O = zeros(5,5); % 5 lignes pour 'Dalc' et 5 colonnes pour 'Walc'
    
    for j=1:5
        ind=[]; %Pour [1,i]
        for i=1:length(temp)
            if temp(i,:)==[1,j]
                ind=[ind i];
            end
        end
        O(1,j)=length(ind);
    end
 
   
    for j=1:5
        ind=[]; %Pour [2,i]
        for i=1:length(temp)
            if temp(i,:)==[2,j]
                ind=[ind i];
            end
        end
        O(2,j)=length(ind);
    end
   
    for j=1:5
        ind=[]; %Pour [3,i]
        for i=1:length(temp)
            if temp(i,:)==[3,j]
                ind=[ind i];
            end
        end
        O(3,j)=length(ind);
    end
   
    for j=1:5
        ind=[]; %Pour [4,i]
        for i=1:length(temp)
            if temp(i,:)==[4,j]
                ind=[ind i];
            end
        end
        O(4,j)=length(ind);
    end
    
    for j=1:5
        ind=[]; %Pour [5,i]
        for i=1:length(temp)
            if temp(i,:)==[5,j]
                ind=[ind i];
            end
        end
        O(5,j)=length(ind);
    end
   
    
   clear i;
   clear ind;
   
   %% Etape 2 : on calcule les marginales
    [I,J]=size(O); %[5,5]
    nI=sum(O'); %profil ligne = [276 75 26 9 9]
    nJ=sum(O); %profil colonne = [151 85 80 51 28]
    n=sum(sum(O)); % = 395
    
   %% Etape 3 : on calcule lees Tij pour chaque case du tab des eff theoriques
    T=(nI'*nJ)/n; % Effectifs theoriques <==> Tij=P(i.)*P(.j)*n
                                         %= Ni./n * N.j/n * n
    % T/n donne les pourcentages
    
   %% Etape 4 : on calcule la distance du Chi2 : 
    D= sum(sum((O-T).^2./T)); %Distance du Chi2 : 287.0019
    
   %% Etape 5 : on calcule le nombre de degres de liberte 
    ddl=(I-1)*(J-1); %16
    
   %% Etape 6 : on regarde dans les tables de la loi de Chi2 
    %pval=1-chi2cdf(287.0019,16) %Cf site 'octave-online.net'
    %pval =  0
    
   %% Etape 7 : conclure
   % On constate que pval<0.05 
   % On garde donc H0 : il n'y a pas lieu de remettre en cause
   % l'independance des variables 'Dalc' et 'Walc'