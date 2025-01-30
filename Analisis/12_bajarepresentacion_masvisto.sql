/*
12. Pregunta: ¿Existen idiomas con baja representación pero alto promedio de horas vistas en 2023?
- Contar los títulos.
- Sumar las horas vistas.
- Promediar las horas vistas.
- Agrupar la información por el idioma.
¿Por qué? Conocer cuáles idiomas tiene pocos programas en las plataforma pero son más elegidos por los consumidores de Netflix en 2023.
*/

SELECT
idioma,
COUNT(*) AS programas,
SUM(horas_vistas) AS total_horas,
ROUND(AVG(horas_vistas),2) AS promedio_horas
FROM netflix_content_2023
GROUP BY 1
ORDER BY 4 DESC;

/*
Insights:
Hay dos idomas que tienen una baja representación pero un promedio de vistas más alto: son el Coreano y el Ruso. El Coreano
es el idioma con mayor promedio de horas vistas, pero el ruso, a pesar de no tener más de 50 títulos tiene un mayor promedio
de horas vistas que el idioma Indú, el cuál tiene una cantidad diez veces mayor de títulos.

[
  {
    "idioma": "Coreano",
    "programas": "1582",
    "total_horas": "15378400000",
    "promedio_horas": "9720859.67"
  },
  {
    "idioma": "Inglés",
    "programas": "17268",
    "total_horas": "124441700000",
    "promedio_horas": "7206491.78"
  },
  {
    "idioma": "No-Inglés",
    "programas": "3252",
    "total_horas": "10439100000",
    "promedio_horas": "3210055.35"
  },
  {
    "idioma": "Japonés",
    "programas": "2297",
    "total_horas": "7102000000",
    "promedio_horas": "3091858.95"
  },
  {
    "idioma": "Ruso",
    "programas": "39",
    "total_horas": "114600000",
    "promedio_horas": "2938461.54"
  },
  {
    "idioma": "Hindi",
    "programas": "374",
    "total_horas": "926100000",
    "promedio_horas": "2476203.21"
  }
]
*/