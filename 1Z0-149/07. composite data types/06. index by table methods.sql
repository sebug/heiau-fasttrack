DECLARE
TYPE t_movie IS RECORD (
  title VARCHAR2(100)
);
TYPE tab_no IS TABLE OF t_movie
INDEX BY PLS_INTEGER;
myazaki_movies tab_no;
first_movie_idx PLS_INTEGER;
number_of_movies PLS_INTEGER;
prior_to_the_first PLS_INTEGER;
BEGIN
    
    myazaki_movies(1984).title := 'Nausicaä of the Valley of the Wind';
    myazaki_movies(1979).title := 'The Castle of Cagliostro';
    myazaki_movies(1986).title := 'Castle in the Sky';
    myazaki_movies(1988).title := 'My Neighbor Totoro';
    myazaki_movies(1989).title := q'{Kiki's Delivery Service}';
    myazaki_movies(1992).title := 'Porco Rosso';
    myazaki_movies(1997).title := 'Princess Mononoke';
    myazaki_movies(2001).title := 'Spirited Away';
    myazaki_movies(2004).title := q'{Howl's Moving Castle}';
    myazaki_movies(2008).title := 'Ponyo';
    myazaki_movies(2013).title := 'The Wind Rises';
    
    first_movie_idx := myazaki_movies.first;
    
    dbms_output.put_line(first_movie_idx);
    dbms_output.put_line(myazaki_movies.last());
    
    IF myazaki_movies.exists(1984) THEN
        dbms_output.put_line('He did a movie in 1984');
    END IF;
    
    myazaki_movies(1995).title := 'Whisper of the heart';
    
    -- Oh nevermind that one doesn't count
    myazaki_movies.delete(1995);
    
    number_of_movies := myazaki_movies.count;
    
    dbms_output.put_line(number_of_movies || ' movies in total');
    
    prior_to_the_first := myazaki_movies.prior(1979);
    
    dbms_output.put_line('Before the first movie is ' || NVL(prior_to_the_first, -1));
END;