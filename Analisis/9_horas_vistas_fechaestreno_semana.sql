/*
9. Pregunta: ¿Hay una similitud en la tendencia entre el número de lanzamientos y las horas vistas por día de la semana en 2023?
- Obtener el día de la semana de la fecha de lanzamiento.
- Utilizar CASE para nombrar los días.
- Contar el número de películas lanzadas y agruparlas por día.
- Sumar las horas vistas y agruparlas por día.
¿Por qué? Saber si existe una correlación entre el número de lanzamiento y la popularidad de los mismos dependiendo el día de la
semana de su estreno en Netflix en 2023.
*/

SELECT
EXTRACT(DOW FROM fecha_de_lanzamiento) AS dia,
CASE WHEN EXTRACT(DOW FROM fecha_de_lanzamiento) = 0 THEN 'Domingo' 
    WHEN EXTRACT(DOW FROM fecha_de_lanzamiento) = 1 THEN 'Lunes'
    WHEN EXTRACT(DOW FROM fecha_de_lanzamiento) = 2 THEN 'Martes'
    WHEN EXTRACT(DOW FROM fecha_de_lanzamiento) = 3 THEN 'Miércoles'
    WHEN EXTRACT(DOW FROM fecha_de_lanzamiento) = 4 THEN 'Jueves'
    WHEN EXTRACT(DOW FROM fecha_de_lanzamiento) = 5 THEN 'Viernes'
    WHEN EXTRACT(DOW FROM fecha_de_lanzamiento) = 6 THEN 'Sábado'
END AS dia_de_la_semana,
COUNT(*) AS numero_lanzamientos,
SUM(horas_vistas) AS numero_horas
FROM netflix_content_2023
WHERE EXTRACT(DOW FROM fecha_de_lanzamiento) IS NOT NULL
GROUP BY 1
ORDER BY 1;

/*
Insights:
Hay una tendencia positiva entre el número de lanzamientos y las horas vistas con los días de la semana. A partir del domingo
esta tendencia fue incrementando hasta llegar a su punto más alto en el día viernes. Demostrado que este día fue elegido para
estenar más títulos y que estos títulos han sido los más exitosos de 2023.

[
  {
    "dia": "0",
    "dia_de_la_semana": "Domingo",
    "numero_lanzamientos": "179",
    "numero_horas": "1935300000"
  },
  {
    "dia": "1",
    "dia_de_la_semana": "Lunes",
    "numero_lanzamientos": "436",
    "numero_horas": "3954500000"
  },
  {
    "dia": "2",
    "dia_de_la_semana": "Martes",
    "numero_lanzamientos": "995",
    "numero_horas": "5562300000"
  },
  {
    "dia": "3",
    "dia_de_la_semana": "Miércoles",
    "numero_lanzamientos": "1310",
    "numero_horas": "15744100000"
  },
  {
    "dia": "4",
    "dia_de_la_semana": "Jueves",
    "numero_lanzamientos": "1145",
    "numero_horas": "20292800000"
  },
  {
    "dia": "5",
    "dia_de_la_semana": "Viernes",
    "numero_lanzamientos": "3863",
    "numero_horas": "38217200000"
  },
  {
    "dia": "6",
    "dia_de_la_semana": "Sábado",
    "numero_lanzamientos": "238",
    "numero_horas": "5121800000"
  }
]
*/