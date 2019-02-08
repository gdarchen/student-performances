%run('DonneesProjetM8.m')

%% Test de Student
% Il semble coherent de faire un test de Student sur des variables
% quantitatives qui representent reellement une quantite.
% Ainsi, 'age' et 'absences' seront soumises au test de Student


        %% Etape 1 : Formuler les hypotheses

            %H0 : l'age de l'eleve n'est pas en lien avec son taux d'absenteisme
            %H1 : l'age de l'eleve est lie a son taux d'absenteisme



        %% Etape 2 : Poser un modele
            %Soit  Xb_age (Xb : x-barre) la v.a. representant la moyenne des ages
            %Xb_age~N(µ_age,sigma2_age/n)

            Xb_age=mean(Mat_Age); % 16.6962 : age moyen

            %Soit  Xb_absences (Xb : x-barre) la v.a. representant la moyenne des
            %absences
            %Xb_absences~N(µ_absences,sigma2_absences/n)

            Xb_absences=mean(Mat_Absences); % 5.7089 : absenteisme moyen

            %Calcul du Sigma2 :
            sigma2=(1/(length(Mat_Absences) + length(Mat_Age)-2));
            sigma2=sigma2*(sum((Mat_Absences-Xb_absences).^2)+sum((Mat_Age-Xb_age).^2)); %% 32.8389


            %Reformuler les hypotheses :
                %H0 : µ_age = µ_absences
                %H1 : µ_age <> µ_absences


        %% Etape 3 : Exhiber la statistique du test
            t=(Xb_age-Xb_absences) / (sqrt(sigma2*(1/length(Mat_Age) + 1/length(Mat_Absences)))); %26.9452
            %Nombre de degres de liberte : 
            ddl = length(Mat_Age)+length(Mat_Absences)-2; %788

        %% Etape 4 :Calculer la P-Valeur
            % On calcule la P-Valeur :
            % P_val=1-cdf('t',26.9452, 788) ; %cf site "octave-online.net" pour cdf

            % P_val = 0
        %% Etape 5 : Conclure
            %la p_val etant inferieure a alpha=0.05,
                %on garde H0
                %L'age des eleves n'est pas en lien avec leur taux d'absenteisme

                %Ce resultat etait previsible et ce test n'a que peu d'interet.







        %% Etape 1 : Formuler les hypotheses

            %H0 : l'age de l'eleve n'est pas en lien avec son taux d'absenteisme
            %H1 : l'age de l'eleve est lie a son taux d'absenteisme



        %% Etape 2 : Poser un modele
            %Soit  Xb_age (Xb : x-barre) la v.a. representant la moyenne des ages
            %Xb_age~N(µ_age,sigma2_age/n)

            Xb_ageP=mean(Por_Age); % 16.7442 : age moyen

            %Soit  Xb_absences (Xb : x-barre) la v.a. representant la moyenne des
            %absences
            %Xb_absences~N(µ_absences,sigma2_absences/n)

            Xb_absencesP=mean(Por_Absences); % 3.6595 : absenteisme moyen

            %Calcul du Sigma2 :
            sigma2P=(1/(length(Por_Absences) + length(Por_Age)-2));
            sigma2P=sigma2P*(sum((Por_Absences-Xb_absencesP).^2)+sum((Por_Age-Xb_ageP).^2)); %% 11.5103


            %Reformuler les hypotheses :
                %H0 : µ_age = µ_absences
                %H1 : µ_age <> µ_absences


        %% Etape 3 : Exhiber la statistique du test
            tP=(Xb_ageP-Xb_absencesP) / (sqrt(sigma2P*(1/length(Por_Age) + 1/length(Por_Absences)))); %69.4753
            %Nombre de degres de liberte : 
            ddlP = length(Por_Age)+length(Por_Absences)-2; %1296

        %% Etape 4 :Calculer la P-Valeur
            % On calcule la P-Valeur :
            % P_val=1-cdf('t',69.4753, 1296) ; %cf site "octave-online.net" pour cdf

            % P_val = 0
        %% Etape 5 : Conclure
            %la p_val etant inferieure a alpha=0.05,
                %on garde H0
                %L'age des eleves n'est pas en lien avec leur taux d'absenteisme

                %Ce resultat etait previsible et ce test n'a que peu d'interet.

