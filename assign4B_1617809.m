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
% who helped me fix up some problems with the code.
% 
%
% Description:
% This program calculates medal standings for Olympics.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This is the main function
function []=assign4B_1617809()

% load the data and create the empty variables
countries = [];
bronze = [];
gold = [];
silver = [];

load('olympics.mat')

% This is sub-function 1 which counts number of gold,silver,and bronze medals for one country.
function results = allmedalspercountry(countries,bronze,gold,silver)
 
for i =1:length(countries)
 
countbronze=0;
for j=1:length(bronze)
if all(countries(i,:) == bronze(j,:))
countbronze = countbronze + 1;  
end
end

countsilver = 0;  
for j=1:length(silver)
if all(countries(i,:) == silver(j,:))
countsilver = countsilver + 1;  
end
end

countgold = 0;
for j=1:length(gold)
if all(countries(i,:)==gold(j,:))
countgold=countgold + 1;  
end
end
 
% The data is strored in structure array
results.countries(i,:) = countries(i,:);
results.gold(i,1) = countgold;
results.silver(i,1) = countsilver;
results.bronze(i,1) = countbronze;
results.total_medals(i,1) = countbronze + countgold + countsilver;
end
end

% calling subfunction 1
results = allmedalspercountry(countries,bronze,gold,silver);

% This is sub-function 2 which prints the results with medal standings.
function printmedals(results)
fprintf('Countries Gold Silver Bronze Total\n')
for i = 1:length(results.countries(:,1))
if all(results.countries(i,:) ~= 'XXX')
fprintf('     %3s   %2d    %2d    %2d   %2d\n',results.countries(i,:),...
results.gold(i,1),results.silver(i,1),results.bronze(i,1),results.total_medals(i,1))
end
end
end

% calling subfunction 2
 printmedals(results);
 
% This is our results criteria
results = categorize_performance(results,'most medals');
results = categorize_performance(results,'most gold medals');
results = categorize_performance(results,'at least 20 medals');

% This is sub fuction 3 which is used for the different criteria options.
function results = categorize_performance(results,criteria)
 
% Use switch statement for the different criteria cases    
switch criteria
   
case 'most medals'
location = results.total_medals == max(results.total_medals);
most_medals_countries = results.countries(location,:);
results.most_medals = most_medals_countries;

case 'most gold medals'
location = results.gold==max(results.gold);
most_gold_countries = results.countries(location,:);
results.most_gold = most_gold_countries;

case 'at least 20 medals'
location = results.total_medals >= 20;
atleast_20_medals_countries = results.countries(location,:);
results.atleast_20_medals = atleast_20_medals_countries;

% Now our information is printed out
fprintf('\nCountries with most medals:')
for i=1: length(results.most_medals(:,1))
fprintf('%1s', results.most_medals (i,:))
end

fprintf('\nCountries with most gold medals:')
for i=1: length(results.most_gold (:, 1))
fprintf('%1s', results.most_gold (i,:))
end

fprintf('\nCountries with at least 20 medals:')
for i=1: length(results.atleast_20_medals (:, 1))
fprintf('%4s', results.atleast_20_medals (i,:))

end
end
end
end