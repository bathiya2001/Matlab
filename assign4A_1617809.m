%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 4B
% Name: Bathiya ranasinghe
% CCID: bathiya
% U of A ID: 1617809
%
% Acknowledgements:
% % I used the template provided on eclass to get a general idea of how to
% proceed with the assignment. My proffessor Dr. Cheng explained helped
% explain to me how functions work. I also got email help from Edword Tiong
% who helped me fix up some problems with Lab 4B
%
% My friend Bosheng Liang and I worked on part 4A together
%
%
% Description:
% This program calculates medal standings for Olympics.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Main function
function [] = assign4A_1617809()

% loads countries, gold, silver, and bronze variables
load ('olympics.mat');

%We create empty zeros matrix for storage
results = zeros(size(countries,1),4);

% compute medals for each country saving it into an array or vector using
% for loop
for i=1:length(countries)
    results(i,:) = medals(gold,silver,bronze,countries(i,:));
end

% display medal counts for all countries
print_country_results(countries,results);

% display countries with
% most medals (i=1), most gold medals (i=2), >=20 medals (i=3)
best_country(countries,results,1);
best_country(countries,results,2);
best_country(countries,results,3);
end


% This is sub-function 1 which counts number of gold,silver,and bronze medals for one country.
function results=medals(gold,silver,bronze,country)
countrymedals=country;
results = [];
countbronze=0;
countsilver=0;
countgold=0;

for i=1:length(gold)
    if countrymedals==gold(i,:)
        countgold=countgold+1;
    end
    
    if countrymedals==silver(i,:)
        countsilver=countsilver+1;
    end
    
    if countrymedals==bronze(i,:)
        countbronze=countbronze+1;
    end
end

% Now the total medals are calulated and results are stored
Totalmedals=countgold+countsilver+countbronze;
results(:,1)=countgold;
results(:,2)=countsilver;
results(:,3)=countbronze;
results(:,4)=Totalmedals;
end

% This is sub-function 2 which prints the results with medal standings.
function print_country_results(countries,results)
fprintf('Country  Gold  Silver  Bronze  Total \n')
countgold=results(:,1);
countsilver=results(:,2);
countbronze=results(:,3);
Totalmedals=results(:,4);

for i=1:length(countries)
    if strcmp(countries(i,:),'XXX')==0
        fprintf('  %c%c%c  %4d  %6d  %6d   %5d \n',countries(i,:),countgold(i),countsilver(i),countbronze(i),Totalmedals(i));
    end
end
end

% This is sub fuction 3 which is used for the different criteria options.
function best_country(countries,results,medalselection)
for i=length(countries)
    if strcmp(countries(i,:),'XXX')==0
    end
end


Totalmedals=results(:,4);

% Use switch statement to consider the different cases and print out our
% information
switch medalselection
    case 1
        medalsswitch=Totalmedals==max(Totalmedals);
        names=countries(medalsswitch,:);
        fprintf('Countries with most medals: %c%c%c',names');
    case 2
        countgold=results(:,1);
        medalsswitch=countgold==max(countgold);
        names=countries(medalsswitch,:);
        fprintf('Countries with the most gold medals: %c%c%c ',names')
    case 3
        a=find(Totalmedals>=20);
        fprintf('Countries with as least 20 medals: ')
        for i=1:length(a)
            fprintf('%s  ',countries(a(i),:))
        end
end
fprintf('\n')
end


