%% Chargement des donnees de 'student-mat.csv'
dataMat=csvimport('student-mat.csv');

% Donnees numeriques
Mat_Age=cell2mat(dataMat(2:end,3));
Mat_Medu=cell2mat(dataMat(2:end,7));
Mat_Fedu=cell2mat(dataMat(2:end,8));
Mat_Traveltime=cell2mat(dataMat(2:end,13));
Mat_Studytime=cell2mat(dataMat(2:end,14));
Mat_Failures=cell2mat(dataMat(2:end,15));
Mat_Famrel=cell2mat(dataMat(2:end,24));
Mat_Freetime=cell2mat(dataMat(2:end,25));
Mat_Goout=cell2mat(dataMat(2:end,26));
Mat_Dalc=cell2mat(dataMat(2:end,27));
Mat_Walc=cell2mat(dataMat(2:end,28));
Mat_Health=cell2mat(dataMat(2:end,29));
Mat_Absences=cell2mat(dataMat(2:end,30));
Mat_G1=cell2mat(dataMat(2:end,31));
Mat_G2=cell2mat(dataMat(2:end,32));
Mat_G3=cell2mat(dataMat(2:end,33));

% Donnees en chaines de caracteres
Mat_School=char(dataMat(2:end,1));
Mat_Sex=char(dataMat(2:end,2));
Mat_Address=char(dataMat(2:end,4));
Mat_Famsize=char(dataMat(2:end,5));
Mat_Pstatus=char(dataMat(2:end,6));
Mat_Mjob=char(dataMat(2:end,9));
Mat_Fjob=char(dataMat(2:end,10));
Mat_Reason=char(dataMat(2:end,11));
Mat_Guardian=char(dataMat(2:end,12));
Mat_Schoolsup=char(dataMat(2:end,16));
Mat_Famsup=char(dataMat(2:end,17));
Mat_Paid=char(dataMat(2:end,18));
Mat_Activities=char(dataMat(2:end,19));
Mat_Nursery=char(dataMat(2:end,20));
Mat_Higher=char(dataMat(2:end,21));
Mat_Internet=char(dataMat(2:end,22));
Mat_Romantic=char(dataMat(2:end,23));



%% Chargement des donnees de 'student-por.csv'
dataPor=csvimport('student-por.csv');

% Donnees numeriques
Por_Age=cell2mat(dataPor(2:end,3));
Por_Medu=cell2mat(dataPor(2:end,7));
Por_Fedu=cell2mat(dataPor(2:end,8));
Por_Traveltime=cell2mat(dataPor(2:end,13));
Por_Studytime=cell2mat(dataPor(2:end,14));
Por_Failures=cell2mat(dataPor(2:end,15));
Por_Famrel=cell2mat(dataPor(2:end,24));
Por_Freetime=cell2mat(dataPor(2:end,25));
Por_Goout=cell2mat(dataPor(2:end,26));
Por_Dalc=cell2mat(dataPor(2:end,27));
Por_Walc=cell2mat(dataPor(2:end,28));
Por_Health=cell2mat(dataPor(2:end,29));
Por_Absences=cell2mat(dataPor(2:end,30));
Por_G1=cell2mat(dataPor(2:end,31));
Por_G2=cell2mat(dataPor(2:end,32));
Por_G3=cell2mat(dataPor(2:end,33));

% Donnees en chaines de caracteres
Por_School=char(dataPor(2:end,1));
Por_Sex=char(dataPor(2:end,2));
Por_Address=char(dataPor(2:end,4));
Por_Famsize=char(dataPor(2:end,5));
Por_Pstatus=char(dataPor(2:end,6));
Por_Mjob=char(dataPor(2:end,9));
Por_Fjob=char(dataPor(2:end,10));
Por_Reason=char(dataPor(2:end,11));
Por_Guardian=char(dataPor(2:end,12));
Por_Schoolsup=char(dataPor(2:end,16));
Por_Famsup=char(dataPor(2:end,17));
Por_Paid=char(dataPor(2:end,18));
Por_Activities=char(dataPor(2:end,19));
Por_Nursery=char(dataPor(2:end,20));
Por_Higher=char(dataPor(2:end,21));
Por_Internet=char(dataPor(2:end,22));
Por_Romantic=char(dataPor(2:end,23));


clear dataMat
clear dataPor

%% Rangement modalites (chaines) fichier 'student_mat.csv'

%Rangement modalites Mat_School (0=MS / 1=GP)
TabModMat_School=ones(length(Mat_School),1);
for i=1:length(Mat_School)
    ind=[];
    if (Mat_School(i,:)=='MS')
       ind=[ind ;i];
       TabModMat_School(ind,1)=0;
    end
end

%Rangement modalites Mat_Sex (0=F / 1=M)
TabModMat_Sex=ones(length(Mat_Sex),1);
for i=1:length(Mat_Sex)
    ind=[];
    if (Mat_Sex(i,:)=='F')
       ind=[ind ;i];
       TabModMat_Sex(ind,1)=0;
    end
end

%Rangement modalites Mat_Address (0=U / 1=R)
TabModMat_Address=ones(length(Mat_Address),1);
for i=1:length(Mat_Address)
    ind=[];
    if (Mat_Address(i,:)=='U')
       ind=[ind ;i];
       TabModMat_Address(ind,1)=0;
    end
end

%Rangement modalites Mat_Famsize (0=LE3 / 1=GT3)
TabModMat_Famsize=ones(length(Mat_Famsize),1);
for i=1:length(Mat_Famsize)
    ind=[];
    if (Mat_Famsize(i,:)=='LE3')
       ind=[ind ;i];
       TabModMat_Famsize(ind,1)=0;
    end
end

%Rangement modalites Mat_Pstatus (0=A / 1=T)
TabModMat_Pstatus=ones(length(Mat_Pstatus),1);
for i=1:length(Mat_Pstatus)
    ind=[];
    if (Mat_Pstatus(i,:)=='A')
       ind=[ind ;i];
       TabModMat_Pstatus(ind,1)=0;
    end
end

%Rangement modalites Mat_Mjob (0=at_home / 1=health / 2=other / 3=services / 4=teacher)
TabModMat_Mjob=ones(length(Mat_Mjob),1);
for i=1:length(Mat_Mjob)
    ind=[];
    if (Mat_Mjob(i,:)=='at_home ')
       ind=[ind ;i];
       TabModMat_Mjob(ind,1)=0;
    end
    if (Mat_Mjob(i,:)=='other   ')
       ind=[ind ;i];
       TabModMat_Mjob(ind,1)=2;
    end
    if (Mat_Mjob(i,:)=='services')
       ind=[ind ;i];
       TabModMat_Mjob(ind,1)=3;
    end
    if (Mat_Mjob(i,:)=='teacher ')
       ind=[ind ;i];
       TabModMat_Mjob(ind,1)=4;
    end
end

%Rangement modalites Mat_Fjob (0=at_home / 1=health / 2=other / 3=services / 4=teacher)
TabModMat_Fjob=ones(length(Mat_Fjob),1);
for i=1:length(Mat_Fjob)
    ind=[];
    if (Mat_Fjob(i,:)=='at_home ')
       ind=[ind ;i];
       TabModMat_Fjob(ind,1)=0;
    end
    if (Mat_Fjob(i,:)=='other   ')
       ind=[ind ;i];
       TabModMat_Fjob(ind,1)=2;
    end
    if (Mat_Fjob(i,:)=='services')
       ind=[ind ;i];
       TabModMat_Fjob(ind,1)=3;
    end
    if (Mat_Fjob(i,:)=='teacher ')
       ind=[ind ;i];
       TabModMat_Fjob(ind,1)=4;
    end
end

%Rangement modalites Mat_Reason (0=course / 1=home / 2=other / 3=reputation)
TabModMat_Reason=ones(length(Mat_Reason),1);
for i=1:length(Mat_Reason)
    ind=[];
    if (Mat_Reason(i,:)=='course    ')
       ind=[ind ;i];
       TabModMat_Reason(ind,1)=0;
    end
    if (Mat_Reason(i,:)=='other     ')
       ind=[ind ;i];
       TabModMat_Reason(ind,1)=2;
    end
    if (Mat_Reason(i,:)=='reputation')
       ind=[ind ;i];
       TabModMat_Reason(ind,1)=3;
    end
end

%Rangement modalites Mat_Guardian (0=father / 1=mother / 2=other)
TabModMat_Guardian=ones(length(Mat_Guardian),1);
for i=1:length(Mat_Guardian)
    ind=[];
    if (Mat_Guardian(i,:)=='father')
       ind=[ind ;i];
       TabModMat_Guardian(ind,1)=0;
    end
    if (Mat_Guardian(i,:)=='other ')
       ind=[ind ;i];
       TabModMat_Guardian(ind,1)=2;
    end
end

%Rangement modalites Mat_Schoolsup (0=no / 1=yes)
TabModMat_Schoolsup=ones(length(Mat_Schoolsup),1);
for i=1:length(Mat_Schoolsup)
    ind=[];
    if (Mat_Schoolsup(i,:)=='no ')
       ind=[ind ;i];
       TabModMat_Schoolsup(ind,1)=0;
    end
end

%Rangement modalites Mat_Famsup (0=no / 1=yes)
TabModMat_Famsup=ones(length(Mat_Famsup),1);
for i=1:length(Mat_Famsup)
    ind=[];
    if (Mat_Famsup(i,:)=='no ')
       ind=[ind ;i];
       TabModMat_Famsup(ind,1)=0;
    end
end

%Rangement modalites Mat_Paid (0=no / 1=yes)
TabModMat_Paid=ones(length(Mat_Paid),1);
for i=1:length(Mat_Paid)
    ind=[];
    if (Mat_Paid(i,:)=='no ')
       ind=[ind ;i];
       TabModMat_Paid(ind,1)=0;
    end
end

%Rangement modalites Mat_Activities (0=no / 1=yes)
TabModMat_Activities=ones(length(Mat_Activities),1);
for i=1:length(Mat_Activities)
    ind=[];
    if (Mat_Activities(i,:)=='no ')
       ind=[ind ;i];
       TabModMat_Activities(ind,1)=0;
    end
end

%Rangement modalites Mat_Nursery (0=no / 1=yes)
TabModMat_Nursery=ones(length(Mat_Nursery),1);
for i=1:length(Mat_Nursery)
    ind=[];
    if (Mat_Nursery(i,:)=='no ')
       ind=[ind ;i];
       TabModMat_Nursery(ind,1)=0;
    end
end

%Rangement modalites Mat_Higher (0=no / 1=yes)
TabModMat_Higher=ones(length(Mat_Higher),1);
for i=1:length(Mat_Higher)
    ind=[];
    if (Mat_Higher(i,:)=='no ')
       ind=[ind ;i];
       TabModMat_Higher(ind,1)=0;
    end
end

%Rangement modalites Mat_Internet (0=no / 1=yes)
TabModMat_Internet=ones(length(Mat_Internet),1);
for i=1:length(Mat_Internet)
    ind=[];
    if (Mat_Internet(i,:)=='no ')
       ind=[ind ;i];
       TabModMat_Internet(ind,1)=0;
    end
end

%Rangement modalites Mat_Romantic (0=no / 1=yes)
TabModMat_Romantic=ones(length(Mat_Romantic),1);
for i=1:length(Mat_Romantic)
    ind=[];
    if (Mat_Romantic(i,:)=='no ')
       ind=[ind ;i];
       TabModMat_Romantic(ind,1)=0;
    end
end


%% Rangement modalites (chaines) fichier 'student_por.csv'

%Rangement modalites Por_School (0=MS / 1=GP)
TabModPor_School=ones(length(Por_School),1);
for i=1:length(Por_School)
    ind=[];
    if (Por_School(i,:)=='MS')
       ind=[ind ;i];
       TabModPor_School(ind,1)=0;
    end
end

%Rangement modalites Por_Sex (0=F / 1=M)
TabModPor_Sex=ones(length(Por_Sex),1);
for i=1:length(Por_Sex)
    ind=[];
    if (Por_Sex(i,:)=='F')
       ind=[ind ;i];
       TabModPor_Sex(ind,1)=0;
    end
end

%Rangement modalites Por_Address (0=U / 1=R)
TabModPor_Address=ones(length(Por_Address),1);
for i=1:length(Por_Address)
    ind=[];
    if (Por_Address(i,:)=='U')
       ind=[ind ;i];
       TabModPor_Address(ind,1)=0;
    end
end

%Rangement modalites Por_Famsize (0=LE3 / 1=GT3)
TabModPor_Famsize=ones(length(Por_Famsize),1);
for i=1:length(Por_Famsize)
    ind=[];
    if (Por_Famsize(i,:)=='LE3')
       ind=[ind ;i];
       TabModPor_Famsize(ind,1)=0;
    end
end

%Rangement modalites Por_Pstatus (0=A / 1=T)
TabModPor_Pstatus=ones(length(Por_Pstatus),1);
for i=1:length(Por_Pstatus)
    ind=[];
    if (Por_Pstatus(i,:)=='A')
       ind=[ind ;i];
       TabModPor_Pstatus(ind,1)=0;
    end
end

%Rangement modalites Por_Mjob (0=at_home / 1=health / 2=other / 3=services / 4=teacher)
TabModPor_Mjob=ones(length(Por_Mjob),1);
for i=1:length(Por_Mjob)
    ind=[];
    if (Por_Mjob(i,:)=='at_home ')
       ind=[ind ;i];
       TabModPor_Mjob(ind,1)=0;
    end
    if (Por_Mjob(i,:)=='other   ')
       ind=[ind ;i];
       TabModPor_Mjob(ind,1)=2;
    end
    if (Por_Mjob(i,:)=='services')
       ind=[ind ;i];
       TabModPor_Mjob(ind,1)=3;
    end
    if (Por_Mjob(i,:)=='teacher ')
       ind=[ind ;i];
       TabModPor_Mjob(ind,1)=4;
    end
end

%Rangement modalites Por_Fjob (0=at_home / 1=health / 2=other / 3=services / 4=teacher)

TabModPor_Fjob=ones(length(Por_Fjob),1);
for i=1:length(Por_Fjob)        
    ind=[];
    if (Por_Fjob(i,:)=='at_home ')

       ind=[ind ;i];
       TabModPor_Fjob(ind,1)=0;
    end
    if (Por_Fjob(i,:)=='other   ')
       ind=[ind ;i];
       TabModPor_Fjob(ind,1)=2;
    end
    if (Por_Fjob(i,:)=='services')
       ind=[ind ;i];
       TabModPor_Fjob(ind,1)=3;
    end
    if (Por_Fjob(i,:)=='teacher ')
       ind=[ind ;i];
       TabModPor_Fjob(ind,1)=4;
    end
end

%Rangement modalites Por_Reason (0=course / 1=home / 2=other / 3=reputation)
TabModPor_Reason=ones(length(Por_Reason),1);
for i=1:length(Por_Reason)
    ind=[];
    if (Por_Reason(i,:)=='course    ')
       ind=[ind ;i];
       TabModPor_Reason(ind,1)=0;
    end
    if (Por_Reason(i,:)=='other     ')
       ind=[ind ;i];
       TabModPor_Reason(ind,1)=2;
    end
    if (Por_Reason(i,:)=='reputation')
       ind=[ind ;i];
       TabModPor_Reason(ind,1)=3;
    end
end

%Rangement modalites Por_Guardian (0=father / 1=mother / 2=other)
TabModPor_Guardian=ones(length(Por_Guardian),1);
for i=1:length(Por_Guardian)
    ind=[];
    if (Por_Guardian(i,:)=='father')
       ind=[ind ;i];
       TabModPor_Guardian(ind,1)=0;
    end
    if (Por_Guardian(i,:)=='other ')
       ind=[ind ;i];
       TabModPor_Guardian(ind,1)=2;
    end
end

%Rangement modalites Por_Schoolsup (0=no / 1=yes)
TabModPor_Schoolsup=ones(length(Por_Schoolsup),1);
for i=1:length(Por_Schoolsup)
    ind=[];
    if (Por_Schoolsup(i,:)=='no ')
       ind=[ind ;i];
       TabModPor_Schoolsup(ind,1)=0;
    end
end

%Rangement modalites Por_Famsup (0=no / 1=yes)
TabModPor_Famsup=ones(length(Por_Famsup),1);
for i=1:length(Por_Famsup)
    ind=[];
    if (Por_Famsup(i,:)=='no ')
       ind=[ind ;i];
       TabModPor_Famsup(ind,1)=0;
    end
end

%Rangement modalites Por_Paid (0=no / 1=yes)
TabModPor_Paid=ones(length(Por_Paid),1);
for i=1:length(Por_Paid)
    ind=[];
    if (Por_Paid(i,:)=='no ')
       ind=[ind ;i];
       TabModPor_Paid(ind,1)=0;
    end
end

%Rangement modalites Por_Activities (0=no / 1=yes)
TabModPor_Activities=ones(length(Por_Activities),1);
for i=1:length(Por_Activities)
    ind=[];
    if (Por_Activities(i,:)=='no ')
       ind=[ind ;i];
       TabModPor_Activities(ind,1)=0;
    end
end

%Rangement modalites Por_Nursery (0=no / 1=yes)
TabModPor_Nursery=ones(length(Por_Nursery),1);
for i=1:length(Por_Nursery)
    ind=[];
    if (Por_Nursery(i,:)=='no ')
       ind=[ind ;i];
       TabModPor_Nursery(ind,1)=0;
    end
end

%Rangement modalites Por_Higher (0=no / 1=yes)
TabModPor_Higher=ones(length(Por_Higher),1);
for i=1:length(Por_Higher)
    ind=[];
    if (Por_Higher(i,:)=='no ')
       ind=[ind ;i];
       TabModPor_Higher(ind,1)=0;
    end
end

%Rangement modalites Por_Internet (0=no / 1=yes)
TabModPor_Internet=ones(length(Por_Internet),1);
for i=1:length(Por_Internet)
    ind=[];
    if (Por_Internet(i,:)=='no ')
       ind=[ind ;i];
       TabModPor_Internet(ind,1)=0;
    end
end

%Rangement modalites Por_Romantic (0=no / 1=yes)

TabModPor_Romantic=ones(length(Por_Romantic),1);
for i=1:length(Por_Romantic)
    ind=[];
    if (Por_Romantic(i,:)=='no ')
       ind=[ind ;i];
       TabModPor_Romantic(ind,1)=0;
    end
end




clear ind