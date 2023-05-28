Именная база фактов: 
 
domains 
    id = integer 
    name = symbol 
    population = integer 
    part_of_world = symbol 
    city_id = id 
    country_id = id 
 
predicates 
    country(id, name, part_of_world, population). 
    city(id, name, population). 
    represents(city_id, country_id). 
 
clauses 
    country(1, 'USA', 'North America', 328200000). 
    country(2, 'Russia', 'Europe/Asia', 144500000). 
    country(3, 'Brazil', 'South America', 209500000). 
    country(4, 'Egypt', 'Africa', 100000000). 
    country(5, 'Japan', 'Asia', 126500000). 
    country(6, 'Canada', 'North America', 37590000). 
    country(7, 'Australia', 'Oceania', 24440000). 
    country(8, 'Spain', 'Europe', 46750000). 
    country(9, 'Nigeria', 'Africa', 200900000). 
    country(10, 'Sweden', 'Europe', 10230000). 
 
    city(1, 'New York City', 8399000). 
    city(2, 'Moscow', 11520000). 
    city(3, 'Sao Paulo', 21850000). 
    city(4, 'Cairo', 20000000). 
    city(5, 'Tokyo', 13800000). 
    city(6, 'Toronto', 2930000). 
    city(7, 'Sydney', 5312000). 
    city(8, 'Madrid', 6642000). 
    city(9, 'Lagos', 21000000). 
    city(10, 'Stockholm', 975500). 
 
    represents(1, 1). 
    represents(2, 2). 
    represents(3, 3). 
    represents(4, 4). 
    represents(5, 5). 
    represents(6, 6). 
    represents(7, 7). 
    represents(8, 8). 
    represents(9, 9). 
    represents(10, 10). 
 
rules 
    % Generate city for given part of the world 
    generate_city(Part_of_world, City_id, Country_id) :-  
        country(Country_id, _, Part_of_world, _), 
        not represents(City_id, Country_id), 
        city(City_id, _, _). 
 
    % Part of world for given city id 
    part_of_world(City_id, Part_of_world) :-  
        represents(City_id, Country_id), 
        country(Country_id, _, Part_of_world, _). 
 
    % Total population of given part of world 
    part_of_world_population(Part_of_world, Total_population) :-  
        country(_, _, Part_of_world, Population), 
        Total_population = sum(Population). 
 
    % Average population of all cities in given part of world 
    average_city_population(Part_of_world, Average_population) :-  
        country(Country_id, _, Part_of_world, _), 
        represents(City_id, Country_id), 
        city(City_id, _, Population), 
        Average_population = Population / count(Country_id). 
 
queries 
    % Generate city for North America 
    generate_city('North America', City_id, Country_id). 
 
    % Part of world for New York City 
    part_of_world(1, Part_of_world). 
 
    % Total population of Africa 
    part_of_world_population('Africa', Total_population). 
 
    % Average population of cities in Europe 
    average_city_population('Europe', Average_population).
run 
    % Generate city for North America 
    generate_city('North America', City_id, Country_id), 
    write('New city for North America: '), 
    write(City_id), 
    write(' (Country: '), 
    write(Country_id), 
    writeln(')'). 
 
    % Part of world for New York City 
    part_of_world(1, Part_of_world), 
    write('Part of world for New York City: '), 
    writeln(Part_of_world). 
 
    % Total population of Africa 
    part_of_world_population('Africa', Total_population), 
    write('Total population of Africa: '), 
    writeln(Total_population). 
 
    % Average population of cities in Europe 
    average_city_population('Europe', Average_population), 
    write('Average population of cities in Europe: '), 
    writeln(Average_population). 
