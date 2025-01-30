/*
10. Pregunta: ¿Un programa es más visto por estar disponible mundialmente?
- Contar los títulos.
- Sumar las horas vistas.
- Promediar las horas vistas.
- Agrupar la información por su disponibilidad mundial.
¿Por qué? Averiguar si un programa que está disponible mundialmente es más visto que uno que no está disponible.
*/

SELECT
disponibilidad_mundial,
COUNT(*) AS cantidad_programas,
SUM(horas_vistas) AS total_horas,
ROUND(AVG(horas_vistas),2) AS promedio_horas
FROM netflix_content_2023
GROUP BY 1
ORDER BY 4 DESC;

/*
Insigths:
Los títulos que están disponibles mundialmente son 7,650 y tiene un promedio de 11,145,490.20 horas, mientras que los títulos que
no tiene disponibilidad mundial son 17,162 y su promedio de horas es de 4,261,676.96. Esto significa que la disponibilidad mundial
sí influye en la cantidad de horas vistas, puesto que el promedio de horas vistas de los títulos dispnibles mundialmente es casi
tres veces mayor a aquello que no lo están. 

[
  {
    "disponibilidad_mundial": "Yes",
    "cantidad_programas": "7650",
    "total_horas": "85263000000",
    "promedio_horas": "11145490.20"
  },
  {
    "disponibilidad_mundial": "No",
    "cantidad_programas": "17162",
    "total_horas": "73138900000",
    "promedio_horas": "4261676.96"
  }
]
*/