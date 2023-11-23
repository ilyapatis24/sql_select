SELECT music_ganre_id, COUNT(*) FROM ganremusicians
GROUP BY music_ganre_id
ORDER BY COUNT(*);

SELECT a.album_name, COUNT(song_name) 
FROM albums a JOIN songs s ON s.album_id = a.album_id
WHERE release_year IN (2019, 2020)
GROUP BY album_name;

SELECT album_id, AVG(duration) avg_dur FROM songs s
GROUP BY album_id
ORDER BY avg_dur;

SELECT DISTINCT nickname FROM musicians
WHERE nickname NOT IN (SELECT DISTINCT nickname FROM musicians m
LEFT JOIN albumsmusicians am ON am.musician_id = m.musician_id
LEFT JOIN albums a ON am.album_id = a.album_id
WHERE release_year=2020)
ORDER BY nickname;

SELECT DISTINCT collection_name FROM collection c
LEFT JOIN songscollection sc ON c.collection_id = sc.collection_id 
LEFT JOIN songs s ON sc.song_id = s.song_id 
LEFT JOIN albums a ON s.album_id = a.album_id
LEFT JOIN albumsmusicians am ON am.album_id = a.album_id 
LEFT JOIN musicians m ON am.musician_id = m.musician_id 
WHERE nickname LIKE '%Krek%'
ORDER BY collection_name;

SELECT album_name FROM albums a
LEFT JOIN albumsmusicians am ON a.album_id = am.album_id
LEFT JOIN musicians m ON m.musician_id = am.musician_id
LEFT JOIN ganremusicians gm ON m.musician_id = gm.musician_id
LEFT JOIN music_ganre g ON g.music_ganre_id = gm.music_ganre_id
GROUP BY album_name
HAVING COUNT(DISTINCT ganre_name) > 1
ORDER BY album_name;

SELECT song_name FROM songs s
LEFT JOIN songscollection sc ON sc.song_id = s.song_id
WHERE sc.song_id IS null;

SELECT DISTINCT nickname FROM musicians m 
LEFT JOIN albumsmusicians am ON m.musician_id = am.musician_id
LEFT JOIN albums a ON am.album_id = a.album_id
LEFT JOIN songs s ON a.album_id = s.album_id
WHERE duration = (SELECT MIN(duration) FROM songs);

SELECT DISTINCT album_name FROM albums a
LEFT JOIN songs s ON s.album_id = a.album_id
WHERE s.album_id IN (SELECT album_id FROM songs
GROUP BY album_id
HAVING COUNT(album_id)=(SELECT COUNT(album_id) FROM songs
GROUP BY album_id
ORDER BY COUNT
LIMIT 1))
ORDER BY album_name;
