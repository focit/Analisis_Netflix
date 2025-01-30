/*
1. Pregunta: ¿Cúal es el tipo de contenido con mayor cantidad de horas vistas en valor absoluto y porcentaje en 2023?
- Sumar el total de horas vistas y agruparlas por tipo de contenido.
- Ver el porcentaje de diferencia que hay en cada uno de los tipos de contenido.
¿Por qué? Conocer la preferencia de los usuarios sobre los dos tipos de contenido que hay en Netflix: Series o Películas en 2023
*/

SELECT
tipo_de_contenido,
SUM(horas_vistas) AS total_horas_vistas,
ROUND(SUM(horas_vistas) * 100 / SUM(SUM(horas_vistas)) OVER(), 2) AS pct_total
FROM netflix_content_2023
GROUP BY 1
ORDER BY 3 DESC;


/*
Insights:
Las Series en Netflix tuvieron una mayor preferencia en 2023, con un total de 107,764,100,000 horas que representa el 68.03% del 
tiempo registrado, a comparación de las Películas que tuvieron un total de 50,637,800,000 horas vistas, representando el 31.97%.

[
  {
    "tipo_de_contenido": "Show",
    "total_horas_vistas": "107764100000",
    "pct_total": "68.03"
  },
  {
    "tipo_de_contenido": "Movie",
    "total_horas_vistas": "50637800000",
    "pct_total": "31.97"
  }
]
*/