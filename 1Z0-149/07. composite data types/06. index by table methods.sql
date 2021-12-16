DECLARE
TYPE tab_no IS TABLE OF VARCHAR2(100)
INDEX BY PLS_INTEGER;
myazaki_movies tab_no;
first_movie_idx PLS_INTEGER;
number_of_movies PLS_INTEGER;
prior_to_the_first PLS_INTEGER;
BEGIN
    
    myazaki_movies(1984) := 'Nausicaä of the Valley of the Wind';
    myazaki_movies(1979) := 'The Castle of Cagliostro';
    myazaki_movies(1986) := 'Castle in the Sky';
    myazaki_movies(1988) := 'My Neighbor Totoro';
    myazaki_movies(1989) := q'{Kiki's Delivery Service}';
    myazaki_movies(1992) := 'Porco Rosso';
    myazaki_movies(1997) := 'Princess Mononoke';
    myazaki_movies(2001) := 'Spirited Away';
    myazaki_movies(2004) := q'{Howl's Moving Castle}';
    myazaki_movies(2008) := 'Ponyo';
    myazaki_movies(2013) := 'The Wind Rises';
    
    first_movie_idx := myazaki_movies.first();
    
    dbms_output.put_line(first_movie_idx);
    dbms_output.put_line(myazaki_movies.last());
    
    IF myazaki_movies.exists(1984) THEN
        dbms_output.put_line('He did a movie in 1984');
    END IF;
    
    myazaki_movies(1995) := 'Whisper of the heart';
    
    -- Oh nevermind that one doesn't count
    myazaki_movies.delete(1995);
    
    number_of_movies := myazaki_movies.count();
    
    dbms_output.put_line(number_of_movies || ' movies in total');
    
    prior_to_the_first := myazaki_movies.prior(1979);
    
    dbms_output.put_line('Before the first movie is ' || NVL(prior_to_the_first, -1));
END;