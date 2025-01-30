/*
7. Pregunta: ¿En qué temporada del año se lanzaron los programas más populares en 2023?
- Obtener con CASE la temporada del año.
- Sumar las horas vistas y agruparlas por temporada del año.
¿Por qué? Conocer en qué temporada del año se lanzaron los productos más famosos en Netflix en 2023.
*/

SELECT
CASE WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) IN (1,2,3) THEN 1 
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) IN (4,5,6) THEN 2
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) IN (7,8,9) THEN 3
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) IN (10,11,12) THEN 4
END AS numero,
CASE WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) IN (1,2,3) THEN 'Primavera' 
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) IN (4,5,6) THEN 'Verano'
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) IN (7,8,9) THEN 'Otoño'
    WHEN EXTRACT(MONTH FROM fecha_de_lanzamiento) IN (10,11,12) THEN 'Invierno'
END AS temporada,
SUM(horas_vistas) AS total_horas
FROM netflix_content_2023
WHERE EXTRACT(MONTH FROM fecha_de_lanzamiento) IS NOT NULL
GROUP BY 1,2
ORDER BY 1;

/*
Insights:
La temporada con lanzamiento más exitosos en 2023 fueron en Invierno y Verano, guardando relación con las conclusiones del punto
anterior, puesto que, en esa temporada tenemos las vacaciones de Verano y la Navidad.

[
  {
    "numero": 1,
    "temporada": "Primavera",
    "total_horas": "21812400000"
  },
  {
    "numero": 2,
    "temporada": "Verano",
    "total_horas": "22482300000"
  },
  {
    "numero": 3,
    "temporada": "Otoño",
    "total_horas": "20604800000"
  },
  {
    "numero": 4,
    "temporada": "Invierno",
    "total_horas": "25928500000"
  }
]
*/