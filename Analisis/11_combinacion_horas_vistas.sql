/*
11. Pregunta: ¿Que combinación de idioma, tipo de contenido y disponibilidad mundial tiene mayor cantidad de horas vistas en 2023?
- Sumar las horas vistas.
- Agrupar por disponibilidad mundia, tipo de contenido e idioma.
¿Por qué? Conocer qué combinación de variables es más elegida por los usuarios de Netflix en 2023.
*/

-- TABLA

SELECT 
disponibilidad_mundial,
tipo_de_contenido,
idioma,
sum(horas_vistas) as total_horas
FROM netflix_content_2023
GROUP BY 1,2,3
ORDER BY 4 DESC
LIMIT 5;

/*
Insights:
La combinación de idioma, tipo de contenido y disponibilidad mundial con mayor alcance en 2023 fue la Series en Inglés con 
disponibilidad mundial con un total de 46,390,500,000 horas. Seguido muy de cerca por la segunda combinación más popular que fue 
la Serie en Inglés sin disponibilidad mundial con 41,750,300,000 horas.

[
  {
    "disponibilidad_mundial": "Yes",
    "tipo_de_contenido": "Show",
    "idioma": "English",
    "total_horas": "46390500000"
  },
  {
    "disponibilidad_mundial": "No",
    "tipo_de_contenido": "Show",
    "idioma": "English",
    "total_horas": "41750300000"
  },
  {
    "disponibilidad_mundial": "Yes",
    "tipo_de_contenido": "Movie",
    "idioma": "English",
    "total_horas": "19647000000"
  },
  {
    "disponibilidad_mundial": "No",
    "tipo_de_contenido": "Movie",
    "idioma": "English",
    "total_horas": "16653900000"
  },
  {
    "disponibilidad_mundial": "Yes",
    "tipo_de_contenido": "Show",
    "idioma": "Korean",
    "total_horas": "6187900000"
  }
]
*/